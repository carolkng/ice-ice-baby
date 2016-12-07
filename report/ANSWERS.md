# ELEC 221 Final Project: Climate Change

### Running list of answers

0. Frames: 3081. 
    
    Frame rate: 29.97

1. Size of data array: 720 x 1280 x 3. 
    
    Pixel height: 720. 
    
    Pixel width: 1280. 
    
    Bits per pixel (RGB): 24

2. Bits per pixel (grayscale): 8
3. Using the built-in MATLAB function rgb2gray, the R, G, and B values (8 bits each) are converted to a single, 8-bit grayscale value using the algorithm `Y = 0.2989 * R + 0.5870 * G + 0.1140 * B`, where Y is then floored to an integer value between 0 and 255 before being returned.
4. The final output of a black and white conversion is a 2D array of values with type logical, but we are starting with an RGB image, which is a 3D array with values of type uint8.
    
    The grayscale conversion is logical intermediate step because it converts the original 3D RGB array to a 2D array, before the black and white conversion process converts the uint8 values into logical values.

5. Conversion to black and white is performed using MATLAB's built in `imbinarize` function, which takes in the 2D array for a grayscale image, and a threshold obtained using [Otsu's Method](https://en.wikipedia.org/wiki/Otsu%27s_method), which automatically chooses a threshold based on the distribution of lighter and darker pixels in the image. If a pixel is lighter than the threshold (ie. its grayscale value is *higher* than the threshold), then it is assigned the value `1`, which corresponds to a white pixel. if the pixel is darker than the threshold (ie. its grayscale value is *lower* than the threshold), then it is assigned the value `0`, which corresponds to a black pixel.
6. By trial and error, I found that the date stamp of the frames was generally located inside the rectangle formed by the points: `(100,50)`, `(100, 100)`, `(350,50)`, and `(350,100)`, where the point `(x,y)` corresponds to the pixel at the `x`th column and `y`th row. Then, I set all the entries in the array lying within that rectangle to `0`, as the date stamp is in a white font on a black background.
7. I used an averaging filter of size `N = 3`, and applied it 4 times per frame.
8. The two dimensional Fourier transform of my averaging filter matrix is:
    
    `1 0 0`
    
    `0 0 0`
    
    `0 0 0`
    
    The 2D DFT only has one nonzero entry and is the same size as the original filter matrix. This suggests to me that the averaging filter in the frequency domain is composed of only one sinusoid, and is acting as a low-pass filter that allows frequencies lower than the one sinusoid to passed, and attenuates the higher frequencies in the image by a factor of `1/N^2`.

9. As we get closer and closer to September, the rate at which the ice area grows begins to slow down. Since the seasons in the Southern hemisphere are opposite to those that we experience in North America, we can see that winter is ending in Septembe, and the warming temperatures make the daily increases in ice area smaller and smaller.
10. `y = -0.0016x^2 + 0.6312x - 0.8432`
11. The polynomial regression model predicts a 62.0732% change in ice area on September 30th, 2014.
12. The minimum ice extent is 3.548 million square kilometers, and occurs on February 21st. The maximum ice extent is 20.201 million square kilomteres, and occurs on September 20th.
13. The results are not at all compatible with my calculations from Task 6. Although the graph follows the same shape, the greatest percentage growth in ice area is around 250% from the NSIDC data, whereas the greatest percentage growth in ice area is around 60% from the NASA video data.
    
    The major cause of discrepancy occurs because we took into account the area of Antarctica in the ice extent, whereas the NSIDC does not do this, as shown in their [animations of sea ice extent](http://nsidc.org/data/seaice_index/archives/image_select.html). Since the area they take into account is smaller, any difference in area takes up a larger percentage of the whole.

    Minor discrepancies could have been caused by us not taking into account the curvature of the Earth, since the video taken by NASA is merely a 2D projection of a 3D object (the Earth). If we took into account the curvature of the Earth into our calculations for ice area, we would get much bigger values than we did originally, contributing to a higher percentage change (the greater the extent of the ice, the more surface area we "lose" in our calculations).

14. Instead of applying a general averaging filter, we could have used some method of determining the boundaries of the main "ice body", and colouring all the pixels inside that body white, to preserve edge detail. In addition, if we were given an accurate scale on the video (something along the lines of "1km per pixel"), then we could also have used the curvature of the earth to calculate a more accurate value for the area of the ice extent. Lastly, we could also try and find the estimated area of Antarctica in pixels on the video.
