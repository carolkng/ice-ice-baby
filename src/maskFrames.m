function maskedFrames = maskFrames(bwPath, maskedPath)
% Approximate area of the date stamp found through trial and error
% Rows 50-100, Columns 100-350
mkdir(maskedPath)
bwFrames = dir(bwPath);
bwFrames(1:2) = []; % remove  '.' & '..'

for i = 1:numel(bwFrames)
    bwImage = bwFrames(i);
    data = imread([bwPath bwImage.name]);
    data(50:100,100:350) = 0;
    imwrite(data, [maskedPath 'MASK_' bwImage.name(3:numel(bwImage.name))]);
end

maskedFrames = dir(maskedPath);
maskedFrames(1:2) = [];

end
