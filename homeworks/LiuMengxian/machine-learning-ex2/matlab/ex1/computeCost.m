function J = computeCost( X,Y,theta )
%% �������ܣ��������ƽ������Ϊ����ֵ
%  X��������һ��ά�Ⱥ����������
%  J��X��Ӧ�����ֵ
%  theta������Ĳ���
[~,m]=size(X);
hypthesis = theta.' * X;
err = hypthesis - Y;
J = (err * err.') / (2*m);
end
