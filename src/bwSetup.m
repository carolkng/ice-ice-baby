function bwFrames = bwSetup(grayPath, bwPath)

mkdir(bwPath)
grayFrames = dir(grayPath);
grayFrames(1:2) = []; % remove  '.' & '..'

for i = 1:numel(grayFrames)
    fname = grayFrames(i).name;
    data = imbinarize(imread([grayPath fname]));
    imwrite(data, [bwPath 'BW_' fname(5:numel(fname))]);
end

bwFrames = dir(bwPath);
bwFrames(1:2) = [];

end

