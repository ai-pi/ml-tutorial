function [xplot,yplot,vals]=visualizeBoundary(X, model)
%% �������ܣ����Ʒ����Էֽ���
% ��ƽ�濴����һ��������ÿһ�����������Ԥ�⣬������ÿһ�����Ԥ��ֵ
xplot = linspace(min(X(:,1)), max(X(:,1)), 100)';
yplot = linspace(min(X(:,2)), max(X(:,2)), 100)';
% ��������
% X1ÿһ�ж���xplot�ĸ��ƣ�һ����length(yplot)��
% X2ÿһ�ж���yplot�ĸ��ƣ�һ����length(xplot)��
[X1,X2] = meshgrid(xplot, yplot);
% �γ�һ��10000*2�ľ��󣬵�һ��ÿ100����X1�е�1�У��ڶ���ÿ100����X2��ÿһ��
mat = [X1(:),X2(:)];
% һ���Լ�������������Ԥ��ֵ�������ų���Ҫ�ĸ�ʽ����ʹ��ѭ��ֻʹ�þ�������
vals = reshape(svmPredict(model, mat).',length(yplot),length(xplot));

end