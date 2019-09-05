%% Machine Laearning Online Class - Exercise 3: One-vs-All Logistic Regression
% ���Logistic Regressionͬʱ���㣬��������д���ֽ���ʶ��
close all;clc
%% 1.��ȡ���ݺͳ�ʼ����
fprintf('Load dataSet:ex3data1.mat\n');
load('ex3data1.mat');
% �����������ѡ��100����������ʾ��10*10�����ֱ��
randIndex = randperm(size(X,1));
seldata = X(randIndex(1:100),:);
% ���ݿ��ӻ�
figure(1);
displayData(seldata);

%% 2.������Logistic Regression����������ۺ������ݶ�ֵ
fprintf('Training data with one-Vs-All logistic regression\n');
% ��������ϵ��lambda������������������labels
lambda = 0.05;
num_labels=10;
[all_theta] = oneVsAll(X,y,num_labels,lambda);

%% 3.ʹ��OneVsAll��Ԥ��
P=predictOneVsAll(X,all_theta);
fprintf('Training set Accuracy is %f\n', mean(double(P==y)) * 100);
