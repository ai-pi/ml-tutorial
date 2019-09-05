%% Machine Learning  Online Class === Exercise 7 |K-Means Clustering and Principle Component Analysis 
close all;clc
% ʹ��K-meansʵ��ͼ���ѹ��

% ============== ����������������������������������� ================
% ============== ��Ϊ����ͼ���������޴��׵�LenaŮʿ�������ߵľ��⣡���� ==============
% ============== ����������������������������������� ================

%% 1.��ȡͼ��ת������������
X = double(imread('lena.png'));
% X = double(imread('sakimichan.jpg'));
X = X ./ 255; % ��һ����[0,1]
% X��512*512*3������
[m,n,l] = size(X);
% ��ÿһ�����ص㿴����һ��������ÿ��������ά����l=3��ÿ����ɫ������һά
X  = reshape(X,m*n,l);
% �������������ൽ50���أ����ǰ��������ض����ൽ��50����ɫ������16����ɫ���ع�ͼ�񣬶�������255ɫͼ
K = 50; 
max_iters = 20;
initial_centroids = kMeansInitCentroids(X, K);
[centroids, idx] = runkMeans(X, initial_centroids, max_iters);

%% 2. ͼ��ѹ��������ѹ�� --> �ع�ͼ��
% �ҵ��ع���ÿһ�����ص���ɫֵ
X_recovered = centroids(idx,:);
X_recovered = reshape(X_recovered,m,n,l);
X = reshape(X,m,n,l);

subplot(1, 2, 1);
imagesc(X); 
title('Original');

subplot(1, 2, 2);
imagesc(X_recovered)
title(sprintf('Compressed, with %d colors.', K));
