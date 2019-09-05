function [idx] = findClosestCentroids(X,init_centroids)
%% �������ܣ��ҵ�Xÿ�����������Ĵ�
% init_cetroids ��������X���������
[m,~] = size(X);
K = size(init_centroids,1);
% ��������ÿ����������ÿ�������ĵľ���
% distance(m,k)����m�����������k�������ĵľ���
distance = zeros(m,K);

for i =1:K
    distance(:,i) = sum(bsxfun(@minus,X,init_centroids(i,:)) .^ 2,2) ;
end
% �ҵ�ÿһ���е���Сֵ������������
[~,I] = min(distance.');
idx = I.';

end
