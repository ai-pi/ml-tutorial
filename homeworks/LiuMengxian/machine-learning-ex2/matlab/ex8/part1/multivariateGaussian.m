function p = multivariateGaussian(X, mu, sigma2)
%% �������ܣ�����ÿ�������ڶ�ά��˹�ֲ��еĸ���ֵ
% ���ɷ������
if (size(sigma2, 2) == 1) || (size(sigma2, 1) == 1)
    sigma2 = diag(sigma2);
end

k= length(mu);
X = bsxfun(@minus,X,mu);

p = (2*pi) ^ (-k/2) * det(sigma2) ^ (-0.5) * ...
    exp(-0.5 * sum( bsxfun(@times,X * pinv(sigma2),X),2));

end
