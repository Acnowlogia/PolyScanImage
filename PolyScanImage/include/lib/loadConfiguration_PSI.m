function path_CFG = loadConfiguration_PSI(obj,configPath)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Created by Jianian Lin
% Date created: 10/20/2021
% load configuration of PolyScanImage
% loadConfiguration_PSI(obj,configDir)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Check existence of configuration file
fprintf('Loading configuration...'); 

path_CFG = which(configPath); 
if isempty(path_CFG)
    fprintf('\nError: Cannot find configuration file.\n'); 
    return
end

configList = struct2cell(load(path_CFG)); configList = configList{1}; 
configDir = configList(1).value; 
for k = 2 : size(configList,1)
    if ~isprop(obj,configList(k).name) || isempty(eval(['obj.',configList(k).name]))
        fprintf(['\nWarning: ',configList(k).description,' handle do not exist.\n'])
        return
    end
    if ~exist([configDir,configList(k).value],'file')
        fprintf(['\nWarning: ',configList(k).description,' CFG file lost.\n'])
        return
    end
end

% Load configuration
for k = 2 : length(configList)
    loadCFG(eval(['obj.',configList(k).name]),[configDir,configList(k).value]); 
end

fprintf('Done!\n')
end