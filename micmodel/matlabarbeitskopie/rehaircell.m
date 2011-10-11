function x_response = rehaircell(y_response)
%approximates the retransformation of haircell
% y_response: output of haircell
% x_response: approximative input of haircell

FrameLen = ceil(size(y_response,1)/10); % Frame Length in Samples
for ChanNr = 1:size(y_response,2)
    for FrameNr = 1:ceil(length(y_response(:,ChanNr))/FrameLen)
        actualframe = y_response((FrameNr-1)*FrameLen+1:min([FrameNr*FrameLen,size(y_response,1)]),ChanNr);
        if mean(actualframe) < 0.005 %this value is empirical
            x_response((FrameNr-1)*FrameLen+1:min([FrameNr*FrameLen,size(y_response,1)]),ChanNr) = actualframe;
        else
            
            spectral_y_response = fft(actualframe);
            % find the maximum of spectrum without DC-part
            [maximumvalue,index] = max(abs(spectral_y_response(2:end)));
            % take 2 periods of the signal
            periodwindowLen = ceil(2*length(spectral_y_response)/index);
            for WindowNr = 1:ceil(FrameLen/periodwindowLen)
                actualwindow = actualframe((WindowNr-1)*periodwindowLen+1:min([WindowNr*periodwindowLen,length(actualframe)]));
                meanWindowValue = max(actualwindow)/2;
                x_window((WindowNr-1)*periodwindowLen+1:min([WindowNr*periodwindowLen,length(actualframe)])) = (actualwindow-meanWindowValue)./max(actualwindow-meanWindowValue).*max(actualwindow);
            end
            x_response((FrameNr-1)*FrameLen+1:FrameNr*FrameLen,ChanNr) = x_window;
            
        end
    end
end
