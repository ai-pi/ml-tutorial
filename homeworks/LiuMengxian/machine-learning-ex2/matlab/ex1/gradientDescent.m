function [theta_Final , thetaAll] = gradientDescent ( X,Y,theta_init,alpha,num_itera )
%% �������ܣ��ݶ��½������thetaֵ
%  X������
%  Y����Ӧ���
%  alpha��ѧϰ��/����
%  theta_Init��theta��ʼֵ
%  num_itera�������������
%%
[n,m]=size(X);
theta = theta_init;

thetaAll = zeros(n,num_itera);
thetaAll(:,1) = theta_init;

J = zeros(num_itera,1);
% ����ÿһ�ε����Ĵ���ֵ��������theta
for i = 1:num_itera
    J(i) = computeCost(X,Y,theta);
    theta = theta - alpha * (1/m) * (X * (theta.' * X - Y).');
    thetaAll(:,i) = theta;
end
theta_Final = theta;
end

