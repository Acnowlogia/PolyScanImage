%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% tiffwrite
% Created by Jianian Lin
% Date Created: 04/19/2020
% Last modified date: 07/11/2022
% Class to write tiff stack
% Example: 
% ftif = tiffwrite(filename);
% for k = 1 : size(I,3)
%     ftif.write(permute(uint16(I(:,:,k)),[2,1,3]));
% end
% ftif.close
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

classdef tiffwrite_PSI < handle
    
    properties (SetAccess = immutable, Hidden = true)
        fid
    end
    
    properties (SetAccess = protected, Hidden = true)
        tagList %TagList (store as list of uint32)
        dataType
        imageStartPosition %start byte for each images
    end
    
    methods
        
        function obj = tiffwrite_PSI(filename)
            obj.fid = fopen(filename,'w');
            fwrite(obj.fid,0,'uint64'); % taglist position info, to be overwrite when close
        end
        
        function write(obj,I)
            if isempty(obj.tagList)
                obj.dataType = class(I);
                switch obj.dataType
                    case {'single'}
                        bitsPerSample = 32; 
                    case {'uint32'}
                        bitsPerSample = 32; 
                    case {'uint16'}
                        bitsPerSample = 16; 
                    case {'uint8'}
                        bitsPerSample = 8; 
                    otherwise
                        fclose(obj.fid);
                        error('cannot write this data type to tiff')
                end
                % 16 byte data type + 16 byte tag ID + 32 byte data num + 32 byte data
                obj.tagList = [262400,1,size(I,1), ...              % ImageWidth
                                     262401,1,size(I,2), ...                % ImageLength
                                     196866,1,bitsPerSample, ...    % BitsPerSample
                                     196870,1,1, ...                           % PhotometricInterpretation
                                    ]; 
            end
            obj.imageStartPosition = cat(1,obj.imageStartPosition,ftell(obj.fid));%start of the image
            fwrite(obj.fid,I,obj.dataType);
        end
        
        function close(obj)
            tagListStartPosition = ftell(obj.fid); 
            tagNum = length(obj.tagList) / 3 + 1; 
            for k = 1:length(obj.imageStartPosition)
                tempTagList = [obj.tagList, ...
                            262417,1,obj.imageStartPosition(k), ... % StripOffsets
                        ]; 
                fwrite(obj.fid,uint16(tagNum),'uint16');
                fwrite(obj.fid,tempTagList,'uint32'); % write entire taglist
                if k == length(obj.imageStartPosition)
                    fwrite(obj.fid,0,'uint32');
                else
                    fwrite(obj.fid,ftell(obj.fid)+4,'uint32');
                end
            end
            
            % save tag list position info to first 64 bits of file
            fseek(obj.fid,0,'bof'); 
            fwrite(obj.fid,18761,'uint16'); % tag list header 'II*' 
            fwrite(obj.fid,42,'uint16'); 
            fwrite(obj.fid,tagListStartPosition,'uint32');
            fclose(obj.fid);
        end
        
    end
    
end