function file_contents = readFile(filename)
%% �������ܣ�����һ���ļ����������ļ�������
% ���ļ�����������ļ���Ӧ��id��ֵ���ڵ���3
fid = fopen(filename);
if fid
    % ɨ���idָ����ļ�����ȡÿһ���ַ�%c�������ո񣩣�ֱ���ļ�����
    % ��һ�����һ���ǹ̶�����
    file_contents = fscanf(fid, '%c', inf);
else
    file_contents = '';
    fprintf('Unable to open %s\n', filename);
end
% �����Ҫ�ر��ļ������е�����python��ȡ�ļ�������
fclose(fid);
end
