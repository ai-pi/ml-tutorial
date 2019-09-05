function [theta] = trainLinearReg(X,y,lambda)
%% ����˵����ѵ�����Իع�Ĳ������������Ž����
init_theta = ones(size(X,2),1);
costFunction = @(t)linearRegCostFunction(X,y,t,lambda);
options = optimset('GradObj','on','MaxIter',200);

theta = fmincg(costFunction,init_theta,options);

end
