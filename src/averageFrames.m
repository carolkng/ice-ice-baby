function aFrames = averageFrames( maskedPath, averagePath )

N = 3;                  % Size of averaging filter
A = ones(N,N) * 1/N^2;  % Averaging filter matrix
T = 4;                  % Times to apply averaging filter

maskedFrames = dir(maskedPath);
maskedFrames(1:2) = [];

mkdir(averagePath);

for j = 1:numel(maskedFrames)
    fname = maskedFrames(j).name;
    data = imread([maskedFrames(j).folder '/' fname]);
    for l = 1:T
        data = imfilter(data, A);
    end
    imwrite(data, [averagePath 'A_' fname(6:numel(fname))])
end

disp('Averaging filter fft2');
fft2(A)

aFrames = dir(averagePath);
aFrames(1:2) = [];

end

