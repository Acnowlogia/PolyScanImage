%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% PolyScanImage_Machine Configuration File
% Created by Jianian Lin
% Date created: 10/20/2021
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% PolyScanImage

% Data file Info
mainDir = 'E:\LJN\Optical GearBox\PolyScanImage\';     % Directory of PolyScanImage main folder
dataDir = 'E:\LJN\Optical GearBox\PolyScanImage\data\';     % Directory to captured data. If unspecified, default directory set as [mainDir '\data'].
configPath = 'E:\LJN\Optical GearBox\PolyScanImage\configData\Configuration.mat';     % Path to configuration files, default directory set as [mainDir '\configData\configration.mat'].
maxDataSize = 2 * (2^30);     % Default max tiff data size, 2^10 byte = 1 KB, 2^20 byte = 1 MB, 2^30 byte = 1 GB.

%% Shutters
% Shutter used to prevent any beam exposure from reaching specimen during idle periods. 

shutterDaqDevice = 'PXI2Slot4';     % String specifying the DAQ device for each shutter eg {'PXI2Slot4'}
shutterChannelID = 'port1/line1';     % String specifying the corresponding channel on the device for each shutter e.g. {'port1/line1'}

shutterOpenLevel = true;     % Logical or 0/1 scalar indicating TTL level (0=LO;1=HI) corresponding to shutter open state for each shutter line.
shutterOpenTime = 0.1;     % Time, in seconds, to delay following certain shutter open commands (e.g. between stack slices), allowing shutter to fully open before proceeding.

%% DAQ Board (Alazar ATS9440)
samplesPerSec = 80e6;     % integer specifying Alazar board sampling rate per channel, must the same with that in 'configureBoard_V4.m'
recordsPerBuffer = 3000;     % integer specifying the number of records per channel per DMA buffer. 
bufferTimeout_ms = 5000;     % Time, in milliseconds, specifying a buffer timeout. 
systemId = int32(1);     % Integer, Alazar system ID
boardId = int32(1);     % Integer, Alazar board ID
Channel1 = 'CHANNEL_A';     % String identifying the Alazar board channel for PMT / Photodiode input
Channel2 = 'CHANNEL_B';     % String identifying the Alazar board channel for optical trigger
% Connect line trigger signal to TRIG IN on Alazar board. 
% Connect external clock (80MHz) signal to ECLK terminal on Alazar board. 
% Setting of external clock and trigger see 'configureBoard_PSI.m'

%% Beams
% Device (e.g. EOM or AOD) used to modulate beam power during idle periods. 

beamModDevices = 'PXI2Slot4';     % String identifying the NI-DAQ board for beam modulation. 

beamModChanID = 0;     % Integer specifying AO channel ID for beam modulation channel. 
beamModVoltageRange = [0,1.6];     % [V]: Specifying voltage range for beam modulation. 
beamCalData = 'beamCalData.mat';     % Filename to open default beam calibration data, leave empty if data file not exist. 

beamModCalInputChanID = 0;     % Integer specifying AI channel ID for beam modulation calibration channel. Values of nan specify no calibration, beamCalData should no be empty in this situation. 
beamModCalOffset = 0;     % [V]: Beam calibration offset voltage. 

%% Trigger and clock
triggerFrequencyDeviceName = 'Xseries0';     % String identifying the NI-DAQ board to be used to count line trigger frequency. 
triggerFrequencyChanID = 'ctr0';     % The numeric ID of the counter channel to be used to count line trigger frequency. 
lineTriggerDeviceName = 'Xseries0';     % String identifying the NI-DAQ board to be used to output line trigger to synchronize Alazar board. 
lineTriggerChanID = 2;     % Use analog channel here to eliminate delay uncertainty between Digital Channel and Analog Channel on NI-DAQ board. 
digitalTriggerName = {'Xseries0/PFI0','PXI2Slot4/PFI0'};     % Cell array of strings identifying start trigger of all output waveforms
digitalClockName = {'XSeries0/PFI2','PXI2Slot4/PFI2'};     % Cell array of strings identifying external clock of all output waveforms
digitalClockRate = 120000;     % [Hz]: nominal frequency of the external clock rate of output waveforms (e.g. 8 * 15000); actual rate is measured on FPGA

