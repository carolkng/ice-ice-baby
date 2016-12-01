videoPath = '../media/video.mp4';
framesPath = '../media/frames/';
bwPath = '../media/bwframes/';

startTime = 43.345;
endTime = 56.7;
makeFrames = 0;
makeBw = 1;

video = setup(videoPath, framesPath, bwPath, startTime, endTime, makeFrames, makeBw);

v_height = video.Height;
v_width = video.Width;
v_frameRate = video.FrameRate;

frames = dir(bwPath);
frames(1:2) = [];

frameX = frames(41); % get frame from April 11th, 2014
imshow(imread([frameX.folder '/' frameX.name]));
