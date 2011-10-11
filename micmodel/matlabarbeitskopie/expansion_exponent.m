function exponent = expansion_exponent(hearing_loss)

%%% This function computes to every hearing loss in dB HL an expansion
%%% factor. This factor expands the signal prior to the adaptation loops

exponent = 100./(100-hearing_loss);