%% PolyScan (ImagingScanner)

polygonFacetAngularRange = 40;     % Angular range in optical degrees for each polyonal scanner facet. (e.g. 40 = 2 * 360 / 18 for 18 facet polygonal scanner)
nominalPolyScanFreq = 15000;     % [Hz]: nominal frequency of the polygonal scanner (e.g. 15000Hz = 50000rpm * 18 for 18 facet polygonal scanner)
externalSampleClockRate = 80e6;     % [Hz]: nominal frequency of the external sample clock connected to the Alazar ECLK terminal(e.g. 80e6); actual rate is measured on Alazar board

% Galvo mirror settings
galvoDeviceName = 'Xseries0';     % String identifying the NI-DAQ board to be used to control the galvo(s). 
galvoAOChanIDX = 3;     % The numeric ID of the Analog Output channel to be used to control the X Galvo. 
galvoAOChanIDY = 1;     % The numeric ID of the Analog Output channel to be used to control the Y Galvo. 

xGalvoAngularRange = 20;     % Max range in optical degrees (pk-pk) for x galvo. 
yGalvoAngularRange = 20;     % Max range in optical degrees (pk-pk) for y galvo. 

xGalvoOffsetVoltage = 0;
yGalvoOffsetVoltage = 0;

polygonMagnificationX = 1.60;     % Scalar of polygonal scanner actual scan optical degrees at X Galvo after relay lens magnification.
yGalvoDenseSamplingRatio = 0.89;     % Scalar identifying yGalvo dense sampling ratio(actual scan range compare to linesPerFrame / pixelsPerLine * x direction scan angle)

galvoVoltsPerOpticalDegreeX = 0.960;     % Galvo conversion factor from optical degrees to volts (negative values invert scan direction)
galvoVoltsPerOpticalDegreeY =  0.863;     % Galvo conversion factor from optical degrees to volts (negative values invert scan direction)

% galvoParkDegreesX = 0;     % Numeric [deg]: Optical degrees from center position for X galvo to park at when scanning is inactive
% galvoParkDegreesY = 0;     % Numeric [deg]: Optical degrees from center position for Y galvo to park at when scanning is inactive

galvoFlyback = 4;    % Integer: Y galvo flyback time / polygonal scanner facet period

%% AOD
% AOD used to segmentize one line into multiple lines to increase scanning line rate. 
AODDeviceName = 'Xseries0';     % String identifying the NI-DAQ board to be used to control the AOD. 
AODFreqAOChanID = 0;     % The numeric ID of Analog Output channel to be used to control the AOD frequency. 

AODFreqVoltageRange = [0 10];     % AOD frequency control input voltage limit
lineShift = [23  24  24  21  -24  -21  -16  -15];     % Array of scalars, shift each segmented line correspond to an AOD frequency when display. 
AODFreq = [7.26  6.58  5.93  5.54  2.00  2.58  3.22  4.00];     % Array of scalars to specify AOD frequency control voltage levels. 

%% Fast Z (piezo actuator)
piezoDeviceName = 'PXI2Slot4';     % String identifying the NI-DAQ board to be used to output waveform or trigger to function generator which control piezo actuator. 
piezoChanID = 1;     % The numeric ID of the Analog Output channel to be used to control the piezo actuator. 
piezoTravelRange = 200;     % Max range in microns (pk-pk) for piezo actuator. 
piezoVoltsPerMicron = 0.05;     % Piezo conversion factor from microns to volts. 

%% Fast Stage
stageHandleName = 'hStage';     % ESP301 controller handle in workspace
stageMovingRangeX = [0,25];     % Moving range in mm for X axes
stageMovingRangeY = [0,25];     % Moving range in mm for Y axes
stageMovingRangeZ = [0,25];     % Moving range in mm for Z axes

%% Stimulation (relay)
stimulationDeviceName = 'Xseries0';     % String identifying the NI-DAQ board to be used to output digital signal to control relay module. 
stimulationChanID = 'Port0/Line8';     % String specifying the corresponding channel on the device for stimulation.
