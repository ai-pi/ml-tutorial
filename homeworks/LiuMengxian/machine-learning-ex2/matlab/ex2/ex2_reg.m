%% Machine Learning Online Class - Exercise 2: Regularized Logistic Regression
close all;clc

%% 1.��ȡ���ݺͻ���ɢ��ͼ
dataSet = load('ex2data2.txt');
X = dataSet(:,1:2);
Y = dataSet(:,3);
figure(1);
plotData(X,Y);
xlabel('Microchip test 1');
ylabel('Microchip test 2');
title('Visualizing data');
legend('Pass (y=1)','Not Pass (y=0)');

%% 2.ӳ���������߽�ά�ȣ��������������Ĵ��ۺ��ݶ�
% ��ɢ��ͼ�п��Կ������������ݲ������Կɷֵģ���ô�����ݵ��������άӳ�䣬�γ�����[x1,x2]�Ķ���ʽ
%ӳ�䵽������6�η�
power = 6;
X = mapFeature(X(:,1),X(:,2),power);
% ��ʱ������ά�ȴ�2ά���ӵ�28ά���������һ�����⣺ά��̫�ߵ��·��������׹���ϣ�����Ҫ�ڴ��ۺ������������
init_Theta = zeros(size(X,2),1);
%������ϵ��
lambda =1;
%����������Ĵ��ۺ������ݶ�ֵ
[cost,grad] = costFunctionReg(init_Theta,X,Y,lambda);

fprintf('The cost value at init_Theta (zeros) is: %f\n',cost);
fprintf('The gradient value at init_Theta (zeros) is: %f\n',grad);

%% 3.�Ż���Ⲣ���Ʒֽ���
%��С������ֵ
maxIter = 400;
options = optimset('GradObj','on','MaxIter',maxIter);
costFun = @(the)costFunctionReg(the,X,Y,lambda);
for lambda =0 : 0.1 : 1
    [theta,cost] = fminunc(costFun , init_Theta ,options);
    %���Ʒֽ���
    figure;
    plotDecisionBoundary(theta,X,Y);
    hold on;
    title(sprintf('lambda = %g',lambda));
    xlabel('Microchip Text 1');
    ylabel('Microchip Text 2');
    legend('y = 1','y = 0','Decision boundary');
    hold off;
end

% ������ѵ�����ϵ�׼ȷ��
P = predict(theta,X);
fprintf('The accuracy in training data is %f\n',mean(double(P==Y))*100);