function plotProgresskMeans( centroids, previous)
%% �������ܣ��ö�ֱ�߻���K-meansѰ���µ����ĵ�ÿһ������
% �ú�ɫx��ʾ���ĵ�
plot(centroids(:,1),centroids(:,2),'x','MarkerEdgeColor','k','MarkerSize',10,'LineWidth',3);
% �ö�ֱ��������һ�������ĵ��뵱ǰ���ĵ�
for j=1:size(centroids,1)
    drawLine(centroids(j, :), previous(j, :));
end

end
