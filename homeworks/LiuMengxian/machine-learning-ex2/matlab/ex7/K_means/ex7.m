%% Machine Learning  Online Class === Exercise 7 K-Means Clustering and Principle Component Analysis
close all;clc

%% 1.��ȡ����
X = importdata('ex7data2.mat');
figure(1);
plot(X(:,1),X(:,2),'ko','LineWidth',2);
xlabel('Feature 1');
ylabel('Feature 2');
title('Visualizing data');
hold off;

%% 2. Ѱ��ÿһ�����������ġ��ء�
% ��figure1�У����Կ��������ݿ��Էֳ�3��
K=3;
% �����K������������
init_centroids = [3,3; 6,2; 8,5];
% �ҵ�ÿ�������������������ţ�1~K
idx = findClosestCentroids(X,init_centroids);

%% 3. ���Ƽ���ÿ�������ĵ�Ĺ���
% ����K-means�����������ĵ�ļ������
maxIter =10;
[~,~] = runkMeans(X,init_centroids,maxIter,true);
