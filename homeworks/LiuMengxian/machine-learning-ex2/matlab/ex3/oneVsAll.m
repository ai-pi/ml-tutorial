function [all_theta] = oneVsAll(X,Y,num_labels,lambda)
%% �������ܣ��Զ����������ͬʱ����ѵ�������������ÿ������ѵ��ģ�Ͳ���theta����������theta�ļ���all_theta
[m,n] = size(X);

all_theta = zeros(num_labels , n+1);
X=[ones(m,1) , X];
options = optimset('GradObj', 'on', 'MaxIter', 50);

% ��ǰ����д�ļ����ݶȵ�����������ڣ������ǶԶ��theta�������м��㣬ǰ���ǶԵ���theta����������⣬������Ҫ��һ��forѭ��
% �ڼ���labe-K���ݶȴ��ۺ��ݶ�ʱ���ǰ�����������ó�0(Y==k)��ת����������������
for K =1:num_labels
    init_theta = zeros(n+1,1);
    costFun = @(t) lrCostFunction(X, (Y == K),t, lambda);
    % fmincg���÷���fminunc���ƣ����ڴ����������ʱ������Ч
    [theta] = fmincg(costFun , init_theta , options);  
    all_theta(K,:) = theta.';
end

end
