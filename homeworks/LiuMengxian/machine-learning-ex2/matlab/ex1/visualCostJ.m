function J_vals  = visualCostJ(X,Y,theta0_vals,theta1_vals)
%% �������ܣ������ڲ�ͬthtaֵ�µĴ���ֵ
J_vals = zeros(length(theta0_vals), length(theta1_vals));
for i = 1:length(theta0_vals)
    for j = 1:length(theta1_vals)
	  J_vals(i,j) = computeCost(X, Y, [theta0_vals(i); theta1_vals(j)]);
    end
end
J_vals = J_vals.';

end