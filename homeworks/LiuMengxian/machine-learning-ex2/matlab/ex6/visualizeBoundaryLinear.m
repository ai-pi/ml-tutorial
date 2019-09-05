function visualizeBoundaryLinear(X, model)
%% �������ܣ�����SVMѵ�����������Էֽ���
w = model.w;
b = model.b;
xp = linspace(min(X(:,1)), max(X(:,1)), 100);
yp = - (w(1)*xp + b)/w(2);
plot(xp,yp,'LineWidth',2);

end
