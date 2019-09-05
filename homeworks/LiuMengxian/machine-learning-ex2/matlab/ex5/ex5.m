%% Machine Learning Online Class-Exerceise 5 
% �������Իع��ѧϰ���ߣ�ƫ��-��������
close all;clc

%% 1.��ȡ����ʾ����
fprintf('load data ...\n');
load('ex5data1.mat');
fprintf('visualize data ...\n');
figure(1);
plot(X,y,'rx','MarkerSize',10,'LineWIdth',2);
xlabel('Change in water level (x)','FontWeight','bold');
ylabel('Water flowing out of the dam (y)','FontWeight','bold');
hold on;

%% 2.������ۺ��ݶ�
X=[ones(size(X,1),1),X];
init_theta = ones(size(X,2),1);
lambda= 0;
[J,grad] = linearRegCostFunction(X,y,init_theta,lambda);
fprintf('The cost at init_theta ([1;1]) is :%f3.2 \n',J);
fprintf('The gradient at init_theta ([1;1]) is :[%f3.2 , %f3.2]\n',grad);

%% 3.ѵ�������ͻ��ƻع�����
lambda = 0;
[theta] = trainLinearReg(X,y,lambda);
plot(X(:,2),X*theta,'b--','MarkerSize',10,'LineWidth',2);
hold off

%% Part.4 Learning curve
Xval = [ones(size(Xval,1),1),Xval];
[error_train,error_val] = learningCurve(X,y,Xval,yval,lambda);
figure(2);
plot(1:size(X,1),error_train,1:size(X,1),error_val,'LineWidth',2);
xlabel('Number of training examples','FontWeight','bold');
ylabel('Error','FontWeight','bold');
legend({'Train', 'Cross Validation'},'FontSize',12,'TextColor','black');
axis([0 13 0 150]);
hold off
% ������ͼ�п��Կ���������ѵ�����������ӣ�ѵ����������󣬶���֤��������С
% ��Ϊ���ݷֲ��Ƿ����Եģ���ģ�������Եģ���Ƿ��ϵģ�ƫ��Bias��Ȼ������ѵ�����������Ӷ�����
% ͬ������֤�����������½���������Ϊģ����Ȼ��Ƿ��ϣ����ǳ̶��ڼ�С������֤����Ƿ��ϵĳ̶��ڡ���С����
% ���������Ȼ�ܴ�

%% 5.ͶӰ����Ϊ����ʽ���ٻ���ѧϰ���ߣ�lmda=0
p = 8;
[X_poly]= polyFeatures(X(:,2),p);
% ��Ϊ�ڸߴ��������ֵ�仯�߶ȴ���Ҫ�ȱ�׼��
[X_poly,mu,sigma] = featureNormalize(X_poly);
X_poly = [ones(size(X_poly,1),1),X_poly];

lambda = 0;
[theta] = trainLinearReg(X_poly,y,lambda);

[x_fit,y_fit] = plotFit(min(X(:,2)),max(X(:,2)),mu,sigma,theta,p);

figure(3);
plot(X(:,2),y,'rx','MarkerSize', 10,'LineWidth',2);
hold on
plot(x_fit,y_fit,'b--','LineWidth',2);
xlabel('Change in water level (x)','FontWeight','bold');
ylabel('Water flowing out of the dam (y)','FontWeight','bold');
title (sprintf('Polynomial Regression Fit (lambda = %3.2f)', lambda));
legend({'Data','Polynomial Line'},'FontSize',12,'TextColor','black');
hold off;
% ����֤������ͬ����ͶӰ����ʹ��ѵ������׼���Ĳ�������׼����֤������
X_val_poly = polyFeatures(Xval(:,2),p);
X_val_poly = bsxfun(@minus,X_val_poly,mu);
X_val_poly = bsxfun(@rdivide,X_val_poly,sigma);
X_val_poly = [ones(size(X_val_poly,1),1),X_val_poly];
[error_train,error_val] = learningCurve(X_poly,y,X_val_poly,yval,lambda);
figure(4);
plot(1:size(X,1), error_train, 1:size(X,1), error_val,'LineWidth',2);
title(sprintf('Learning curve for polynomial regression (lambda=%3.2f)',lambda));
legend({'Train', 'Cross Validation'},'FontSize',12,'TextColor','black');
xlabel('Number of training examples','FontWeight','bold');
ylabel('Error','FontWeight','bold');
axis([0 13 0 100]);
hold off
% ��������߿��Կ������ߴ�������ȫ���ѵ������������ѧϰ������ѵ�������һֱ��С
% ������֤�����Ǻܸߣ���Ϊ�ǹ���ϣ�������һ���ܴ�ķ���Variance

%% 6.ͶӰ����Ϊ����ʽ���ٻ���ѧϰ���� (lambda =1)
lambda =1;
[theta] = trainLinearReg(X_poly,y,lambda);

[x_fit,y_fit] = plotFit(min(X(:,2)),max(X(:,2)),mu,sigma,theta,p);

figure(5);
plot(X(:,2),y,'rx','MarkerSize', 10,'LineWidth',2);
hold on
plot(x_fit,y_fit,'--','LineWidth',2);
xlabel('Change in water level (x)','FontWeight','bold');
ylabel('Water flowing out of the dam (y)','FontWeight','bold');
title (sprintf('Polynomial Regression Fit (lambda = %3.2f)', lambda));
legend({'Data','Polynomial Line'},'FontSize',12,'TextColor','black');
hold off;

[error_train,error_val] = learningCurve(X_poly,y,X_val_poly,yval,lambda);
figure(6);
plot(1:size(X,1), error_train, 1:size(X,1), error_val,'LineWidth',2);
title(sprintf('Learning curve for polynomial regression (lambda=%3.2f)',lambda));
legend({'Train', 'Cross Validation'},'FontSize',12,'TextColor','black');
xlabel('Number of training examples','FontWeight','bold');
ylabel('Error','FontWeight','bold');
axis([0 13 0 100]);
hold off
% ����������Ͽ��Կ�������ǰ��������ϵ��lambda=0��ȣ���ʱ����ϳ̶Ƚϵ�
% ��ѧϰ�����ϣ�ѵ����������������ӣ���֤������ȴ�½�����ѵ�������ͣ���Ϊ��ѵ������û�й���ϣ��������ܸ���

%% 7.ͨ����֤��ѡ��lambda��������Լ����
[lambda_vec,error_train,error_val] = validationCurve(X_poly,y,X_val_poly,yval);
figure(7);
plot(lambda_vec,error_train,lambda_vec,error_val,'LineWidth',2);
xlabel('lambda');
ylabel('Error');
hold on 
% ͶӰ�ͱ�׼�����Լ�����
X_poly_test = polyFeatures(Xtest,p);
X_poly_test = bsxfun(@minus,X_poly_test,mu);
X_poly_test = bsxfun(@rdivide,X_poly_test,sigma);
X_poly_test = [ones(size(X_poly_test,1),1),X_poly_test];
[lambda_vec,~,error_test] = validationCurve(X_poly,y,X_poly_test,ytest);
plot(lambda_vec,error_test,'LineWidth',2);
title('Error for Train+Validation and Test set');
legend({'Train','Validation','Test'},'FontSize',12,'TextColor','black');
