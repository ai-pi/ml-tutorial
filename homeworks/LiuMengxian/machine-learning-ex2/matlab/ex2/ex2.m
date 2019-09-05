%% Machine Learning Online Class - Exercise 2: Logistic Regression
% ʹ��logistic���з���
close all;clc

%% 1.��ȡ����
fprintf('Loading and plot data......\n');
%��������
dataSet = load('ex2data1.txt');
X = dataSet(:,1:2);
Y = dataSet(:,3);
figure;
plotData(X,Y);
xlabel('Exam1 score');
ylabel('Exam2 score');
legend('Admiited','Not admiited');
hold off;

%% 2.������ۺ��ݶ�
X = [ones(size(X,1),1),X];
initTheta = zeros(size(X,2),1);

[cost,grad] = costFunction(initTheta,X,Y);
fprintf('The cost value at initThtea (zeros) is : %f\n ',cost);
fprintf('The gradient value at initThtea (zeros) is : %f\n ',grad);

%% 3.�Ż����
% fminunc�������ܣ�
% �ҵ�һ���������������Сֵ����һ�����Ƶĳ���ֵ��ʼ��ͨ�������Ż���Լ������������
% x =fminunc(fun,x0,options)    ���ݽṹ��options�е��������ҵ���Сֵ������optimset������options
% [x,fval]= fminunc(...)    ����Ŀ�꺯��fun�ڽ�x���ĺ���ֵfval

%ʹ���Զ�����ݶȺ�������������Ϊ400��
maxIter = 400;
J = zeros(maxIter,1);
theta = initTheta;
options = optimset('GradObj', 'on', 'MaxIter', 1);
costFun = @(the)costFunction(the,X,Y);
for i =1:maxIter
    [theta,cost] = fminunc(costFun,theta,options);
    J(i) = cost;
end

figure(2);
plot((1:maxIter),J,'b-','LineWidth',2);
xlabel('Iterator number');
ylabel('Cost value');

fprintf('Cost at theta found by fminunc: %f\n', cost);
fprintf('theta: \n');
fprintf(' %f \n', theta);

%���Ʒֽ���
figure(3);
plotDecisionBoundary( theta,X,Y );

xlabel('Exam1 score');
ylabel('Exam2 score');
legend('Admitted', 'Not admitted', 'Decision Boundary')
hold off;

%% 4.Ԥ��
prob = sigmoid([1 45 85] * theta);
fprintf(['For a student with scores 45 and 85, we predict an admission ' ...
         'probability of %f\n\n'], prob);
P = predict (theta,X);
fprintf('The model train accuracy is: %f\n', mean(double(P == Y))*100);
