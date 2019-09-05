function [Jcost,grad] = lrCostFunction(X,Y,theta,lambda)
%% �������ܣ�������ۺ������ݶ�ֵ
[m,~]=size(X);
hypthesis = sigmoid(X * theta);

%��������Ĵ��ۺ������ʽ
Jcost = ( -Y.' * log(hypthesis) - (1-Y.') * log(1-hypthesis) ) / (m) + lambda * (theta.' * theta)  / (2*m) ;

grad =( (X.') * (hypthesis - Y) +lambda * [0;theta(2:end)] ) / m;

end
