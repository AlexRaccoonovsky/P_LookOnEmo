function CompTableAppend=AppendToCompTable(InitCellArray)
% Function for extract & appending parameters in individual columns
% PosEmo(Positive Emotions), NegEmo (Negative Emotions) of Complex Table

% String of full path to file
FullPatch=strcat(InitCellArray{1,1},InitCellArray{1,2});
% load Complex Table data
CompTable=load(FullPatch,'CompTable');
% Evaluating PosEmo 
CompTable.CompTable.PosEmo=CompTable.CompTable.HP-CompTable.CompTable.OP;
% Evaluating PosEmo (PerCent) relatively OP
CompTable.CompTable.PosEmoRel_PerCent=(CompTable.CompTable.PosEmo*100)./CompTable.CompTable.OP;
% Evaluating NegEmo 
CompTable.CompTable.NegEmo=CompTable.CompTable.OP-CompTable.CompTable.LP;
% Evaluating NegEmo (PerCent) relatively OP
CompTable.CompTable.NegEmoRel_PerCent=(CompTable.CompTable.NegEmo*100)./CompTable.CompTable.OP;
% Evaluating NegEmo (PerCent) relatively OP
% Creating column Weekday
CompTable.CompTable.Weekday=weekday(CompTable.CompTable.Date,'long');
% Append Column for color of Body (Grey Color for immutabled candles (OP~CP)))
CompTable.CompTable.BodyColor=BodyColorCalculate(CompTable);
% Result
CompTableAppend = CompTable.CompTable;

% Subfunction for calculating BodyColor
 function BodyColorColumn=BodyColorCalculate(CompTable)
% Calculating difference (CP-OP)
DifValue=CompTable.CompTable.CP-CompTable.CompTable.OP;
% Forming BodyColor column
BodyColorColumn = FormingBodyColor(DifValue);
% Transformate BodyColor column
     function BodyColorColumn=FormingBodyColor(DifValue)
         GreyDeltaConst=3;
         SizeOfDifValue=size(DifValue)
         for CurRow=1:1:SizeOfDifValue(1,1)
             if abs(DifValue(CurRow))<=GreyDeltaConst
                BodyColorColumn(CurRow,1)="grey";
             else
                 if DifValue(CurRow)>0
                    BodyColorColumn(CurRow,1)="white";
                 else
                    BodyColorColumn(CurRow,1)="black";
                end
             end
         end
