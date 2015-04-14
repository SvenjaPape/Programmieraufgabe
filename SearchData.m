% script to ...
% Usage: run(...)
% Input parameter: None
% Output parameter: None
% Output:
% plays the sum signal
% plots the sum signal
%-------------------------------------------------------------------------%
% Authors: A. Decker, A. Morgenstern, S. Pape
% (c) IHA @ Jade Hochschule applied licence see EOF 
% Sources: 
%   - inputdlg, Matlab documentation
% function 'SinSignal' by J. Bitzer and M. Hansen, taken from the script
% 'Grundlagenpraktikum: Matlabversuche'
%-------------------------------------------------------------------------%


listing = dir('TIMIT MIT');
cDir2seek = {}; %c DAVOR WIRKLICH FÜR EINEN CELL ARRAY??
counter = 0; % counter to fill array of found directory names


% GUI for user to enter search criteria, default is empty
prompt = {'Speaker´s name:','Sentence:','Word:','Phoneme:'};
dlg_title = 'Search criteria';
num_lines = 1;
def = {' ',' ',' ',' '};
answer = inputdlg(prompt,dlg_title,num_lines,def);

% saves each search criteria in it's own variable
sPerson = answer{1};
sSentence = answer{2};
sWord = answer{3};
sPhoneme = answer{4};

%if-loop to check if criterion is not empty and to save directory names
%which fit criteria
if sPerson ~= ' '
    for i = (1:length(listing))
         if listing(i).isdir == 1 % checks if result is directory
             listing(i).name
             if regexp(listing(i).name,strcat('[a-zA-Z0-9]+\-[mf]',sPerson)) % checks if name matches
                cDir2seek{1,1} = listing(i).name; % saves directory name in cell array
             end
         end
    end
else
    for i = (1:length(listing)) % if no name qualified, creates cell array of all directory names
         if listing(i).isdir == 1 && length(listing(i).name)>4 % checks if valid directory
             counter = counter + 1;
             cDir2seek{1,counter} = listing(i).name;
         end
    end
end

%% 


%--------------------Licence ---------------------------------------------
% Copyright (c) <2014> A. Decker, A. Morgenstern, S. Pape
% Institute for Hearing Technology and Audiology
% Jade University of Applied Sciences Oldenburg 
% Permission is hereby granted, free of charge, to any person obtaining 
% a copy of this software and associated documentation files 
% (the "Software"), to deal in the Software without restriction, including 
% without limitation the rights to use, copy, modify, merge, publish, 
% distribute, sublicense, and/or sell copies of the Software, and to 
% permit persons to whom the Software is furnished to do so, subject 
% to the following conditions:
% The above copyright notice and this permission notice shall be included 
% in all copies or substantial portions of the Software.
% THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, 
% EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES 
% OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. 
% IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY 
% CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, 
% TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE 
% SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
