function x = emailFeatures(word_indices)
%% �������ܣ���һ�����ֱ�Ǳ�ת������������������ֵ��λ�ø�Ϊ1
n = 1899;
x = zeros(n, 1);

for i=1:length(word_indices)
	x(word_indices(i))=1;
end

end