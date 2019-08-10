function clusters = AssignToClusters(image,colours)
%This function assigns each pixel in an image to a cluster, based on which
%mean colour that point is closest to.
%
%INPUT: image, the 3D image array
%       colours, a 3D array containing the colours for random points
%OUTPUT: clusters, a 2D array with the same size as the image, containing
%                  the corresponding cluster number for each pixel
%
%Author: Seif Younes

%Create clusters array with appropriate dimensions
clusters = zeros(size(image,1),size(image,2));

%This loop goes through each row of the image matrix
for i = 1:size(image,1)
    row = double(image(i,:,:));
    
    %Sort the RGB values for the row into their own arrays
    R = row(1,:,1);
    G = row(1,:,2);
    B = row(1,:,3);
    
    %Create an array for the cluster row with appropriate dimensions
    clusterRow = zeros(1,size(row,2));
    
    %Create an array that will hold the minimum square distance for
    %the RGB values of each row (initially set as all infs)
    minDistance = inf - zeros(1,size(row,2));
    
    %This loop goes through each row in the colours matrix
    for x = 1:size(colours,1)
        
        %Find the indices of the row where the squared distance for this
        %row is lower than the minimum.
        D = (R - colours(x,1,1)).^2 + (G - colours(x,1,2)).^2 + (B - colours(x,1,3)).^2;
        indices = find(D < minDistance);
        
        %Put the new minimum distances in the minDistance array at the
        %correct indices, and set the values for the clusterRow array at
        %those indices to the correct cluster number
        for y = 1:size(indices,2)
            minDistance(indices(y)) = D(indices(y));
            clusterRow(indices(y)) = x;
        end
    end 
    
    %Set values for this row of the clusters matrix to the clusterRow array
    clusters(i,:) = clusterRow;
end             
end    