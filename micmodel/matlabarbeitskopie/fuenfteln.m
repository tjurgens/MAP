function [init_samp,end_samp,teiler] = fuenfteln(length_audio)
teiler = ceil(length_audio/5);
init_samp = floor(teiler-teiler/2);
end_samp = ceil(teiler+teiler/2);