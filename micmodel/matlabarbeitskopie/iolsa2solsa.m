function olsastring = iolsa2solsa(stelle, zahl)
switch stelle
    case 1
        switch zahl
            case 0 
                olsastring = 'Peter';		
            case 1
                olsastring = 'Kerstin';
            case 2
                olsastring = 'Tanja';
            case 3
                olsastring = 'Ulrich';
            case 4
                olsastring = 'Britta';
            case 5
                olsastring = 'Wolfgang';
            case 6
                olsastring = 'Stefan';
            case 7
                olsastring = 'Thomas';
            case 8
                olsastring = 'Doris';
            case 9
                olsastring = 'Nina';
            otherwise
                error('Konnte Namen nicht zuweisen');
        end
    case 2
        switch zahl
            case 0
                olsastring = 'bekommt';
            case 1
                olsastring = 'sieht';
            case 2
                olsastring = 'kauft';
            case 3
                olsastring = 'gibt';
            case 4
                olsastring = 'schenkt';
            case 5
                olsastring = 'verleiht';
            case 6
                olsastring = 'hat';
            case 7
                olsastring = 'gewann';
            case 8
                olsastring = 'nahm';
            case 9 
                olsastring = 'malt';
            otherwise
                error('Konnte Verb nicht zuweisen');
        end
    case 3
        switch zahl
            case 0
                olsastring = 'drei';
            case 1
                olsastring = 'neun';
            case 2
                olsastring = 'sieben';
            case 3
                olsastring = 'acht';
            case 4
                olsastring = 'vier';
            case 5
                olsastring = 'fünf';
            case 6
                olsastring = 'zwei';
            case 7
                olsastring = 'achtzehn';
            case 8
                olsastring = 'zwölf';
            case 9 
                olsastring = 'elf';
            otherwise
                error('Konnte Zahl nicht zuweisen');
        end
    case 4
        switch zahl
            case 0
                olsastring = 'große';
            case 1
                olsastring = 'kleine';
            case 2
                olsastring = 'alte';
            case 3
                olsastring = 'nasse';
            case 4
                olsastring = 'schwere';
            case 5
                olsastring = 'grüne';
            case 6
                olsastring = 'teure';
            case 7
                olsastring = 'schöne';
            case 8
                olsastring = 'rote';
            case 9 
                olsastring = 'weiße';
            otherwise
                error('Konnte Adjektiv nicht zuweisen');
        end
    case 5
        switch zahl
            case 0
                olsastring = 'Blumen';
            case 1
                olsastring = 'Tassen'; 
            case 2
                olsastring = 'Autos';
            case 3
                olsastring = 'Bilder';
            case 4
                olsastring = 'Dosen';
            case 5
                olsastring = 'Sessel' ;
            case 6
                olsastring = 'Messer';
            case 7
                olsastring = 'Schuhe';
            case 8
                olsastring = 'Steine';
            case 9 
                olsastring = 'Ringe';
            otherwise
                error('Konnte Zahl nicht zuweisen');
        end
    otherwise
        error('Konnte Transskription nicht zuweisen');
end