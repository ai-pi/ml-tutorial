function plotDecisionBoundary( theta,X,Y )
%% �������ܣ�����theta����������X���������Y�����Ʒֽ���
% X�������ƫ��ά�ȵ����ݼ�

plotData(X(:,2:3),Y);
hold on 
%�ֽ��߾���X*theta=0.5��ֱ����
%���ݹ�ʽ�������������б����£�X��һγ�ȵ�ֵ��Ӧ�ĵڶ�ά�ȵ�ÿһ��ֵ
%����ά�Ȳ�����3ά
if size(X, 2) <= 3
    % ֻ��Ҫ������(��ʼ����յ�)�Ϳ��Ի��Ƴ�һ��ֱ�ߣ���Ӧ����X(:,2)����Сֵ�����ֵ
    plot_x = [min(X(:,2)),  max(X(:,2))];
    % sigmod�������б�����0.5����Ӧ��theta*XֵΪ0��������0��ȥ
    plot_y = (-1 ./ theta(3)) .* (theta(2) .* plot_x + theta(1));
    plot(plot_x, plot_y)
else
    % ����ά�ȴ���3ά�����Ƶȸ���
    %u��v����ʾ������ά�ȵ�ȡֵ��Χ��������Ϊ��������
    u = linspace(-1, 1.5, 50);
    v = linspace(-1, 1.5, 50);  
    % ��contour(X,Y,Z)�У�Ҫ��
    % length(X) = size(Z,2);
    % length(Y) = size(Z,1);
    % ����u�������꣬v�Ǻ�����
    z = zeros(length(u), length(v));
    % 
    power = 6;
    % ����������ÿһ�����ϵ�ֵ�������z
    for i = 1:length(v)
        for j = 1:length(u)
            % z�ǵ�ǰtheta��ά��ӳ����ֵ
            % ��Ҫע�⣬z(j,i)��ֵ��[X(i), Y(j)]���������
            z(j,i) = mapFeature(v(i), u(j),power) * theta;
        end
    end
    %ֻ��Ҫ��ʾz=0�ĵȸ��ߣ�ָ���ȸ�����ʾ�ķ�Χ[0,0]
    contour(v, u, z,[0,0],'g-');
end
end

