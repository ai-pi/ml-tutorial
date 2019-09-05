function [x,y_poly]=plotFit(min_x,max_x,mu,sigma,theta,p)
%% �������ܣ��ڶ���ʽ����ֵ�������ϣ��������������������theta�������������
% ȷ�����귶Χ
x = (min_x -15 : 0.05 : max_x+25).';
% ͶӰ��������������ͬ�����
x_poly = polyFeatures(x,p);
x_poly = bsxfun(@minus,x_poly,mu);
x_poly = bsxfun(@rdivide,x_poly,sigma);
% �������ߵ�ֵ
x_poly = [ones(size(x_poly,1),1),x_poly];
y_poly = x_poly * theta;

end
