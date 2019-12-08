% Script of treatment & plotting
% Plotting Candle graph for data from CompTableAppend
subplot(2,2,1:2)
highlow(CompTableAppend.HP,CompTableAppend.LP,CompTableAppend.CP,CompTableAppend.OP,'red');

ax2=subplot(2,2,3)
[ScatterByRangePosEmoMatrix,RangesValueLegend]=CalcAbsoluteScatter(FilteredSample,IncludeParam{6,2});
bar(ScatterByRangePosEmoMatrix);
%legend(ax2,RangesValueLegend);

ax3=subplot(2,2,4)
QuanByRangePosEmoColumn=ScatterByRangePosEmoMatrix(1:end,1);
pie(QuanByRangePosEmoColumn);
legend(ax3,RangesValueLegend);


%% Scattering by ranges ()
function [PlotMtrx,RangesValueLegend]=CalcAbsoluteScatter(FilteredSample,Ranges)
QuantOfRanges=size(Ranges.StartPointsOfRanges);
PlotMtrx=zeros(QuantOfRanges(1,2),4);
SizeFilteredSample=size(FilteredSample);
        for NumRange=1:1:QuantOfRanges(1,2)
            % Testing value PosEmo in Rages 
            LogicalMatrixInRange=FilteredSample.PosEmo>=Ranges.StartPointsOfRanges(NumRange)&...
                                 FilteredSample.PosEmo<Ranges.FinishPointsOfRanges(NumRange);
            % Summary value of PosEmo in Range
            PlotMtrx(NumRange,1)=sum(LogicalMatrixInRange);
            % Forming Text Cell Array Legend
            RangesValueLegend{NumRange,1}=strcat(int2str(Ranges.StartPointsOfRanges(NumRange)),...
                                                '-',int2str(Ranges.FinishPointsOfRanges(NumRange)));
            % Calculate scattering of BodyColor
            for NumRowInFilteredSample=1:1:SizeFilteredSample(1,1)
                if LogicalMatrixInRange(NumRowInFilteredSample,1)==1
                    switch FilteredSample.BodyColor(NumRowInFilteredSample)
                        case "white"
                            PlotMtrx(NumRange,2)=PlotMtrx(NumRange,2)+1;
                        case "black"
                            PlotMtrx(NumRange,3)=PlotMtrx(NumRange,3)+1;
                        case "grey"
                            PlotMtrx(NumRange,4)=PlotMtrx(NumRange,4)+1;
                    end
                end
           end
        end
end