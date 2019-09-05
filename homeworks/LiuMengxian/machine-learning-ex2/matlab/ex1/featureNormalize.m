function [ X_Norm,mu,sigma ] = featureNormalize(X)
%% �������ܣ���׼���������X������
mu = mean(X,1);
sigma=sqrt(sum((X-mu) .^ 2) / size(X,1));
X_Norm = (X-mu) ./ sigma;
end
