function [Ynorm, Ymean] = normalizeRatings(Y, R)
%% �������ܣ����ÿ����Ӱ�����־�ֵ�����ѷ���ȥ��ֵ
[m, ~] = size(Y);
Ymean = zeros(m, 1);
Ynorm = zeros(size(Y));
for i = 1:m
    Ymean(i) = mean(Y(i, R(i, :)));
    Ynorm(i, R(i, :)) = Y(i, R(i, :)) - Ymean(i);
end

end
