function focus_PSI(obj)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Created by Jianian Lin
% Date created: 10/19/2021
% FOCUS function of polyscanimage
% focus_PSI(app)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

AlazarDefs;
run(obj.hMain.UserSettingsEditField.Value);

% Stop output until preparation finished
obj.hBeams.stopOutputBeam;
obj.hWfms.stopOutputWfm;

% Connect Alazar board
boardHandle = obj.hMain.hBoard;

% Parameters
%	Main controls
zoom = obj.hMain.ZoomDropDown.Value;
framesPerAcquisition = obj.hMain.TotalFrameEditField.Value; 
offset = uint16(obj.hMain.offset);
avg = obj.hMain.AvgEditField.Value;
% 	Configuration controls
pixelsPerLine = obj.hConfig.PixelsPerLineEditField.Value;
linesPerFrame = obj.hConfig.LinesPerFrameEditField.Value; 
trigFreq = obj.hConfig.trigFreq;
scanPhase = obj.hConfig.ScanPhaseEditField.Value; 
fillFraction = obj.hConfig.FillFractionEditField.Value;
preTriggerSamples = zoom * floor(pixelsPerLine / 2 * fillFraction) - round(scanPhase / 360 * (pixelsPerLine * zoom));
postTriggerSamples = zoom * floor(pixelsPerLine / 2 * fillFraction) + round(scanPhase / 360 * (pixelsPerLine * zoom));
samplesPerRecord = preTriggerSamples + postTriggerSamples;
%   Images controls
channelMask = obj.hImage.channelMask_Disp;
channelCount = obj.hImage.channelCount_Disp;
if obj.hImage.Channel1DispCheckBox.Value
    white = obj.hImage.Channel1WhiteEditField.Value; 
    black = obj.hImage.Channel1BlackEditField.Value; 
    invert = obj.hImage.Channel1InvertCheckBox.Value; 
else
    white = obj.hImage.Channel2WhiteEditField.Value; 
    black = obj.hImage.Channel2BlackEditField.Value; 
    invert = obj.hImage.Channel2InvertCheckBox.Value; 
end

% Fast Stage Imaging?
if obj.hWfms.FastStageimagingCheckBox.Value
    fastStage = true; 
    fastStageData = obj.hFastStage.StagePositionsTable.Data; 
    stagePosition = 1; 
    obj.hMain.StagePositionEditField.Value = stagePosition;
    stayFrames = 0; 
    hStage = evalin('base',stageHandleName);
    hStage.setPosition(fastStageData(stagePosition,1),fastStageData(stagePosition,2),fastStageData(stagePosition,3));
    obj.hMain.TotalStagePositionEditField.Value = size(fastStageData,1); drawnow;
else
    fastStage = false; 
end

% Specifiy the total number of buffers to capture
buffersPerFrame = linesPerFrame / zoom / recordsPerBuffer;
if buffersPerFrame < 1
    recordsPerBuffer = (linesPerFrame / zoom) * ceil(recordsPerBuffer / (linesPerFrame / zoom)); 
    buffersPerFrame = linesPerFrame / zoom / recordsPerBuffer; 
elseif buffersPerFrame ~= floor(buffersPerFrame)
    buffersPerFrame = floor(buffersPerFrame); 
    linesPerFrame = zoom * recordsPerBuffer * buffersPerFrame; 
    obj.hConfig.LinesPerFrameEditField.Value = linesPerFrame; 
    obj.updateAll;
end

buffersPerAcquisition = 2^16;	% Set as large as possible when focusing
obj.hMain.TotalFrameEditField.Value = inf; 

% Get the sample and memory size
[retCode,boardHandle,maxSamplesPerRecord,bitsPerSample] = calllib('ATSApi','AlazarGetChannelInfo',boardHandle,0,0); 
if retCode ~= ApiSuccess
    fprintf('Error: AlazarGetChannelInfo failed -- %s\n',errorToText(retCode)); 
    return
end
if samplesPerRecord > maxSamplesPerRecord
    fprintf('Error: Invalid samples per record %u max %u\n',samplesPerRecord,maxSamplesPerRecord);
    return
end

% Calculate the size of each buffer in bytes
bytesPerSample = floor((double(bitsPerSample) + 7) / double(8));
samplesPerBuffer = samplesPerRecord * recordsPerBuffer * channelCount;    
bytesPerBuffer = bytesPerSample * samplesPerBuffer;

