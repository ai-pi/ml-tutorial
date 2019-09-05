function centroids = computeCentroids(X, idx, K)
%% �������ܣ�����ÿ���ص����ĵ㣬����Ϊ�ô�������������͵ľ�ֵ
centroids = zeros(K,size(X,2));

for i=1:K
    index = find(idx == i);
    centroids(i,:) = sum(X(index,:)) / size(X(index),1); 
end

end
