function [centroids] = kMeansInitCentroids(X,K)
%% �������ܣ���X�����ȡK�����������������ǵ�����ֵ��ΪK���������
randIndex = randperm(size(X,1));
centroids  = X(randIndex(1:K),:);

end
