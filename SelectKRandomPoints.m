function points = SelectKRandomPoints(image,k)

%This function generates a list of k randomly selected pixels from an image
%INPUT: image, the 3D image array
%       k, the no. of pixels to be chosen
%OUTPUT: cluster, the array containing the randomly selected pixels

%Create the points array with appropriate dimensions
points = zeros(k,2);

%Use randperm function to generate linear indices for k unique points
length = size(image,1) * size(image,2);
indices = randperm(length,k);

%Use ind2sub function to convert linear indices to row and column numbers,
%and adjust the points array so that the left column contains the rows, and
%the right column contains the columns.
[rows,columns] = ind2sub([size(image,1) size(image,2)], indices);
points(:,1) = rows;
points(:,2) = columns;

end