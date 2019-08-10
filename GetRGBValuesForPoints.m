function colours = GetRGBValuesForPoints(image,points)
%This function returns the RGB values for a list of specified points from
%an image
%INPUT: image, the 3D image array
%       points, the 2D array containing a list of pixel co-ordinates
%OUTPUT: colours, a 3D array containing the RGB values for each point on
%                 the given list

%Create the colours array with appropriate dimensions
colours = zeros(size(points,1),1,3);

%This loop goes through each row in the colours array and sets the RGB
%values to the ones in the image array at the corresponding position from 
%the points array
for i = 1:size(colours,1)
    colours(i,1,1:3) = image(points(i,1),points(i,2),1:3);
end

end