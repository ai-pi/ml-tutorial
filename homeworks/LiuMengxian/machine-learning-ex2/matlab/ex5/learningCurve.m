function [error_train,error_val]=learningCurve(X,y,Xval,yval,lambda)
%% �������ܣ����㲻ͬѵ�������µ��Ż������ѵ��������֤���ϵ��������
m = size(X,1);
error_train = zeros(m,1);
error_val = zeros(m,1);
% ÿ�δ��벻ͬ��Ŀ��ѵ�������������������������ѵ�����ϵĴ��ۣ��Լ�����֤���ϵĴ���
for i = 1:m
    theta = trainLinearReg(X(1:i,:),y(1:i),lambda);
    [error_train(i),~] = linearRegCostFunction(X(1:i , :),y(1:i),theta,lambda);
    [error_val(i),~] = linearRegCostFunction(Xval,yval,theta,lambda);
end

end
