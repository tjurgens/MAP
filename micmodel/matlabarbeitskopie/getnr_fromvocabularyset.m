function nr = getnr_fromvocabularyset(vocabularyset)

if strcmp(vocabularyset,'a_a')
    nr = 1;
elseif strcmp(vocabularyset,'b_b')
    nr = 2;
elseif strcmp(vocabularyset,'d_d')
    nr = 3;
elseif strcmp(vocabularyset,'e_e')
    nr = 4;
elseif strcmp(vocabularyset,'f_f')
    nr = 5;
elseif strcmp(vocabularyset,'g_g')
    nr = 6;
elseif strcmp(vocabularyset,'i_i')
    nr = 7;
elseif strcmp(vocabularyset,'k_k')
    nr = 8;
elseif strcmp(vocabularyset,'o_o')
    nr = 9;
elseif strcmp(vocabularyset,'p_p')
    nr = 10;
elseif strcmp(vocabularyset,'s_s')
    nr = 11;
elseif strcmp(vocabularyset,'t_t')
    nr = 12;
elseif strcmp(vocabularyset,'u_u')
    nr = 13;
else
    error('no number from vocabularyset');
end
