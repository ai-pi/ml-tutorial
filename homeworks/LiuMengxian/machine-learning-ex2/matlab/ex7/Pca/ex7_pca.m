%% Machine Learning  Online Class === Exercise 7 |K-Means Clustering and Principle Component Analysis 
close all;clc

%% 1.��ȡ����
X = importdata('ex7data1.mat');
figure(1);
plot(X(:,1),X(:,2),'bo','LineWidth',2);
xlabel('X feature 1');
ylabel('X feature2');
axis([min(X(:,1))-0.5 max(X(:,1))+0.5 2 8]);
% axis square:��ǰ����ϵͼ������Ϊ����
% axis equal ����������Ķ���ϵ�������ֵͬ ,����λ������ͬ��
axis square;
hold on;

%% 2.PCA����
% 1.��׼������
[X_norm,mu,~] = featureNormalize(X);
% 2.�Ա�׼��������ݽ���PCA
[U,S] = pca(X_norm);
% �����������ɷ�(��Ϊԭʼ����ֻ��2ά)
drawLine(mu.', mu.'+S(1,1)*U(:,1), '-k','LineWidth',2);
hold on
drawLine(mu.', mu.'+S(2,2)*U(:,2), '-k','LineWidth',2);
hold off;

%% 3. ͶӰ���ݵ��������ϣ����ָ�����
figure(2);
% ��ʾ��׼���������
plot(X_norm(:, 1), X_norm(:, 2), 'bo','LineWidth', 2);
axis([min(X_norm(:,1))-0.5 max(X_norm(:,1))+0.5 min(X_norm(:,2))-0.5 max(X_norm(:,2))+0.5]); 
axis square
hold on
% ԭʼ����ֻ��2ά��ͶӰ��1ά��Z��ʵ��ͶӰ���µĻ������ϵ�ϵ��
K=1;
Z = projectData(X_norm,U,K);
% ��ͶӰ���ݻָ���ԭʼ�������µĻ������ϵ�ͶӰ
X_rec = recoverData(Z,U,K);
plot(X_rec(:,1),X_rec(:,2),'ro','LineWidth', 2);

for i=1:size(X_norm,1)
    drawLine(X_norm(i,:),X_rec(i,:),'--g','LineWidth', 2);
end
hold off;

%% 4. ��ȡ��������
facedata = importdata('ex7faces.mat');
% ��ʾǰ100������
figure(3);
displayData(facedata(1:100,:));
hold off;
[face_norm,mu,~] = featureNormalize(facedata);
[U,S] = pca(face_norm);
% ����ǰ36����������
figure(4);
displayData(U(:,1:36).');
hold off

%% 5.�ӻ�������ϵ����ʹ��ָ�������ɷ����ָ�ԭʼ����
K=150;
Z_face = projectData(face_norm,U,K);
face_rec = recoverData(Z_face,U,K);
sigma = S * ones(size(S,2),1);
percent = sum(sigma(1:K)) / sum(sigma);
fprintf('The percentage is %f\n',percent);
figure(5);
subplot(1,2,1);
displayData(face_norm(1:K,:));
subplot(1,2,2);
displayData(face_rec(1:K,:));
hold off;
% ��ͼ�����Ҫ�ṹ�����ڵģ�����ϸ�ڲ��ֶ�ʧ��
