function kColourImage = CreateKColourImage(clusters,means)
%This function creates a k-colour image based on an image that has had its
%pixels divided into clusters. All pixels in a given cluster will be
%recoloured using the mean RGB values for that cluster
%INPUT: clusters, the 2D array containing the cluster that each pixel is in
%       means, the 3D array containing the mean RGB values for each cluster
%OUTPUT: kColourImage, the 3D array for the k-colour image

%Creat kColourImage array with appropriate dimensions
kColourImage = zeros(size(clusters,1),size(clusters,2),3);

%This loop goes through each pixel and sets the RGB values to the mean
%values for the corresponding cluster for the given pixel
for i = 1:size(kColourImage,1)
    for j = 1:size(kColourImage,2)
        kColourImage(i,j,:) = means(clusters(i,j),1,:);
    end
end

%Convert 3D image array from double to uint8
kColourImage = uint8(kColourImage);
end

