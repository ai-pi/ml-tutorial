function out = mapFeature( X1,X2,power )
%% �������ܣ�������X1��X2ӳ��ɸ߽�ά�ȵĶ���ʽ���������ݵ�ά��
% power��ӳ�䵽�Ķ���ʽ����ߴ�����������0�ε�power��
[m,~]=size(X1);
n=(1+power+1) * (power+1)/2;
out = ones(m,n);
k=2;
for i =1:power
    for j = 0:i
        out(:,k) = (X1.^(i-j)) .* (X2.^(j)); 
        k=k+1;
    end
end
end
