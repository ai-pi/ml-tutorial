function X_rec = recoverData(X_pro,U,K)
%% �������ܣ�ͶӰ����X_pro��K�����ɷ��лָ���ԭʼ����

X_rec=X_pro * U(:,1:K).';

end
