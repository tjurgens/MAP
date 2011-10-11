function create_directories(workingdirectory,templatefilestructure)

[success,message] = mkdir(workingdirectory);

if ~isempty(message) %falls es existiert gehen wir von der richtigen dateistruktur aus
%     warning('Directory to create is already existing');
%     antwortstring = input('Soll das bereits vorhandene Verzeichnis ueberschrieben werden? ja = 1, nein = 0  :');
%     if antwortstring == 1
%     elseif antwortstring == 0
%         error('abbruch');
%     end
else %falls es noch nicht existierte -> kopieren

    if ~copyfile([templatefilestructure '*.*'],workingdirectory)
        error('Raw directorystructure could not be initialized properly.');
    end

end



   
    