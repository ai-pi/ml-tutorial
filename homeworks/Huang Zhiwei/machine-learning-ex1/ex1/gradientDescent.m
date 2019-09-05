function [theta, J_history] = gradientDescent(X, y, theta, alpha, iterations)

m = length(y); 
J_history = zeros(iterations, 1);

for i = 1:num_iters

    s=(X*theta-y).*X/m;
    s=(X*theta-y).*X/m;
    s0=sum(s);
    s1=s0(:,1);
    s2=s0(:,2);
    theta(1,:)=theta(1,:)-alpha*s1;
    theta(2,:)=theta(2,:)-alpha*s2;

    J_history(i) = computeCost(X, y, theta);

end

end
