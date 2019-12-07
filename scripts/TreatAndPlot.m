% Script of treatment & plotting
% Plotting Candle graph for data from CompTableAppend
subplot(2,2,1:2)
highlow(CompTableAppend.HP,CompTableAppend.LP,CompTableAppend.CP,CompTableAppend.OP,'red')
subplot(2,2,3)
PlotMatrix=CalcAbsoluteScatter(FilteredSample,IncludeParam{6,2})
bar(PlotMatrix);
subplot(2,2,4)

%% Scattering by ranges ()
function PlotMtrx=CalcAbsoluteScatter(FilteredSample,Ranges)
QuantOfRanges=size(Ranges.StartPointsOfRanges);
PlotMtrx=zeros(QuantOfRanges(1,2),4);
SizeFilteredSample=size(FilteredSample);
        for NumRange=1:1:QuantOfRanges(1,2)
            LogicalMatrixInRange=FilteredSample.PosEmo>=Ranges.StartPointsOfRanges(NumRange)&...
                                 FilteredSample.PosEmo<Ranges.FinishPointsOfRanges(NumRange);
            PlotMtrx(NumRange,1)=sum(LogicalMatrixInRange); 
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