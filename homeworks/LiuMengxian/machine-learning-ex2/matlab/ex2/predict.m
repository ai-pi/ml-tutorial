`function p = predict(theta,X )
%% �������ܣ����ݵõ��Ĳ����������ݽ���Ԥ�⣬�������
p = X * theta;
p(p>0.5)=1;
p(p<0.5)=0;

end