% TODO: Select the number of DMA buffers to allocate.
% The number of DMA buffers must be greater than 2 to allow a board to DMA into
bufferCount = uint32(16);

% Create an array of DMA buffers 
buffers = cell(1, bufferCount);
for j = 1 : bufferCount
    pbuffer = calllib('ATSApi','AlazarAllocBufferU16',boardHandle,samplesPerBuffer);
    if pbuffer == 0
        fprintf('Error: AlazarAllocBufferU16 %u samples failed\n',samplesPerBuffer);
        return
    end
    buffers(1,j) = { pbuffer };
end

% Set the record size 
retCode = calllib('ATSApi', 'AlazarSetRecordSize',boardHandle,preTriggerSamples,postTriggerSamples);
if retCode ~= ApiSuccess
    fprintf('Error: AlazarBeforeAsyncRead failed -- %s\n',errorToText(retCode));
    return
end

% Calculate index for image to display
lineShift = lineShift(8/zoom:8/zoom:end);
if isempty(obj.hImage.chanDispFigure) || ~isvalid(obj.hImage.chanDispFigure)
    obj.hImage.update;
end
Plot = obj.hImage.chanDispFigure;
Plot.Children.CLim = [black,white]; 

% TODO: Select AutoDMA flags as required
% ADMA_EXTERNAL_STARTCAPTURE - call AlazarStartCapture to begin the acquisition
% ADMA_TRADITIONAL_MODE - Acquire multiple records optionally with pretrigger samples and record headers
% ADMA_INTERLEAVE_SAMPLES - interleave samples for highest throughput
admaFlags = ADMA_EXTERNAL_STARTCAPTURE + ADMA_TRADITIONAL_MODE + ADMA_INTERLEAVE_SAMPLES;

% Configure the board to make an AutoDMA acquisition
recordsPerAcquisition = recordsPerBuffer * buffersPerAcquisition;
retCode = calllib('ATSApi','AlazarBeforeAsyncRead',boardHandle,channelMask,-int32(preTriggerSamples),samplesPerRecord,recordsPerBuffer,recordsPerAcquisition,admaFlags);
if retCode ~= ApiSuccess
    fprintf('Error: AlazarBeforeAsyncRead failed -- %s\n',errorToText(retCode));
    return
end

% Post the buffers to the board
for bufferIndex = 1 : bufferCount
    pbuffer = buffers{1, bufferIndex};
    retCode = calllib('ATSApi', 'AlazarPostAsyncBuffer',boardHandle,pbuffer,bytesPerBuffer);
    if retCode ~= ApiSuccess
        fprintf('Error: AlazarPostAsyncBuffer failed -- %s\n',errorToText(retCode));
        return
    end        
end

% Arm the board system to wait for triggers
retCode = calllib('ATSApi', 'AlazarStartCapture',boardHandle);
if retCode ~= ApiSuccess
    fprintf('Error: AlazarStartCapture failed -- %s\n',errorToText(retCode));
    return
end

% Output waveforms
obj.hBeams.startOutputBeam;
obj.hWfms.startOutputWfm;
obj.hStimulate.startStimulation;

% Wait for sufficient data to arrive to fill a buffer, process the buffer,
% and repeat until the acquisition is complete
updateTickCount = tic; 
updateInterval_sec = 0.1; 
buffersCompleted = 0; 
framesCompleted = 0; 
captureDone = false; 
buffersInFrame = 1; 
linesInFrame = 0; 
frameDisplayed = 0; 
frameNeedAvg = 1; 
temp = zeros(pixelsPerLine,linesPerFrame,avg,'uint16');

