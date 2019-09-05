%% %% Machine Learning Online Class --- Exercise-6:Spam emails
close all;clc
% ��Ӻ���·��
addpath(genpath('./kernel'));
addpath(genpath('./txt'));
addpath(genpath('./methods'));

%% 1.�ı�Ԥ�������ȡ����
% ��ȡ�����ʼ�������
file_contents = readFile('emailSample1.txt'); 
% ���ʼ�����ת���������������
word_indices = processEmail(file_contents);   

fprintf('Word Indices: \n');
fprintf(' %d', word_indices);
fprintf('\n\n');

feature = emailFeatures(word_indices);
fprintf('Length of feature vector: %d\n', length(feature));
fprintf('Number of non-zero entries: %d\n', sum(feature > 0));

%% 2.�������ݡ�ѵ��SVMģ�ͺͲ���ģ???
% ����ѵ����
load('spamTrain.mat');
C=0.1;
model = svmTrain(X,y,C,@linearKernel);
p = svmPredict(model, X);
fprintf('Training Accuracy: %f\n', mean(double(p == y)) * 100);
% ������Լ�
load('spamTest.mat');
p = svmPredict(model, Xtest);
fprintf('Test Accuracy: %f\n', mean(double(p == ytest)) * 100);

%% 3.��w���н������У���ʾǰ15��Ȩ����ߵĵ���
[weight, idx] = sort(model.w, 'descend');
vocabList = getVocabList();

fprintf('\nTop predictors of spam: \n');
for i = 1:15
    fprintf(' %-15s (%f) \n', vocabList{idx(i)}, weight(i));
end

%% 4.���ʼ����е�Ԥ�����
filename = 'spamSample1.txt';
file_contents = readFile(filename);
word_indices  = processEmail(file_contents);
x = emailFeatures(word_indices).';
p = svmPredict(model, x);

fprintf('\nProcessed %s\n\nSpam Classification: %d\n', filename, p);
fprintf('(1 indicates spam, 0 indicates not spam)\n\n');
