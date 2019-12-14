% Script of treatment & plotting
% Plotting Candle graph for data from CompTableAppend
ax1=subplot(3,2,1:2)
highlow(FilteredSample.HP,FilteredSample.LP,FilteredSample.CP,FilteredSample.OP,'red');

ax2=subplot(3,2,3)
[ScatterByRangePosEmoMatrix,RangesPosValueLegend]=CalcAbsoluteScatter(FilteredSample,IncludeParam{6,2},'PosEmo');
SignsPos=categorical(RangesPosValueLegend);
bar(SignsPos,ScatterByRangePosEmoMatrix);
%legend(ax2,RangesValueLegend);

ax3=subplot(3,2,4)
QuanByRangePosEmoColumn=ScatterByRangePosEmoMatrix(1:end,1);
pie3(QuanByRangePosEmoColumn);
legend(ax3,RangesPosValueLegend);

ax4=subplot(3,2,5)
[ScatterByRangeNegEmoMatrix,RangesNegValueLegend]=CalcAbsoluteScatter(FilteredSample,IncludeParam{6,2},'NegEmo');
SignsNeg=categorical(RangesNegValueLegend);
bar(SignsNeg,ScatterByRangeNegEmoMatrix);

ax5=subplot(3,2,6)
QuanByRangeNegEmoColumn=ScatterByRangeNegEmoMatrix(1:end,1);
pie3(QuanByRangeNegEmoColumn);
legend(ax5,RangesNegValueLegend);


%% Scattering by ranges ()
function [PlotMtrx,RangesValueLegend]=CalcAbsoluteScatter(FilteredSample,Ranges,TypeOfEmo)
QuantOfRanges=size(Ranges.StartPointsOfRanges);
PlotMtrx=zeros(QuantOfRanges(1,2),4);
SizeFilteredSample=size(FilteredSample);
    % Definite comparing column of Emo
    if (TypeOfEmo=='PosEmo')
        CompColumn=FilteredSample.PosEmo;
    else
        CompColumn=FilteredSample.NegEmo;
    end
    
        for NumRange=1:1:QuantOfRanges(1,2)
            % Testing value PosEmo in Ranges 
            LogicalMatrixInRange=CompColumn>=Ranges.StartPointsOfRanges(NumRange)&...
                                 CompColumn<Ranges.FinishPointsOfRanges(NumRange);
            % Summary value of emotions in Range
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