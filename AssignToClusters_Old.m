function clusters = AssignToClusters_Old(image,colours)
%This function assigns each pixel in an image to a cluster, based on which
%mean colour that point is closest to.
%INPUT: image, the 3D image array
%       colours, a 3D array containing the colours for random points
%OUTPUT: clusters, a 2D array with the same size as the image, containing
%                  the corresponding cluster number for each pixel

%Create clusters array with appropriate dimensions
clusters = zeros(size(image,1),size(image,2));

%This loop goes through each pixel in the image to 
for i = 1:size(image,1)
    for j = 1:size(image,2)
        %This inner loop finds the squared distance between the given point
        %and each colour in the colours array, and sets the cluster number
        %to the row with the shortest distance.
        closestCluster = 0;
        minDistance = inf;
        for x = 1:size(colours,1)
            D = SquaredDistance(colours(x,1,:),double(image(i,j,:)));
            if D < minDistance
                minDistance = D;
                closestCluster = x;
            end
        end
        clusters(i,j) = closestCluster;
    end
end
end     