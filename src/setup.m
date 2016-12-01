function v = setup(videoPath, framesPath, startTime, endTime)

v = VideoReader(videoPath);

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
