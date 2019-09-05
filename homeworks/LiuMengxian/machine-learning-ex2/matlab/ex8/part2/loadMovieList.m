function movieList = loadMovieList()
%% �������ܣ���ȡ��Ӱ�б�Ҳ���Ǵ�txt�ļ��ж�ȡ���ݣ���ǰ���ʼ���������
fid = fopen('movie_ids.txt');

n = 1682;  % Total number of movies 

movieList = cell(n, 1);
for i = 1:n
    line = fgets(fid);
    [~, movieName] = strtok(line, ' ');
    movieList{i} = strtrim(movieName);
end
fclose(fid);

end
