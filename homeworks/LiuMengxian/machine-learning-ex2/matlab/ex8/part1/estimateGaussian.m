function [mu,sigma2] = estimateGaussian(X)
%% �������ܣ����������Ƿ��Ӹ�˹�ֲ��ģ������Ƹ�˹�ֲ��Ĳ���
[m, ~] = size(X);

mu = sum(X) / m;
sigma2 = sum( bsxfun(@minus,X,mu) .^ 2) / (m-1);

end
