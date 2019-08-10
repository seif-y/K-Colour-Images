# K-Colour-Images
A program that takes an image and a number `k` as input, and uses k-means clustering to create a version of the input image that only contains its `k` most common colours.



# How it Works
The program takes 2 inputs: an integer `k`, and an image, which is represented by a 3D array.

First, k random points are selected from the image (see `SelectKRandomPoints` function).

Next, we get the RGB values for eachone of the random points are assigned to variables (see `GetRGBValuesForPoints` method). These RGB values are called the seed means: they are the initial mean RGB values for our k clusters.

Then, the k-means algorithm (see `KMeansRGB` method) is used to  do the rest of the work.
* We have a list of mean RGB values that is initially set to the list of seed means
* Each pixel in an image is assigned a cluster based on how close its RGB values are to each mean in the list.
* The mean RGB value of each cluster is calculated and stored in the list.
* Steps 2 and 3 are repeated until the mean RGB values are the same as those of the previous iteration (i.e. each pixel is in the correct cluster), or until the maximum number of iterations (determined by the user) is exceeded.

The final output image is then saved in the same directory as the source code.



# Running the Code
Ensure that all .m files are saved in the same directory, and run the `ConvertImage` script. The text prompts will explain everything else.


# Example Images
To be added...
