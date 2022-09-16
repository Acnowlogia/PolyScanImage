function I = data2image(data,pixelsPerLine,zoom,samplesPerRecord,recordsPerBuffer,channelCount,lineShift)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Created by Jianian Lin
% Date created: 10/18/2021
% transform stream data from DAQ board to raster image data(row and column permuted)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
data = reshape(data.',[samplesPerRecord,recordsPerBuffer*channelCount]);
data = cat(1,data,zeros(pixelsPerLine*zoom-samplesPerRecord,recordsPerBuffer*channelCount));
data = reshape(data,[pixelsPerLine,zoom*recordsPerBuffer,channelCount]);
I = 0 * data;

temp = ((1:recordsPerBuffer)-1)*zoom; 
for k = 1 : zoom
    rows = temp + k;
    if lineShift(k) >= 0
        I(lineShift(k)+1:pixelsPerLine,rows,:) = data(1:pixelsPerLine-lineShift(k),rows,:);
    else
        I(1:pixelsPerLine+lineShift(k),rows,:) = data(1-lineShift(k):pixelsPerLine,rows,:);
    end
end

end