function P = predictOneVsAll(X,all_theta)
%% ����˵���������ݽ���Ԥ��

X=[ones(size(X,1),1),X];
z=X * all_theta.';
h = sigmoid(z);
% h��һ��m*K�ľ���h(m,k)��ֵ��ʾ��m������Ԥ�����ڵ�k��ĸ���
% ����h�У�ÿһ�е����ֵ���±꣬����Ԥ�������ܵ����
[~,P] = max(h,[],2);
end
