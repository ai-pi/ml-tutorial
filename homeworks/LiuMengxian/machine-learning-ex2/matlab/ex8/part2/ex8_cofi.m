%% Machine Learning Online Class --- Exercise 8 | Anomaly Detection and Collaborative Filtering
close all;clc
% ʹ��Эͬ�˲��������е�Ӱ�Ƽ�
%% 1.��������
load ('ex8_movies.mat');
fprintf('Average rating for movie 1 (Toy Story): %f / 5\n\n', ...
        mean(Y(1,R(1,:))));
figure(1);
imagesc(Y);
ylabel('Movies');
xlabel('Users');
hold off;

%% 2.�������
load ('ex8_movieParams.mat');
% ֱѡ�����е�С�������ݽ��м��㣬��֤��������ȷ��
num_movies = 5;
num_features = 3;
num_users = 4; 
X = X(1:num_movies, 1:num_features);
Theta = Theta(1:num_users, 1:num_features);
Y = Y(1:num_movies, 1:num_users);
R = R(1:num_movies, 1:num_users);

params = [X(:);Theta(:)];
J = cofiCostFunc(params, Y, R, num_users, num_movies, ...
               num_features, 0);
           
fprintf(['Cost at loaded parameters: %f '...
         '\n(this value should be about 22.22)\n'], J);

%% 3.����ݶ�
fprintf('\nChecking Gradients (without regularization) ... \n');

checkCostFunction;

%% 4.����������
clc;
lambda = 1.5;
J = cofiCostFunc(params, Y, R, num_users, num_movies, ...
               num_features, lambda);
           
fprintf(['Cost at loaded parameters (lambda = 1.5): %f '...
         '\n(this value should be about 31.34)\n'], J);

checkCostFunction(lambda);

%% 5.��ȡ��Ӱ�б���һЩ��Ӱ�������
movieList = loadMovieList();
my_ratings = zeros(length(movieList), 1);

% �����һЩ��Ӱ������
my_ratings(1) = 4;
my_ratings(98) = 2;
my_ratings(7) = 3;
my_ratings(12)= 5;
my_ratings(54) = 4;
my_ratings(64)= 5;
my_ratings(66)= 3;
my_ratings(69) = 5;
my_ratings(183) = 4;
my_ratings(226) = 5;
my_ratings(355)= 5;

fprintf('\n\nNew user ratings:\n');
index = find(my_ratings > 0);
for i=1:length(index)
     fprintf('Rated %d for %s\n', my_ratings(index(i)), movieList{index(i)});
end

%% 6.����Эͬ�˲�ѵ����ѧϰ
load('ex8_movies.mat');
% ��ǰ������������ӽ�Y��R������
Y = [my_ratings,Y];
R = [(my_ratings ~= 0),R];
% ȥ��ֵ
[Ynorm, Ymean] = normalizeRatings(Y, R);
% ���ò���
num_users = size(Y, 2);
num_movies = size(Y, 1);
num_features = 10;
% ���ó�ʼֵ
X = randn(num_movies, num_features);
Theta = randn(num_users, num_features);
initial_parameters = [X(:); Theta(:)];
% ѵ��
lambda = 10;
options = optimset('GradObj', 'on', 'MaxIter', 100);
costFun = @(t) cofiCostFunc(t, Y, R, num_users, num_movies,num_features, lambda);
theta = fmincg (costFun ,initial_parameters, options);

X = reshape(theta(1:num_movies*num_features), num_movies, num_features);
Theta = reshape(theta(num_movies*num_features+1:end), ...
                num_users, num_features);

fprintf('Recommender system learning completed.\n');

%% 7.ʹ������ѵ������X��Theta�������Ƽ�
% �����Ԥ�������
p = X * Theta';
my_predictions = p(:,1) + Ymean;
% ѡ��������ߵ�10����Ӱ�����Ƽ�
[r, ix] = sort(my_predictions, 'descend');
fprintf('\nTop recommendations for you:\n');
for i = 1:10
    j = ix(i);
    fprintf('Predicting rating %.1f for movie %s\n', r(i),movieList{j});
end
