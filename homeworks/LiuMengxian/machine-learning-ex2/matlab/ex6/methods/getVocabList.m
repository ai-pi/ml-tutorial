function vocabList = getVocabList()
%% �������ܣ���ȡ�̶��������б��ʴ�������������Щ����
fid = fopen('vocab.txt');
% �б���һ��1899������
n = 1899;  

vocabList = cell(n, 1);
for i = 1:n
    % �ȶ�ǰ����������е�������
    fscanf(fid, '%d', 1);
    % ��ȡ������һ���ַ���-����
    vocabList{i} = fscanf(fid, '%s', 1);
end
fclose(fid);
end