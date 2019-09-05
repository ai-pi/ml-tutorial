%% Machine Learning Online Class - Exercise 1: Linear Regression with UniVariable
close all;clc

%% 1.�������ݲ�����ͼ��
fprintf('Loading and plot data......\n');
%��������
dataSet = load('ex1data1.txt');
%�����ݷֳ�����������������
inputVariable = dataSet(:,1);
outputVariable = dataSet(:,2);
plotData(inputVariable,outputVariable);
xlabel('Population of City in 10,000s');
ylabel('Profit of City in $10,000');

%% 2.������ۺ��ݶ�
fprintf('Compute Cost and Gradient Descent......\n');
%���������ݽ������һ��ƫ��ά�ȣ�ֵȫ��1����������Xд��n*1����ʽ��n��inputVariable��ά��
X=[ones(length(inputVariable),1),inputVariable];
X=X.';
Y=outputVariable.';
% ������� -- theta��alpha��num_itera
theta = zeros(size(X,1),1);
alpha = 0.01;
num_itera = 1500;
% �ݶ��½���
[theta_Final , thetaAll] = gradientDescent(X,Y,theta,alpha,num_itera);

fprintf('Theta found last is :\n');
fprintf('%f\n%f\n',theta_Final(1),theta_Final(2));
hold on;
plot(X(2,:),theta_Final.' * X,'b-','LineWidth',2);
legend('Train data','Linear regression');
hold off;

%% 3.Ԥ��Ϳ��ӻ�����J
fprintf('Predicting the profits of population = 35,000 and 70,000 ...\n')
% Ԥ���˿���Ϊ 35,000 �� 70,000 ������
predict1 = [1, 3.5] * theta_Final ;
fprintf('For population = 35,000, we predict a profit of %f\n',...
    predict1*10000);
predict2 = [1, 7] * theta_Final ;
fprintf('For population = 70,000, we predict a profit of %f\n',...
    predict2*10000);

%���ƴ��ۺ���J(theta_0, theta_1)����άͼ��
fprintf('Visualizing J(theta_0, theta_1) ...\n')
theta0_vals = linspace(-10, 10, 100);
theta1_vals = linspace(-1, 4, 100);
J_vals  = visualCostJ(X,Y,theta0_vals,theta1_vals);
figure;
surf(theta0_vals,theta1_vals,J_vals);

% ���Ƶȸ���---��Բ��
figure;
% logspace(a, n, n)����[a,b]ȡn�ȷݣ�Ȼ��ÿһ�ݶ�Ӧ��ֵΪ10^linspace(a,b,n)
contour(theta0_vals, theta1_vals, J_vals, logspace(-2, 3, 20),'ShowText','on');
xlabel('\theta_0'); 
ylabel('\theta_1');
hold on;
plot(theta_Final(1), theta_Final(2), 'rx', 'MarkerSize', 10, 'LineWidth', 2);
