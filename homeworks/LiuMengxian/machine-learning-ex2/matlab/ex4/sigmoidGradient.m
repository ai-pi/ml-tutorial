function gd = sigmoidGradient(z)
%% ����˵����������X����sigmoid�����ĵ���
gd = sigmoid(z) .* (1 - sigmoid(z));

end
