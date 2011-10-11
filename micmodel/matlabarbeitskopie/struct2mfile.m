function struct2mfile(S,StructName,MaxNumOfValuesConv2Txt,FileName)
%
%struct2mfile(Sruct,StructName[,MaxNumOfValuesConv2Txt,FileName])
%
%Writes the Matlab structure "Struct" to an m-file "FileName.m"
%as readable Matlab code. The structure can be recreated
%simply by starting the m-file from the Matlab prompt. The script is useful
%e.g. to modify certain values of a complex structure or simply to get an
%overview of the data.
%
%Input arguments:
%Struct              - Matlab structure to write to "FileName.m"
%StructName          - root variable name of the structure (string)
%                      the name given here can differ from the name of the 
%                      structure in the workspace.
%MaxNumOfValues4Txt  - maximum number of values in a single nummeric matrix
%                      to be displayed as text. Larger objects will be
%                      saved as extra mat files, that will be loaded 
%                      automatically to the structure when running the 
%                      m-file. (Default = 100)
%FileName            - Name of m-file (Default: structdata.m)   
%
%Output:
%                    - m-file "structdata.m" or "'FileName'.m"
%
%Version: 1.0 alpha
%
%(c) 2005 by Manfred Mauermann
%

if nargin < 4, FileName = '';           end
if nargin < 3, MaxNumOfValuesConv2Txt = []; end
if nargin < 2, StructName = '';         end
if nargin < 1
    help struct2mfile;
    return
end    

if isempty(FileName),           FileName = 'structdata.m'; end
if isempty(MaxNumOfValuesConv2Txt), MaxNumOfValuesConv2Txt = 100 ; end


fid = fopen(FileName,'wt');
struct2m(fid,S,StructName,MaxNumOfValuesConv2Txt);
fclose(fid)


%==========================================================================
%==========================================================================
function struct2m(fid,S,StructName,MaxNumOfValuesConv2Txt,VarName,TakeFieldNamesFrom)

   
if nargin < 6
    TakeFieldNamesFrom = S;
end
if nargin < 5
    VarName = '';
end


if ~isempty(StructName) & ~isequal(StructName(end),'.')
    StructName = [StructName '.'];
end

FieldNames = fieldnames(TakeFieldNamesFrom);
for t = 1:length(FieldNames)
    if isempty(VarName)
        ActVarName = [FieldNames{t}];        
    else
        ActVarName = [VarName '.' FieldNames{t} ];
    end
    
    if isstruct(eval(['S.' ActVarName]))
        if length(eval(['S.' ActVarName])) > 1
            for t = 1:length(eval(['S.' ActVarName]))
                ActVarName_ = sprintf('%s(%d)',ActVarName,t);
                struct2m(fid,S,StructName,MaxNumOfValuesConv2Txt,ActVarName_,eval(['S.' ActVarName_]));
            end
        else
            struct2m(fid,S,StructName,MaxNumOfValuesConv2Txt,ActVarName,eval(['S.' ActVarName]));
        end

    elseif iscell(eval(['S.' ActVarName]))
        Value = eval(['S.' ActVarName]);
        process_cell(S,StructName,ActVarName,Value,fid,MaxNumOfValuesConv2Txt);

    elseif isnumeric(eval(['S.' ActVarName]))
        Value = eval(['S.' ActVarName]);
        process_numeric(StructName,ActVarName,Value,fid,MaxNumOfValuesConv2Txt);
        
    elseif ischar(eval(['S.' ActVarName]))
        Value = eval(['S.' ActVarName]);
        process_string(StructName,ActVarName,Value,fid);
        
    end
    
end

return

%=========================================================================
function process_cell(S,StructName,VarName,Value,fid,MaxNumOfValuesConv2Txt)

Dims = size(Value);

if isequal(length(Dims),2) & ( isequal(Dims(1),1) | isequal(Dims(2),1) )
    [indexlist]         = createindexlist(max(Dims));
else    
    [indexlist]         = createindexlist(Dims);
end    
tmp                 = repmat(',%d',1,size(indexlist,2));
tmp                 = tmp(2:end);
VarNameExtFormatStr = ['{' tmp  '}'];

