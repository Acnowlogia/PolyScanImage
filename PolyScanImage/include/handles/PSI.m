%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% PolyScanImage_PSI
% Control all handles of polyscanimage
% Created by Jianian Lin
% Date created: 10/21/2021
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

classdef PSI
    % PolyScanImage handles
    %   Detailed explanation goes here
    
    properties
        % Handles
        hMain      % AlazarTech board for DAQ
        hConfig     % Configuration controls
        hWfms       % Waveform controls
        hImage      % Image controls
        hBeams      % Power controls
        hStimulate     % Stimulation controls
        hFastStage     % Fast stage imaging controls
    end
    
    methods (Access = public)
        function obj = startupFcn(obj)
            % Get handles
            obj.hMain = mainControlsV4(obj);     % Main controls
            if ~isvalid(obj.hMain)
                evalin('base','clear hPSI' );
                return
            end
            obj.hConfig = configControlsV4(obj);     % Configuration controls
            obj.hWfms = wfmControlsV4(obj);     % Waveform controls 
            obj.hImage = imageControlsV4(obj);     % Image controls 
            obj.hBeams = powerControlsV4(obj);     % Power controls 
            obj.hStimulate = stimulationControlsV4(obj);     % Stimulation controls 
            obj.hFastStage = fastStageControlsV4(obj);     % Fast stage imaging controls
            
            
            path_USR = obj.hMain.UserSettingsEditField.Value; 
            run(path_USR); 
            path_CFG = loadConfiguration_PSI(obj,configPath); 
            obj.hMain.ConfigurationEditField.Value = path_CFG; 
        end
        
        function closeRequest(obj)
            obj = evalin('base','hPSI');
            handleList = properties(PSI);
            for k = 1 : length(handleList)
                if ~eval(['isempty(','obj.',handleList{k},')'])
                    eval(['obj.',handleList{k},'.exitHandle;']);
%                     eval(['delete(obj.',handleList{k},');']);
                end
            end
            evalin('base','clear(''hPSI'',''handleList'',''k'')')
            fprintf('Exit PolyScanImage.\n');
        end
        
        function updateAll(obj)
            obj = evalin('base','hPSI');
            handleList = properties(PSI);
            for k = 1 : length(handleList)
                if ~eval(['isempty(','obj.',handleList{k},')'])
                    eval(['obj.',handleList{k},'.update']);
                end
            end
            evalin('base','clear(''handleList'',''k'')')
        end
    end
end

