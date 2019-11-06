function CompTableAppend=AppendToCompTable(InitCellArray)
% Function for extract & appending parameters in individual columns
% PosEmo(Positive Emotions), NegEmo (Negative Emotions) of Complex Table

% String of full path to file
FullPatch=strcat(InitCellArray{1,1},InitCellArray{1,2});
% load Complex Table data
CompTable=load(FullPatch,'CompTable');
% Evaluating PosEmo 
CompTable.CompTable.PosEmo=CompTable.CompTable.HP-CompTable.CompTable.OP;
CompTable.CompTable.NegEmo=CompTable.CompTable.OP-CompTable.CompTable.LP;
BDAppend = CompTable.CompTable;

