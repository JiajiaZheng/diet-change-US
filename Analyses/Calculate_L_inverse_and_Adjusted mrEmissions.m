% Arjan de Koning
% Institute of Environmental Sciences (CML), Leiden University
% 1 September 2014
% Calculating & exporting the Leontief inverse from the Industry by Industry 
% input output table based on fixed product sales assumption. The
% Leontief inverse: Linv = (I-A)^-1

clear all;
disp('Calculating Leontief inverse from ixi input-output table based on fixed product sales assumption');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                             %
% Reading input                                                               %
%                                                                             %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

	A = dlmread('mrIot_version2.2.2.txt','\t',2,3);
	disp('Ready reading "mrIot.txt"');
	
	                                                          
%%% End reading input %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                             %
% Calculate leontief inverse                                                  %
%                                                                             %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

	[rows, cols] = size(A)
	I = eye(rows);
	Linv = inv(I-A);
	disp('Ready calculating Leontief inverse');
	

%%% End calculating leontief inverse%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                             %
% Writing output                                                              %
%                                                                             %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

	dlmwrite('L_inverse_2.2.2.txt', Linv);
	disp('Ready exporting Leontief inverse');
    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                         %               
% Calculating adjusted emission factor matrix                             %
%                                                                         %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    B = dlmread('mrEmissions_version2.2.2.txt','\t',2,3);
    C = B * Linv;
    disp('Ready exporting ajusted emission factor matrix');
    dlmwrite('Ajusted mrEmissions_2.2.2.xls', C)

	
%%% End writing output %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



clear all;




