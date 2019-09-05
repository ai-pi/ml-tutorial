function [centroids, idx] = runkMeans(X, init_centroids,max_iter, isplot)
%% �������ܣ�����K-means���㣬������K-means�������

%% �ж��Ƿ�Ҫ����ͼ��
if ~exist('isplot','var') || isempty(isplot)
    isplot = false;
end

%% ��ʼ������
K = size(init_centroids,1);
centroids = init_centroids;
previous_centroids = centroids;
idx = zeros(size(X,1),1);

if isplot
    figure;
    hold on;
end

%% ����K-means�������
% K-means���Է�Ϊ3����
% 1.�жϴصĸ���K�������ʼ��ÿ���ص��������꣬����ÿ�������ֵ������Ĵ�
% 2.��ÿ���������������ľ�ֵ�����´ص�����
% 3.���µĴ���������������ÿ�����������Ĵ�
% �ظ���������2.3����

for i=1:max_iter
    fprintf('K-Means iteration %d/%d...\n', i, max_iter);
    % ��ÿ�������ֵ������Ĵ�
    idx = findClosestCentroids(X, centroids);
    % ����ÿ��һ���Ĺ���
    if isplot
        % �������ݵ�
        plotDataPoints(X, idx, K);
        hold on
        plotProgresskMeans(centroids, previous_centroids);
        fprintf('Press enter to continue.\n');
        pause;
    end
    previous_centroids = centroids;
    % ��ÿ���������������ľ�ֵ�����´ص�����
    centroids = computeCentroids(X, idx, K);
end

if isplot
    hold off;
end

end
