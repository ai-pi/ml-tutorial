function [model] = svmTrain(X, Y, C, func, ...
                            tol, maxIter)
%% �������ܣ�ʹ��SMO�ļ򻯰����SVMѵ��
% ����SMO�Ĺ�ʽ�Ƶ����̣������²��ͺ����ģ�
% http://blog.csdn.net/v_july_v/article/details/7624837
% Sequential Minimal Optimization: A Fast Algorithm for Training Support Vector Machines
% X �����ݾ���X(i,j)��ʾ��i�������ĵ�jά����
% Y ��X��Ӧ��������label������ʱy={0,1}
% C ��SVM�����򻯲���
% tol ��������KKT���������
% maxIter �������������
if ~exist('tol', 'var') || isempty(tol)
    tol = 1e-3;
end
if ~exist('max_passes', 'var') || isempty(maxIter)
    maxIter = 5;
end

%% ׼�����ݺͲ���
m = size(X, 1);
% ��SVM�У�labelֻ��{-1,+1}���֣�����Ҫ��0ֵ�ĳ�-1
Y(Y==0) = -1;
% �ڣ���ż���Ż���������Ҫ�õ��Ĳ���
alphas = zeros(m, 1); % �������ճ���
b = 0; % ƫ��
passes = 0; % ��������
E = zeros(m, 1); % ������E(i)��ʾ��i��������Ϊ����/ѵ������ʱ�����

%% ���ɺ˺�������
K = func(X,X);

%% ��ʼѵ������
while passes < maxIter
    num_changed_alphas = 0;
    for i = 1:m
        % E(i)�Ǵ���X(i,:)���õ���Ԥ������ֵ�ĲE=((wT * X) + b) - y
        E(i) = b + sum (alphas .* Y .* K(:,i)) - Y(i);
        % Y(i)*E(i) = y((wT * X) + b) - 1
        % �ڲ�����KKT�����ĳ������ҵ���������alpha1��alpha2,
        if ((Y(i)*E(i) < - tol && alphas(i) < C) || (Y(i)*E(i) > tol && alphas(i) > 0))
            % ѡȡalpha2��Ҫ������alpha��ͬ
            j = ceil(m * rand());
            while j == i
                j = ceil(m * rand());
            end
            E(j) = b + sum (alphas .* Y .* K(:,j)) - Y(j);
            
            % ���浱ǰ��ֵ���ں��������Ҫ�õ�
            alpha_i_old = alphas(i);
            alpha_j_old = alphas(j);
            
            % �����������Ӷ�Ӧ��y(i)\y(j)�ķ����Ƿ���ͬ��������߽�L��H 
            if (Y(i) == Y(j))
                L = max(0, alphas(j) + alphas(i) - C);
                H = min(C, alphas(j) + alphas(i));
            else
                L = max(0, alphas(j) - alphas(i));
                H = min(C, C + alphas(j) - alphas(i));
            end
            % ���L=H����ʾ����Ҫ���£�ֱ�ӽ�����һ��
            if (L == H) 
                continue;
            end

            % eta = K(i,i)+K(j,j)-2*K(i,j)��Ҫ��ֵ����0���ܼ������㣬�����˳�
            eta = 2 * K(i,j) - K(i,i) - K(j,j);
            if (eta >= 0)
                continue;
            end
            
            % ����alpha2��ֵ,����L��H��Լ��
            alphas(j) = alphas(j) - (Y(j) * (E(i) - E(j))) / eta;
            alphas(j) = min (H, alphas(j));
            alphas(j) = max (L, alphas(j));
 
            % ����alpha1��ֵ
            alphas(i) = alphas(i) + Y(i)*Y(j)*(alpha_j_old - alphas(j));
            
            % ����b1��b2
            b1 = b - E(i) ...
                 - Y(i) * (alphas(i) - alpha_i_old) *  K(i,i)' ...
                 - Y(j) * (alphas(j) - alpha_j_old) *  K(i,j)';
            b2 = b - E(j) ...
                 - Y(i) * (alphas(i) - alpha_i_old) *  K(i,j)' ...
                 - Y(j) * (alphas(j) - alpha_j_old) *  K(j,j)';
            % ����b 
            if (0 < alphas(i) && alphas(i) < C)
                b = b1;
            elseif (0 < alphas(j) && alphas(j) < C)
                b = b2;
            else
                b = (b1+b2)/2;
            end

            num_changed_alphas = num_changed_alphas + 1;
        end
    end
    
    if (num_changed_alphas == 0)
        passes = passes + 1;
    else
        passes = 0;
    end
end

%% �������ģ��
% ��������֧��������Ӧ��alphas
idx = alphas > 0;
model.X= X(idx,:);
model.y= Y(idx);
model.kernelFunction = func;
model.b= b;
model.alphas= alphas(idx);
model.w = ((alphas.*Y)'*X)';

end
