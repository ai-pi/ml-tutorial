function [U,S] = pca(X)
%% �������ܣ�ʹ��SVD����PCA�ֽ�
Sigma = X.' * X / (size(X,1));
[U, S, ~] = svd(Sigma);

end
