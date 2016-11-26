videoPath = '../media/video.mp4';
framesPath = '../media/frames/';
mkdir('../media/frames');

v = VideoReader(videoPath);
v_height = v.Height;
v_width = v.Width;
v_frameRate = v.FrameRate;

% Question 0
disp('Question 0:');
disp(['Number of frames: 3081']);
disp(['Frame rate: ' num2str(v_frameRate)]);

i = 0;
t = 45;
v.currentTime = 45;
while t < 57
    t = v.currentTime;
    vFrameData = readFrame(v);
    vFrameName = [framesPath 'imagedata_' num2str(t,'%.4f') '.png'];
    imwrite(vFrameData, vFrameName);
end

% Question 1
disp('Question 1:');
disp(['Rows of data array: ' num2str(v_height)]);
disp(['Columns of data array: ' num2str(v_width)]);
disp(['Depth of data array: ' num2str(3)]);

disp(['Height (pixels) of each frame: ' num2str(v_height)]);
disp(['Width (pixels) of each frame: ' num2str(v_width)]);

disp(['Bits in each frame: ' num2str(2764800/720/1280*8)]);
