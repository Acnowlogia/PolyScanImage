function boardHandle = getBoardHandle(systemId,boardId)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Created by Jianian Lin
% Date created: 10/20/2021
% Get Alazar DAQ board handle
% boardHandle = getBoardHandle(systemId,boardId)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

AlazarDefs;

% Load driver library 
if ~alazarLoadLibrary()
    fprintf('\nError: ATSApi.dll not loaded\n'); 
    return
end

% Get a handle to the board
boardHandle = calllib('ATSApi', 'AlazarGetBoardBySystemID', systemId, boardId); 
setdatatype(boardHandle, 'voidPtr', 1, 1);
if boardHandle.Value == 0
    fprintf('\nError: Unable to open board system ID %u board ID %u\n', systemId, boardId); 
    return
end

% Configure the board's sample rate, input, and trigger settings
if ~configureBoard_PSI(boardHandle)
    fprintf('\nError: Board configuration failed\n'); 
    return
end

end