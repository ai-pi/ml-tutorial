function plotData(X, y)
%% �������ܣ����������е��������
% find(x=m)���ҵ�x��ֵΪm���±�����
pos = find(y ==1);
neg = find(y ==0);
plot(X(pos,1),X(pos,2),'k+','LineWidth',2,'MarkerSize',7);
hold on 
plot(X(neg,1),X(neg,2),'ko','MarkerFaceColor','yellow','MarkerSize',7);

end
