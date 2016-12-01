function v = setup(videoPath, framesPath, bwPath, startTime, endTime, makeFrames, makeBw)

v = VideoReader(videoPath);

if makeFrames
    mkdir(framesPath);
    mkdir(bwPath);
    v.currentTime = startTime;
    t = startTime;
    while t < endTime
        t = v.currentTime;
        vFrameData = readFrame(v);
        vFrameName = [framesPath 'imagedata_' num2str(t,'%.4f') '.png'];
        imwrite(vFrameData, vFrameName);
        bwData = rgb2gray(vFrameData);
        bwName = [framesPath 'imagedata_' num2str(t,'%.4f') '.png'];
        imwrite(bwData, bwName);
    end
end

if makeBw
    mkdir(bwPath)
    frames = dir(framesPath);
    frames(1:2) = []; % remove  '.' & '..'

    arrayfun(@(x) imwrite(rgb2gray(imread([x.folder '/' x.name])), [bwPath 'BW' x.name]), frames);
end
