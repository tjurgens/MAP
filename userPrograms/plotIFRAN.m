function plotIFRAN(data_matrix,time_axis,BFlist)

%function that produces a plot similar to the plots in Secker-Walker, JASA
%1990 Fig.2 (Neurograms) from a IFRAN data matrix
%Tim Jürgens, January 2011

start_time = 0; %start time to plot in s
temporal_length = 0.095; %length to plot in s
[tmp, start_time_index] = min(abs(start_time-time_axis));
end_time = start_time+temporal_length;
[tmp, end_time_index] = min(abs(end_time-time_axis));


%smoothing using a 4-point hamming window
hamm_window = hamming(4);
for iCounter = 1:size(data_matrix,1)
    for jCounter = 2:length(time_axis)-2 %start with 2 and end with 2 samples
        %less the length of time_axis in order not to get in conflict with the length of
        %the hamm_window
        smoothed_data_matrix(iCounter,jCounter-1) = ...
            data_matrix(iCounter,(jCounter-1):(jCounter+2))*hamm_window./sum(hamm_window);
    end
end

smoothed_time_axis = time_axis(2:end-2);


figure;
verticalshift = 400; %vertical shift of single time series in z-coordinate units
Tickvector = [];
TickLabels = [];
for iCounter = 1:size(data_matrix,1)
    hold on;
    %multiply by 1000 to set abscissa to ms units
    verticalposition = -verticalshift*(iCounter-1);
    plot(1000.*smoothed_time_axis(start_time_index:end_time_index), ...
        smoothed_data_matrix(size(data_matrix,1)-iCounter+1,start_time_index:end_time_index)+verticalposition, ...
        'k','LineWidth',0.5);
    xlim([1000*start_time 1000*end_time]);
    if mod(iCounter,10) == 1 %set best frequency as a label every 10 channels
        Tickvector = [Tickvector verticalposition];
        TickLabels = [TickLabels; BFlist(size(data_matrix,1)-iCounter+1)];
    end
end
set(gca,'yTick',Tickvector(end:-1:1),'yTickLabel',num2str(TickLabels(end:-1:1),'%4.0f'));
ylabel('Best Frequency of Filter (Hz)');
xlabel('Stimulus Time (ms)');
box on;