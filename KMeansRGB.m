function [clusters,means] = KMeansRGB(image,seedMeans,maximum)
%This function partitions all points in an image into k clusters using the
%k-means algorithm
%INPUT: image, the 3D image array
%       seedMeans, the 3D array containing the seed mean RGB values
%       maximum, the maximum number of iterarions for the k-mean algorithm
%OUTPUT: clusters, a 2D array containing the cluster each pixel is in
%        means, a 3D array containing the final mean RGB values

%Means array will first be set to be equal to seed means array
means = seedMeans;

%This while loop keeps alternating between assigning and updating clusters
%until either the mean is equal to the seed mean (convergence) or the
%maximum number of iterations has been reached
convergence = false;
iterations = 0;
while (~convergence) && (iterations < maximum)
    clusters = AssignToClusters(image,means);
    means = UpdateMeans(image,size(means,1),clusters);
    
    %Set convergence to true, then if any values in the two arrays are
    %different, it is set to false again
    convergence = true;
    for i = 1:size(means,1)
        if (means(i,1,1) ~= seedMeans(i,1,1)) || (means(i,1,2) ~= seedMeans(i,1,2)) || (means(i,1,3) ~= seedMeans(i,1,3))
            convergence = false;
        end
    end
    iterations = iterations + 1;
end
end