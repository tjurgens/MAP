function [xaxis,sumgaussian,transfermatrix] = showGMM(modelfilename, class, state, DCTcoefficient)
% function that plots the Gaussians that were fitted to speech features using HTK 
%
% input: modelfilename: filename of the HTK output file. This file can be
%               found in the folder hmm*, whereas * is a number that refers to the
%               iteration of the hmm
%        class: name of the "word": 'one', 'two', 'three', 'four', 'five', 'six', 
%               'seven', 'eight', 'nine', 'ten', 'zero', 'oh', 'sil'.
%        state: HMM-state, usually a number 1-18
%        DCTcoefficient: DCT coefficient to use
%        
%
% Tim Juergens, November 2011
if nargin < 4
    error('Please specify the model filename, the class, the state and the number of the DCT coefficient');
end

class = ['"' class '"']; %the classes are set in quota

fid = fopen(modelfilename,'r');
if fid == -1
    error(['Cannot open file ' modelfilename '. Check existence!'])
end
s_string = repmat('%s',1,max([DCTcoefficient+2 20])); %'+2' because the first 
%   two columns in the file contain information whats in the row, take at
%   least 20 columns to get the complete transfer matrix
a = textscan(fid,s_string,'Delimiter',' '); %each cell entry is one column in the file

%find class
for iCounter = 1:size(a{2})
    if strcmp(class,cell2mat(a{2}(iCounter)))
        classstartrow = iCounter;
        break;
    end 
end
if ~exist('classstartrow','var')
    error('Class not found');
end

%find state
for iCounter = classstartrow:size(a{1})
    if strcmp('<STATE>',cell2mat(a{1}(iCounter))) && strcmp(num2str(state),cell2mat(a{2}(iCounter)))
        statestartrow = iCounter;
        break;
    end
end
if ~exist('statestartrow','var')
    error('State does not exist');
end

%get the number of Gaussians (it is the next following <NUMMIXES> row)
for iCounter = statestartrow:size(a{1})
    if strcmp('<NUMMIXES>',cell2mat(a{1}(iCounter)))
        numberofmixes = a{2}(iCounter);
        break;
    end
end

%get the means and the variances of the Gaussians
for iCounter = 1:str2num(cell2mat(numberofmixes))
    for jCounter = statestartrow:size(a{1})
        if strcmp('<MIXTURE>',cell2mat(a{1}(jCounter))) && strcmp(num2str(iCounter),cell2mat(a{2}(jCounter)))
            weightgauss(iCounter) = str2num(cell2mat(a{3}(jCounter)));
            mixturestartrow = jCounter;
            for kCounter = mixturestartrow:size(a{1})
                if strcmp('<MEAN>',cell2mat(a{1}(kCounter)))
                    % the correct mean value is located two columns to the right of
                    % DCTcoefficient and one row below the keyword <MEAN>
                    meangauss(iCounter) = str2num(cell2mat(a{DCTcoefficient+2}(kCounter+1)));
                end
                if strcmp('<VARIANCE>',cell2mat(a{1}(kCounter)))
                    % the correct variance value is located two columns to the right of
                    % DCTcoefficient and one row below the keyword <VARIANCE>
                    variancegauss(iCounter) = str2num(cell2mat(a{DCTcoefficient+2}(kCounter+1)));
                    break; %break the loop for this Gaussian
                end
            end
            if length(variancegauss) == iCounter
                break;
            end
        end
        if iCounter == str2num(cell2mat(numberofmixes)) && length(variancegauss) == str2num(cell2mat(numberofmixes))
            break;
        end
    end
end

%calculate the range that should be plotted
minvalues = meangauss-3*sqrt(variancegauss);
maxvalues = meangauss+3*sqrt(variancegauss);

%plot the means and the variances
xaxis = linspace(min(minvalues),max(maxvalues),10000);
figure;
for iCounter = 1:str2num(cell2mat(numberofmixes))
    gaussianmix(iCounter,:) = weightgauss(iCounter) * 1/sqrt(variancegauss(iCounter)*2*pi).* ...
        gaussmf(xaxis,[sqrt(variancegauss(iCounter)) meangauss(iCounter)]);
    legendstring{iCounter} = ['Gaussian No. ' num2str(iCounter)];
    
end
plot(xaxis,gaussianmix);
hold on;
%plot the sum of the Gaussians
sumgaussian = sum(gaussianmix);
plot(xaxis,sumgaussian,'k--');
legendstring{iCounter+1} = ['Sum of Gaussians'];
xlabel('Amplitude');
ylabel('Probability');
titlestring = sprintf('class %s, state %d, DCT coeff. %d',class,state,DCTcoefficient);
title(titlestring);
legendcmd = ['legend('];
for iCounter = 1:length(legendstring)
    legendcmd = [legendcmd, '''' legendstring{iCounter} ''','];
end
legendcmd = [legendcmd(1:end-1) ');'];
eval(legendcmd);


%find the transfermatrix
for iCounter = classstartrow:size(a{1})
    if strcmp('<TRANSP>',cell2mat(a{1}(iCounter)))
        matrixsize = str2num(cell2mat(a{2}(iCounter)));
        for jCounter = 1:matrixsize %rows of the matrix
            for kCounter = 1:matrixsize %columns of the matrix
                transfermatrix(jCounter,kCounter) = str2num(cell2mat(a{kCounter+1}(iCounter+jCounter)));
            end
        end
        break;
    end
   
end


fclose(fid);