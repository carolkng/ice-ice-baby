function bwFrames = bwSetup(grayPath, bwPath)

mkdir(bwPath)
grayFrames = dir(grayPath);
grayFrames(1:2) = []; % remove  '.' & '..'

arrayfun(@(x) imwrite(rgb2gray(imread([x.folder '/' x.name])), [bwPath 'BW_' x.name(5:numel(x.name))]), grayFrames);
bwFrames = dir(bwPath);
bwFrames(1:2) = [];

end

