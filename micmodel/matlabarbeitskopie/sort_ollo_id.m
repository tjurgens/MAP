function sort_ollo
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%   Sorts every OLLO-wav-file in the current working directory to the testdaten_
%   directories for testing the phonems that are placed in the middle
%
%  (c) Tim Jürgens, Medizinische Physik, Feb.2006
%
%  usage: sort_ollo
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
   cd a_a;
   if ~isdir('vocabulary')
       mkdir('vocabulary');
   end
   if ~isdir('normal_auswahl');
       mkdir('normal_auswahl');
   end
   cd ..;
end
if ~isdir('e_e')      
   mkdir('e_e');
   cd e_e;
   if ~isdir('vocabulary')
       mkdir('vocabulary');
   end
   if ~isdir('normal_auswahl');
       mkdir('normal_auswahl');
   end
   cd ..;
end
if ~isdir('i_i')      
   mkdir('i_i');
   cd i_i;
   if ~isdir('vocabulary')
       mkdir('vocabulary');
   end
   if ~isdir('normal_auswahl');
       mkdir('normal_auswahl');
   end
   cd ..;
end
if ~isdir('o_o')      
   mkdir('o_o');
   cd o_o;
   if ~isdir('vocabulary')
       mkdir('vocabulary');
   end
   if ~isdir('normal_auswahl');
       mkdir('normal_auswahl');
   end
   cd ..;
end
if ~isdir('u_u')      
   mkdir('u_u');
   cd u_u;
   if ~isdir('vocabulary')
       mkdir('vocabulary');
   end
   if ~isdir('normal_auswahl');
       mkdir('normal_auswahl');
   end
   cd ..;
end
if ~isdir('d_d')      
   mkdir('d_d');
   cd d_d;
   if ~isdir('vocabulary')
       mkdir('vocabulary');
   end
   if ~isdir('normal_auswahl');
       mkdir('normal_auswahl');
   end
   cd ..;
end
if ~isdir('t_t')      
   mkdir('t_t');
   cd t_t;
   if ~isdir('vocabulary')
       mkdir('vocabulary');
   end
   if ~isdir('normal_auswahl');
       mkdir('normal_auswahl');
   end
   cd ..;
end
if ~isdir('g_g')      
   mkdir('g_g');
   cd g_g;
   if ~isdir('vocabulary')
       mkdir('vocabulary');
   end
   if ~isdir('normal_auswahl');
       mkdir('normal_auswahl');
   end
   cd ..;
end
if ~isdir('k_k')      
   mkdir('k_k');
   cd k_k;
   if ~isdir('vocabulary')
       mkdir('vocabulary');
   end
   if ~isdir('normal_auswahl');
       mkdir('normal_auswahl');
   end
   cd ..;
end
if ~isdir('f_f')      
   mkdir('f_f');
   cd f_f;
   if ~isdir('vocabulary')
       mkdir('vocabulary');
   end
   if ~isdir('normal_auswahl');
       mkdir('normal_auswahl');
   end
   cd ..;
end
if ~isdir('s_s')      
   mkdir('s_s');
   cd s_s;
   if ~isdir('vocabulary')
       mkdir('vocabulary');
   end
   if ~isdir('normal_auswahl');
       mkdir('normal_auswahl');
   end
   cd ..;
end
if ~isdir('b_b')      
   mkdir('b_b');
   cd b_b;
   if ~isdir('vocabulary')
       mkdir('vocabulary');
   end
   if ~isdir('normal_auswahl');
       mkdir('normal_auswahl');
   end
   cd ..;
end
if ~isdir('p_p')      
   mkdir('p_p');
   cd p_p;
   if ~isdir('vocabulary')
       mkdir('vocabulary');
   end
   if ~isdir('normal_auswahl');
       mkdir('normal_auswahl');
   end
   cd ..;
end

%moving files into directories
for i = 1:nFiles,
    loga_number = eval(File(i).name(7:9));
    if (find(loga_number == a_a))
        copyfile(File(i).name,'./a_a/vocabulary/');
        system(['move ',File(i).name,' ./a_a/normal_auswahl/']);
    elseif (find(loga_number == e_e))
        copyfile(File(i).name,'./e_e/vocabulary/');
        system(['move ',File(i).name,' ./e_e/normal_auswahl/']);
    elseif (find(loga_number == i_i))
        copyfile(File(i).name,'./i_i/vocabulary/');
        system(['move ',File(i).name,' ./i_i/normal_auswahl/']);
    elseif (find(loga_number == o_o))
        copyfile(File(i).name,'./o_o/vocabulary/');
        system(['move ',File(i).name,' ./o_o/normal_auswahl/']);
    elseif (find(loga_number == u_u))
        copyfile(File(i).name,'./u_u/vocabulary/');
        system(['move ',File(i).name,' ./u_u/normal_auswahl/']);
    elseif (find(loga_number == d_d))
        copyfile(File(i).name,'./d_d/vocabulary/');
        system(['move ',File(i).name,' ./d_d/normal_auswahl/']);
    elseif (find(loga_number == t_t))
        copyfile(File(i).name,'./t_t/vocabulary/');
        system(['move ',File(i).name,' ./t_t/normal_auswahl/']);
    elseif (find(loga_number == g_g))
        copyfile(File(i).name,'./g_g/vocabulary/');
        system(['move ',File(i).name,' ./g_g/normal_auswahl/']);
    elseif (find(loga_number == k_k))
        copyfile(File(i).name,'./k_k/vocabulary/');
        system(['move ',File(i).name,' ./k_k/normal_auswahl/']);
    elseif (find(loga_number == f_f))
        copyfile(File(i).name,'./f_f/vocabulary/');
        system(['move ',File(i).name,' ./f_f/normal_auswahl/']);
    elseif (find(loga_number == s_s))
        copyfile(File(i).name,'./s_s/vocabulary/');
        system(['move ',File(i).name,' ./s_s/normal_auswahl/']);
    elseif (find(loga_number == b_b))
        copyfile(File(i).name,'./b_b/vocabulary/');
        system(['move ',File(i).name,' ./b_b/normal_auswahl/']);
    elseif (find(loga_number == p_p))
        copyfile(File(i).name,'./p_p/vocabulary/');
        system(['move ',File(i).name,' ./p_p/normal_auswahl/']);
    end
end