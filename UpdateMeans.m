function means = UpdateMeans(image,k,clusters)
%This function calculates the mean values for each cluster of colours
%
%INPUT: image, the 3D image array
%       k, the number of clusters
%       clusters, the 2D array containing the cluster that each pixel
%                 belongs to
%OUTPUT: means, a 3D array containing the average RGB for each cluster
%
%Author: Seif Younes

%Create means array with appropriate dimensions
means = zeros(k,1,3);

%This loop goes through each cluster to calculate the average RGB values
%for it.
for i = 1:k
    %Use the sum function to find how many pixels are in this cluster
    instances = sum(sum(clusters == i));
    
    %Create an array contains the linear indeces for points in the cluster 
    %array that are in cluster i
    list = find(clusters == i);
    
    %Calculate sum of RGB values in the cluster using linear indeces, then
    %divide by instances to return average RGB values
    avgR = sum(image(list)) / instances;
    avgG = sum(image(list + numel(clusters))) / instances;
    avgB = sum(image(list + 2*numel(clusters))) / instances;
    
    %Put the calculated average RGB values in the means array at row i
    means(i,1,:) = [avgR avgG avgB];
end
end