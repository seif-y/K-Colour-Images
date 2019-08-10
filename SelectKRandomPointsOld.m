function points = SelectKRandomPointsOld(image,k)

%This function generates a list of k randomly selected pixels from an image
%INPUT: image, the 3D image array
%       k, the no. of pixels to be chosen
%OUTPUT: cluster, the array containing the randomly selected pixels

%Create the points array with appropriate dimensions
points = zeros(k,2);

%This loop goes through points array and randomly selects rows/columns for
%the points on each row
i = 1;
while i <= k 
    points(i,1) = ceil(rand * size(image,1));
    points(i,2) = ceil(rand * size(image,2));
    
    leftSimilar = points(i,1) == points(1:i-1,1);
    rightSimilar = points(i,2) == points(1:i-1,2);
    bothSimilar = leftSimilar & rightSimilar;
    if sum(bothSimilar) > 0
        i = i-1;
    end
    
    i = i + 1;
end

end