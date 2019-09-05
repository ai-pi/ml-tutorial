function [ cost,grad ] = costFunction( theta,X,Y )
%% �������ܣ���������Ĳ���theta�����ݵ�����X�����ݵ����Y���������ʱ�Ĵ��ۺ��ݶ�
%��Ҫע����ǣ�logistic�Ĵ��ۺ���������С�����������Ȼ����
[m,~]=size(X);
z = sigmoid(X * theta);

cost = ( -Y.' * log(z) - (1 - Y.') * log(1 - z)) / m;

grad = - (Y.' - (z).') * X / m;

end

