function path_CFG = saveConfiguration_PSI(obj,configPath)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Created by Jianian Lin
% Date created: 10/22/2021
% save configuration of PolyScanImage
% saveConfiguration_PSI(obj,configDir)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Check existence of configuration file
fprintf('Saving configuration...'); 

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

% Save configuration
for k = 2 : length(configList)
    saveCFG(eval(['obj.',configList(k).name]),[configDir,configList(k).value]); 
end

fprintf('Done!\n')
end