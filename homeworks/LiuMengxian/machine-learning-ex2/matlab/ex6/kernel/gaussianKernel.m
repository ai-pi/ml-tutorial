function K = gaussianKernel(x1, x2,sigma)
%% �������ܣ���˹�˺���
X1 = sum(x1.^2,2);
X2 = sum(x2.^2,2);
% ������һ�������ôд %
sim = bsxfun(@plus,X1,bsxfun(@plus,X2.', - 2 * (x1 * x2.')));
K = exp(-1/(2*sigma*sigma)) .^ sim;
 
end