for t = 1:size(indexlist,1) 
    VarNameExt = sprintf(VarNameExtFormatStr,indexlist(t,:));
    ActVarName = sprintf('%s%s',VarName,VarNameExt);
    ActValue   = eval(['S.' ActVarName]);
    if isstruct(ActValue) | iscell(ActValue)
        struct2m(fid,S,StructName,MaxNumOfValuesConv2Txt,ActVarName,ActValue);
    elseif isnumeric(ActValue)
        process_numeric(StructName,ActVarName,ActValue,fid,MaxNumOfValuesConv2Txt);
    elseif ischar(ActValue)
        process_string(StructName,ActVarName,ActValue,fid);
    else
        if isempty(ActValue)
            ActValue = '[]';
        end
        fprintf(fid,'\n%s%s = %s;',StructName,ActVarName,ActValue);
    end
 end
%=========================================================================
function process_string(StructName,VarName,Value,fid)

if size(Value,1) > 1
    fprintf(fid,'\n%s%s = [',StructName,VarName);
    for t = 1:size(Value,1)
      fprintf(fid,'... \n''%s''; ',Value(t,:));
    end
    fprintf(fid,'];');
else
    fprintf(fid,'\n%s%s = ''%s'';',StructName,VarName,Value);
end


%=========================================================================
function process_numeric(StructName,VarName,Value,fid,MaxNumOfValuesConv2Txt)

persistent BLOBCounter
if isempty(BLOBCounter)
    BLOBCounter = 0;
end    
BLOBCounter = BLOBCounter +1;

Dims = size(Value);
if prod(Dims) > MaxNumOfValuesConv2Txt
    BLOBFileName = sprintf('BLOB_%d-%d-%d_%dh-%dm-%2.0fs_%d.mat',clock,BLOBCounter);
    fprintf(fid,'\ntmp = load(''%s'');',BLOBFileName);
    fprintf(fid,'\n%s%s = tmp.blob;',StructName,VarName);
    blob = Value;
    save(BLOBFileName,'blob');
    clear blob;
    return
end
if length(Dims) > 2
    Dims = Dims(3:end);
    [indexlist]         = createindexlist(Dims);
    tmp                 = repmat(',%d',1,size(indexlist,2));
    VarNameExtFormatStr = ['(:,:' tmp  ')'];
else
    VarNameExtFormatStr = '';
    indexlist = 1;
end    
    
if size(Value,1) <= 1 | size(Value,2) <= 1
    tmp = repmat(', %g',1,length(Value));
    tmp = tmp(2:end);
    if size(Value,1) > 1
        FormatStr = ['\n%s%s = [' tmp ']'';'];
        fprintf(fid,FormatStr,StructName,VarName,Value');
    else
        FormatStr = ['\n%s%s = [' tmp '];'];
        fprintf(fid,FormatStr,StructName,VarName,Value);
    end
   
else
    for t = 1:size(indexlist,1)
        if isequal(indexlist,1)
            VarNameExt = sprintf(VarNameExtFormatStr);
        else
            VarNameExt = sprintf(VarNameExtFormatStr,indexlist(t,:));
        end
        fprintf(fid,'\n%s%s%s = [ ... ',StructName,VarName,VarNameExt);
        Value_ = eval(sprintf('Value%s',VarNameExt));
        for d = 1:size(Value_,1)
            tmp = repmat(', %g',1,size(Value_,2));
            tmp = tmp(2:end);
            if isequal(d,size(Value_,1))
                FormatStr = ['\n ' tmp ];
            else
                FormatStr = ['\n ' tmp '; ...'];                
            end
            fprintf(fid,FormatStr,Value_(d,:));
        end
        fprintf(fid,'];')
    end
end

    
%======================================================================
function [indexlist] = createindexlist(MaxIndex)


DimIndex = ones(size(MaxIndex));
Dim      = length(MaxIndex);
resetcol = 0;
col      = length(DimIndex);
counter  = 0;


while true
    counter = counter + 1;
    indexlist(counter,:)= DimIndex;
    DimIndex(col) = DimIndex(col) + 1;
    while DimIndex(col) > MaxIndex(col)
        DimIndex(col:Dim) = 1;
        resetcol = 1;
        col = col-1;
        if ~col
            break
        end
        DimIndex(col) = DimIndex(col) + 1;        
    end
    if ~col
        break;
    end
    if resetcol
        resetcol = 0;
        col = Dim;
    end
end




