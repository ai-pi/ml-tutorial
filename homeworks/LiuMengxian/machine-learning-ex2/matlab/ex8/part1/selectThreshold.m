function [bestEpsilon,bestF1] = selectThreshold(yval, pval)
%% �������ܣ�ʹ����֤��������F1-scoreѡ����ʵ�����epsilon
% �ҵ���F1-score��������
step = (max(pval) - min(pval)) / 1000;
bestF1 = 0;
for epsilon = min(pval):step:max(pval)

	pred = (pval < epsilon);
	tp = sum( (yval==1) & (pred==1) );
	fp = sum( (yval==0) & (pred==1) );
	fn = sum( (yval==1) & (pred==0) );
	
	prec = tp / (tp+fp);
	rec = tp / (tp+fn);
	
	F1 = 2.*prec.*rec / (prec+rec);

    if F1 > bestF1
       bestF1 = F1;
       bestEpsilon = epsilon;
    end
end

end
