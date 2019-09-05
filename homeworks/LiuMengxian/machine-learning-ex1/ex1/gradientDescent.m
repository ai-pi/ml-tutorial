function [theta, J_history] = gradientDescent(X, y, theta, alpha, num_iters)
%GRADIENTDESCENT Performs gradient descent to learn theta
%   theta = GRADIENTDESCENT(X, y, theta, alpha, num_iters) updates theta by 
%   taking num_iters gradient steps with learning rate alpha

% Initialize some useful values
m = length(y); % number of training examples
J_history = zeros(num_iters, 1);
for iter = 1:num_iters

    % ====================== YOUR CODE HERE ======================
    % Instructions: Perform a single gradient step on the parameter vector
    %               theta. (对参数向量执行一个梯度步长。)
    %
    % Hint: While debugging, it can be useful to print out the values提示:在调试时，打印出这些成本函数(computeCost)和梯度的值是很有用的成本函数(computeCost)和梯度。
    %       of the cost function (computeCost) and gradient here.
    %
theta=theta-(alpha/m)*(X'*(X*theta-y))

    % ============================================================

    % Save the cost J in every iteration 在每次迭代中节省成本J   
    J_history(iter) = computeCost(X, y, theta);

end

end