tic
while ~captureDone
    bufferIndex = mod(buffersCompleted, bufferCount) + 1;
    pbuffer = buffers{1, bufferIndex};

    % Wait for the first available buffer to be filled by the board
    [retCode, boardHandle, bufferOut] = ...
        calllib('ATSApi', 'AlazarWaitAsyncBufferComplete', boardHandle, pbuffer, bufferTimeout_ms);
    if retCode == ApiSuccess 
        % This buffer is full
        bufferFull = true;
        captureDone = false;
    elseif retCode == ApiWaitTimeout 
        % The wait timeout expired before this buffer was filled.
        % The board may not be triggering, or the timeout period may be too short.
        fprintf('Error: AlazarWaitAsyncBufferComplete timeout -- Verify trigger!\n');
        bufferFull = false;
        captureDone = true;
    else
        % The acquisition failed
        fprintf('Error: AlazarWaitAsyncBufferComplete failed -- %s\n', errorToText(retCode));
        bufferFull = false;
        captureDone = true;
    end
    
    % Process sample data in this buffer
    if bufferFull
        setdatatype(bufferOut, 'uint16Ptr', 1, samplesPerBuffer); 
        data = bufferOut.Value; 
        if invert
            data = offset - data; 
        else
            data = data - offset; 
        end
        data = data2image(data,pixelsPerLine,zoom,samplesPerRecord,recordsPerBuffer,channelCount,lineShift);
        data = data(:,:,1);
        

        if buffersPerFrame <= 1
            if toc > 0.1
                temp(:,:,frameNeedAvg) = data(:,1:linesPerFrame); 
                Plot.CurrentAxes.Children.CData = mean(temp,3).';
                drawnow limitrate
                tic
            end
        else
            temp(:,linesInFrame+1:linesInFrame+size(data,2),frameNeedAvg) = data;
            Plot.CurrentAxes.Children.CData = mean(temp,3).';
            drawnow limitrate
            linesInFrame = linesInFrame + size(data,2); 
            if linesInFrame == linesPerFrame
                linesInFrame = 0; 
            end
        end
        
        % Make the buffer available to be filled again by the board
        retCode = calllib('ATSApi', 'AlazarPostAsyncBuffer', boardHandle, pbuffer, bytesPerBuffer);
        if retCode ~= ApiSuccess
            fprintf('Error: AlazarPostAsyncBuffer failed -- %s\n', errorToText(retCode));
            captureDone = true;
        end
        
        % Update progress
        if buffersPerFrame > 1
            buffersInFrame = buffersInFrame + 1;
            if buffersInFrame == buffersPerFrame
                buffersInFrame = 0;
                framesCompleted = framesCompleted + 1;
                frameNeedAvg = mod(frameNeedAvg + 1,avg) + 1;
                if fastStage
                    stayFrames = stayFrames + 1;
                end
            end
        else
            framesCompleted = framesCompleted + 1 / buffersPerFrame;
            frameNeedAvg = mod(frameNeedAvg + 1,avg) + 1;
            if fastStage
                stayFrames = stayFrames + 1 / buffersPerFrame; 
            end
        end
        if fastStage
            if stayFrames >= fastStageData(stagePosition,4)
                stayFrames = 0; 
                stagePosition = mod(stagePosition,size(fastStageData,1)) + 1; 
                obj.hMain.StagePositionEditField.Value = stagePosition;
                hStage.setPosition(fastStageData(stagePosition,1),fastStageData(stagePosition,2),fastStageData(stagePosition,3));
            end
        end
        obj.hMain.FramesDoneEditField.Value = framesCompleted; drawnow limitrate
        buffersCompleted = buffersCompleted + 1;
        if buffersCompleted >= buffersPerAcquisition
            captureDone = true;
        elseif toc(updateTickCount) > updateInterval_sec
            updateTickCount = tic;
            if obj.hMain.FOCUSButton.Value == 0
                break
            end
        end
    end % if bufferFull
end % while ~captureDone

% Abort the acquisition
retCode = calllib('ATSApi', 'AlazarAbortAsyncRead',boardHandle);
if retCode ~= ApiSuccess
    fprintf('Error: AlazarAbortAsyncRead failed -- %s\n',errorToText(retCode));
end

% Release the buffers
for bufferIndex = 1:bufferCount
    pbuffer = buffers{1,bufferIndex};
    retCode = calllib('ATSApi','AlazarFreeBufferU16',boardHandle,pbuffer);
    if retCode ~= ApiSuccess
        fprintf('Error: AlazarFreeBufferU16 failed -- %s\n',errorToText(retCode));
    end
    clear pbuffer;
end

% Stop wavefroms output and finish panel update
obj.hBeams.stopOutputBeam;
obj.hWfms.stopOutputWfm;
obj.hMain.TotalFrameEditField.Value = framesPerAcquisition;
obj.hStimulate.stopStimulation

obj.hMain.FOCUSButton.Text = 'FOCUS';
obj.hMain.FOCUSButton.Value = 0;
obj.hMain.GRABButton.Visible = true;
obj.hMain.LOOPButton.Visible = true;

end