function plotDataPoints(X, idx, K)
%% �������ܣ��������ݵ�
% ����K+1����ɫ��ɫ��
palette = hsv(K);
% ����idxȡ��ÿ��������Ӧ����ɫ
colors = palette(idx,:);
% ��������ɢ��ͼ
scatter(X(:,1),X(:,2),15,colors,'LineWidth',2);

end
