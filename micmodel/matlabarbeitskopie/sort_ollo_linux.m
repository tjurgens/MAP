function sort_ollo_linux
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%   Sorts every OLLO-wav-file in the current working directory to the testdaten_
%   directories for testing the phonems that are placed in the middle
%
%  (c) Tim Jürgens, Medizinische Physik, Feb.2006
%
%  usage: sort_ollo_linux
%
%   
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
File = dir('*.wav');
nFiles = length(File)

%%% key-table: grouping of phonems
    a_a = [1:14];
    e_e = [15:28];
    i_i = [29:42];
    o_o = [43:56];
    u_u = [57:70];
    d_d = [71:8:143];
    t_t = [72:8:144];
    g_g = [73:8:145];
    k_k = [74:8:146];
    f_f = [75:8:147];
    s_s = [76:8:148];
    b_b = [77:8:149];
    p_p = [78:8:150];

%%%%%% generating directories
if ~isdir('a_a')      
   mkdir('a_a');
end
if ~isdir('e_e')      
   mkdir('e_e');
end
if ~isdir('i_i')      
   mkdir('i_i');
end
if ~isdir('o_o')      
   mkdir('o_o');
end
if ~isdir('u_u')      
   mkdir('u_u');
end
if ~isdir('d_d')      
   mkdir('d_d');
end
if ~isdir('t_t')      
   mkdir('t_t');
end
if ~isdir('g_g')      
   mkdir('g_g');
end
if ~isdir('k_k')      
   mkdir('k_k');
end
if ~isdir('f_f')      
   mkdir('f_f');
end
if ~isdir('s_s')      
   mkdir('s_s');
end
if ~isdir('b_b')      
   mkdir('b_b');
end
if ~isdir('p_p')      
   mkdir('p_p');
end

%moving files into directories
for i = 1:nFiles,
    loga_number = eval(File(i).name(7:9));
    if (find(loga_number == a_a))
        system(['mv ',File(i).name,' ./a_a/']);
    elseif (find(loga_number == e_e))
        system(['mv ',File(i).name,' ./e_e/']);
    elseif (find(loga_number == i_i))
        system(['mv ',File(i).name,' ./i_i/']);
    elseif (find(loga_number == o_o))
        system(['mv ',File(i).name,' ./o_o/']);
    elseif (find(loga_number == u_u))
        system(['mv ',File(i).name,' ./u_u/']);
    elseif (find(loga_number == d_d))
        system(['mv ',File(i).name,' ./d_d/']);
    elseif (find(loga_number == t_t))
        system(['mv ',File(i).name,' ./t_t/']);
    elseif (find(loga_number == g_g))
        system(['mv ',File(i).name,' ./g_g/']);
    elseif (find(loga_number == k_k))
        system(['mv ',File(i).name,' ./k_k/']);
    elseif (find(loga_number == f_f))
        system(['mv ',File(i).name,' ./f_f/']);
    elseif (find(loga_number == s_s))
        system(['mv ',File(i).name,' ./s_s/']);
    elseif (find(loga_number == b_b))
        system(['mv ',File(i).name,' ./b_b/']);
    elseif (find(loga_number == p_p))
        system(['mv ',File(i).name,' ./p_p/']);
    end
end