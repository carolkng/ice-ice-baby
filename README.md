# ELEC 221 Final Project: Climate Change

## Outline of the outline ##

### Useful functions

* `VideoReader('videofile.mp4')`: Creates video object with name, duration, and frame rate
* `readFrame(myVideo)`: reads frame from video as image
* `imwrite(imdata,'imagefile.png')`: reads imdata into imagefile.png
* `imdata = imread('imagefile.png')`: reads imagefile.png data to imdata
* `imshow(imdata)`: displays imdata

### Questions to submit

0. (2+2) Total number of frames in video? Frame rate?
1. (2+2+2) Size (# rows, columns) of data array of each frame? Pixel height, width of each frame? Number of bits per pixel in RGB image?
2. (2) Bits per pixel in grayscale image?
3. (4) How an RGB image is converted to grayscale. Explain how built-in MATLAB function works.
4. (2) Why is conversion to grayscale a logical step before converting to B&W.
5. (4) How grayscale image is converted to B&W. Explain how built-in MATLAB function works.
6. (3) Explain how you remove date stamp from frame.
7. (2+2) Size *N* of averaging filter? How many times do you apply filter for each frame?
8. (5) Use `fft2` function to find 2D DFT of the averaging filter. Comment on the result.
9. (2) Comment on change in ice area.
10. (4) What polynomial function did you use?
11. (3) Use polynomial regression model to predict ice coverage on Sep 30, 2014.
12. (2+4) Minimum and maximum ice extent + dates? Comment on change in ice extent wrt seasons.
13. (5) Are CSV data results compatible with calculations? If not, why?
14. (4) Other more accurate techniques to extract info from NASA's video?

### Figures to submit

1. (5) Display frame stamped with date "April X, 2014" in grayscale, where `X = mod(40,30) + 1`
2. (5) Display frame from Figure 1 in black and white.
3. (3) Display frame from Figure 2 without the date stamp.
4. (5) Display frame from Figure 3 after applying the averaging filter.
5. (10) Plot change in ice area compared to value at beginning. Horizontal axis should by from `x = 1` to `x = 183` where *x* is days. Percentage change (y-axis) given by `(area(x) - area(1)) / area(1) * 100`
6. (4) Plot polynomial fit with data points from Figure 5.
7. (5) Plot daily ice extent for 2014 from http://nsidc.org/data/seaice_index/
8. (5) Plot % change in ice extent from Mar 21, 2014 to Sep 19, 2014 using CSV data