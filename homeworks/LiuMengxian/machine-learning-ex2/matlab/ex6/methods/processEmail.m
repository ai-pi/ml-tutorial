function word_indices = processEmail(email_contents)
%% �������ܣ�������ת��������
% ��ô�������ˣ�word to vector����ôʵ�֣�
% ���ļ������е�Ԫ�غʹʴ��е�Ԫ���������Աȣ���Ԫ���ڴʴ��е��±���ӽ��ļ�������

%% ��ȡ�ʴ�
vocabList = getVocabList();

%% �����ĵ��е�˳����ʼ����ݽ��д���
% 1.���ʼ����ݵ��ַ���ת����Сд��ʽ
email_contents = lower(email_contents);
% 2.�ÿհ׷��滻HTML�ı��tag
% ������ʽ���滻�ԡ�<����ͷ���ԡ�>����β������������<>�����ַ���
% [ ]�У�^��ʾ��
email_contents = regexprep(email_contents, '<[^<>]+>', ' ');
% 3.�������ӣ���httpaddr������������
email_contents = regexprep(email_contents, ...
                           '(http|https)://[^\s]*', 'httpaddr');               
% 4.���������ַ����emailaddr���������ַ
email_contents = regexprep(email_contents, '[^\s]+@[^\s]+', 'emailaddr');
% 5.�������֣���number������������
email_contents = regexprep(email_contents, '[0-9]+', 'number');
% 6.�����Ǯ���ţ���dollar����$
email_contents = regexprep(email_contents, '[$]+', 'dollar');

% Output the email to screen as well
fprintf('\n==== Processed Email ====\n\n');

% Process file
l = 0;

while ~isempty(email_contents)
    % ���ʼ����ݽ����з֣�char(num)��ʾASCII���б��Ϊnum���ַ�
    [str, email_contents] = strtok(email_contents,[' @$/#.-:&*+=[]?!(){},''">_<;%' newline char(13)]);
    % 7.�ѷ��ַ���space��tab�ȣ�����
    str = regexprep(str, '[^a-zA-Z0-9]', '');

    % Stem the word 
    % (the porterStemmer sometimes has issues, so we use a try catch block)
    try str = porterStemmer(strtrim(str)); 
    catch str = ''; 
        continue;
    end
    % Skip the word if it is too short
    if length(str) < 1
       continue;
    end
    
	% �ļ����±�����
	word_indices = [];
	for i=1:length(vocabList)
    % �Ƚ������ַ���Ƿ����
	match(i)=strcmp(vocabList{i}, str);
		if (match(i)==1)
			word_indices = [word_indices; i];
		else
			word_indices = [word_indices;[]];
        end
    end	
    % =============================================================
    % Print to screen, ensuring that the output lines are not too long
    if (l + length(str) + 1) > 78
        fprintf('\n');
        l = 0;
    end
    fprintf('%s ', str);
    l = l + length(str) + 1;
end

end