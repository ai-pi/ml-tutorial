%% Machine Learning Online Class--Exercise 6��֧��������SVM
close all;clc
addpath(genpath('./kernel'));%��Ӻ˺���·��
addpath(genpath('./txt'));

%% 1.��������1��������������
fprintf('Loading and visualizing data ....\n');
load('ex6data1.mat');
figure(1);
plotData(X,y);
xlabel('Feature 1');
ylabel('Feature 2');
title('ex6data1','FontWeight','bold');

%% 2.ѵ��SVM--���Կɷֵ�data1
C=1;
maxIter=20;
model_1 = svmTrain(X,y,C,@linearKernel,1e-3,maxIter);
visualizeBoundaryLinear(X, model_1);
hold on;
C =100;
model_2 = svmTrain(X,y,C,@linearKernel,1e-3,maxIter);
visualizeBoundaryLinear(X, model_2);
legend({'label=1','label=-1','C=1','C=100'},'FontWeight','bold');
hold off

%% 3.ʵ�ָ�˹��
fprintf('\nEvaluating the Gaussian Kernel ...\n');
x1 = [1 2 1]; x2 = [0 4 -1]; sigma = 2;
sim = gaussianKernel(x1, x2, sigma);

fprintf(['Gaussian Kernel between x1 = [1; 2; 1], x2 = [0; 4; -1], sigma = 2 :' ...
         '\n\t%f\n(this value should be about 0.324652)\n'], sim);

%% 4.���벢���ӻ�����2
load('ex6data2.mat');
figure(2);
plotData(X,y);  %X��y���data2�е�Ԫ����
xlabel('Feature 1');
ylabel('Feature 2');
title('ex6data2','FontWeight','bold');
hold on

%% 5.����2ѵ��SVM--ʹ�ø�˹��
C1=1;
sigma =0.1;
modelg1 = svmTrain(X,y,C1,@(x1,x2) gaussianKernel(x1,x2,sigma),1e-3);   %û�����õ���������������Ĭ�ϵ�5��
[xplot,yplot,vals]=visualizeBoundary(X, modelg1);
contour(xplot,yplot,vals,[0 1],'b-','LineWidth',2);
hold on

C1=100;
sigma =0.1;
modelg2 = svmTrain(X,y,C1,@(x1,x2) gaussianKernel(x1,x2,sigma),1e-3);
[~,~,vals]=visualizeBoundary(X, modelg2);
contour(xplot,yplot,vals,[0 1],'r-','LineWidth',2);
legend({'label=1','label=-1','C=1','C=100'},'FontWeight','bold');
hold off

%% 6.���벢���ӻ�����3
load('ex6data3.mat');
figure(3);
plotData(X,y);  %X��y���data2�е�Ԫ����
xlabel('Feature 1');
ylabel('Feature 2');
title('ex6data3','FontWeight','bold');
hold on

%% 7.Ѱ������֤��׼ȷ����ߵ�C��sigma
Cs=[0.01; 0.03; 0.1; 0.3; 1; 3; 10; 30];
sigmas=[0.01; 0.03; 0.1; 0.3; 1; 3; 10; 30];
[C,simga] = dataset3Params(X,y,Xval,yval,Cs,sigmas);
model = svmTrain(X,y,C,@(x1,x2) gaussianKernel(x1,x2,sigma));
[xplot,yplot,vals]=visualizeBoundary(X, model);
contour(xplot,yplot,vals,[0 1],'b-','LineWidth',2);
legend({'label=1','label=-1','boundary'},'FontWeight','bold');
