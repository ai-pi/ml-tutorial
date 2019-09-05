%% Machine Learning - Linear Regression with Multi-Variables
close all;clc
%% 1.��ȡ���ݲ���׼������ֵ
fprintf('Loading data ......\n');
dataSet = load('ex1data2.txt');
X = dataSet(:,1:2);
Y = dataSet(:,3);
% ����������һ��
[X_norm,mu,sigma] = featureNormalize(X);
% fprintf('mu is %f\n',mu);
fprintf('sigma is %f\n',sigma);
% ���ƫ��
X = [ones(size(X_norm,1),1) , X_norm];

%% 2.ʹ���ݶ��½����Ż����
theta = zeros(size(X,2),1);
num_iters=150;
element=['r-','b-','g-','k-','m-','r.','b.','g.','k.','m.'];
alpha = [0.001,0.005,0.01,0.05,0.1,0.5];
figure;
for i = 1:length(alpha)
    [theta_final,J] = gradientDescentMulti(X,Y,theta,alpha(i),num_iters);
    plot(J,element(i),'LineWidth',2);
    hold on
end
% alpha=0.5��ʱ�������ܿ죬ѡ���ʱ��theta��Ϊ���յ�thetaֵ
xlabel('Iterator Number');
ylabel('CostNum J');
title('Cost J at diferent \alpha');
legend('\alpha=0.001','\alpha=0.005','\alpha=0.01','\alpha=0.05','\alpha=0.1','\alpha=0.5');

%% 3.Ԥ��
Xtest = [1,1650,3];
price = Xtest * theta_final;
fprintf(['Predicted price of a 1650 sq-ft, 3 br house ' ...
         '(using normal equations):\n $%f\n'], price);
