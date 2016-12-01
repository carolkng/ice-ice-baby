function grayFrames = graySetup(framesPath, grayPath)

mkdir(grayPath)
frames = dir(framesPath);
frames(1:2) = []; % remove  '.' & '..'

arrayfun(@(x) imwrite(rgb2gray(imread([x.folder '/' x.name])), [grayPath 'GRAY_' x.name]), frames);
grayFrames = dir(grayPath);
grayFrames(1:2) = [];

end

