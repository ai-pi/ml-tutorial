function init_theta = randInitializeWeights(input_layer , output_layer)
%% �������ܣ���ʼ�������֮���Ȩ�أ����룺L_in�������L_out
epsilon_init = sqrt(6) / sqrt(input_layer + output_layer);
init_theta = rand( output_layer,input_layer+1) * 2* epsilon_init - epsilon_init;

end