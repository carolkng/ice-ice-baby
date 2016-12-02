function grayFrames = graySetup(framesPath, grayPath)

mkdir(grayPath)
frames = dir(framesPath);
if frames(3).name == '.DS_Store'
    frames(1:3) = [];
else
    frames(1:2) = []; % remove  '.' & '..'
end

arrayfun(@(x) imwrite(rgb2gray(imread([x.folder '/' x.name])), [grayPath 'GRAY_' x.name]), frames);
grayFrames = dir(grayPath);
grayFrames(1:2) = [];

end

