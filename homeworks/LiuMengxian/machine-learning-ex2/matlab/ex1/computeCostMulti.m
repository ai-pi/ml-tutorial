function J = computeCostMulti( X,Y,theta )
%% �������ܣ������ά���ݵĴ���
[m,~] = size(X);
hypthesis = X * theta;
err = hypthesis - Y;
J = (err.'*err) / (2*m);
end