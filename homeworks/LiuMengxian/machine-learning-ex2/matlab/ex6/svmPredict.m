function pred = svmPredict(model,Xtest)
%% �������ܣ�Ԥ��SVM�ڲ��������ϵ����
[m,~] = size(Xtest);
pred = zeros(m, 1);

K = model.kernelFunction(model.X,Xtest);
K = model.y .* model.alphas .* K;
p = sum(K,1) + model.b;

pred(p >= 0) =  1;
pred(p < 0) =  0;

end
