function  [J,grad] = nnCostFunction(X,y,nn_parameter, ...
                                                 input_layer_size, ...
                                                 hidden_layer_size, ...
                                                 label_num, ...
                                                 lambda)
%% �������ܣ�������������ݺͶ�Ӧ��������Լ���������Ӧ�Ĳ�����������ۺ���
if nargin == 6
    %ֻ��6��������ʱ�򣬱�ʾû���������ϵ��lambda����Ϊ0
    lambda =0;
end

%% ��һ���֣��������
% ���Ĳ���
theta1 = reshape(nn_parameter(1:hidden_layer_size * (input_layer_size + 1 )),hidden_layer_size,input_layer_size+1); 
theta2 = reshape(nn_parameter(hidden_layer_size * (input_layer_size + 1 )+1:end),label_num,hidden_layer_size+1);
[m,~] = size(X);
X = [ones(m,1),X];

% �����������������
a1 = X;     
% �ڶ�����������
z2 = a1 * theta1.' ;
a2 = sigmoid(z2);
a2 = [ones(size(a2,1),1) , a2];
% ��������������
z3 = a2 * theta2.';
a3 = sigmoid(z3);
% ��ʱa3��һ��m*K�����飬a3(m,K)��ֵ�ǵ�m���������ڵ�K����ǩ��Ԥ�����
% �������е���ֵy��ת������a3��ʽ��ͬ�����飬���yk(m,k)==1����ʾ��m����������ʵ��ǩ��K
yk = zeros(length(y) , label_num);
for i =1:m
    yk(i,y(i)) =1;
end
% ������ۣ��������У�û�д���theta1��theta2��ƫ�ò���
logisf = (-yk) .* log(a3) - (1- yk) .* log(1 - a3);
J = (1/m) * sum(sum(logisf)) + (lambda) * ( sum(sum(theta1(:,2:end) .^ 2 )) + sum(sum(theta2(:,2:end) .^2)) ) /(2*m);

%% �ڶ����֣�BP�㷨--���BPֻ��������������У����ڸ��߲������࣬�����ӵ�ģ�;Ͳ�������
delta3 = a3 - yk;

delta2 = delta3 * theta2 .* sigmoidGradient( [ones(size(z2,1), 1), z2] );
delta2 = delta2(:,2:end);
% theta1���ݶ�
tridelta_1 = 0;
tridelta_1 = tridelta_1 + delta2.' * a1;
nn_parameter1_grad = (1/m) .* tridelta_1 + (lambda/m) *[zeros(size(theta1,1),1),theta1(:,2:end)]  ;
% theta2���ݶ�
tridelta_2 = 0;
tridelta_2 = tridelta_2 + delta3.' * a2;
nn_parameter2_grad = (1/m) .* tridelta_2 +(lambda/m) * [zeros(size(theta2,1),1),theta2(:,2:end)] ;

grad = [nn_parameter1_grad(:);nn_parameter2_grad(:)];

end
