function plit = end2bib(litfile,mode,textwidth,custom)
%
% file: ~/matlab/tools/end2bib.m
%
% - reads literature file exported by Endnote 6 into matlab data structure.
%   - The supported Endnote output style (menu 'edit', 'output styles') is "Endnote Export".
%       The files exported by Endnote (e.g., named *.ene) contain
%       the complete and unique information of the citations (including the custom fields).
%       The transformation of Endnote entries into BibTeX entries
%       is provided in the table given below in this file.
%   - The output style "Endnote Refer" (files usually named *.erf)
%       does not contain all information, and may be not in a unique fashion.
%       However, the transformation to BiBTeX should usually work
%       also with *.erf-files, but is not guaranteed.
%   - Therefore it is strongly recommended to use "Endnote Export" when using end2bib.m.
% - sorts the entries alphabetically by the label, i.e., author (1st) and year (2nd).
% - writes this structure to a file *.bib, readable for BiBTeX and LaTeX.
%
% VERSION : 1.2
% DATE    : 13 Apr 2005
% AUTHOR  : Helmut Riedel
% EMAIL   : helmut.riedel@uni-oldenburg.de
%
% INPUT  ARGUMENTS
%
% no  name       explanation
%
%  1. litfile    filename of the literature file including extension,
%                without extension, the default extension '*.ene' is added
%  2. mode       string, lowercase letters stand for additional action
%                        uppercase letters stand for leaving out some items
%                'f' filename is added in the label for the entries
%                'o' overwrite existing bibfile
%                'v' verbose mode, displays the advance in processing
%                '#' enumerate citations (in the last line)
%                '"' double quotes instead of curly braces to separate items
%                'A' suppress the abstract (avoids long files)
%                'M' suppress month field
%                'N' suppress the note field (from EndNote's or PubMed's "Notes")
%                'U' suppress URL field
%                'Y' suppress the first two digits of the year in the citation label
%                '1' suppress custom field 1
%                '2' suppress custom field 2
%                '3' suppress custom field 3 (avoids long files)
%                '4' suppress custom field 4 (avoids long files)
%                '5' suppress custom field 5 (avoids long files)
%                '6' suppress custom field 6 (avoids long files)
%                default is '' (empty) for standard behaviour:
%                  no filename in label, no overwrite, silent mode, no enumeration of items, items enclosed in {},
%                  abstract included, notes included, year has 4 digits, custom fields included.
%  3. textwidth  number of characters per line, default 90
%  4. custom     6-element cell array with the names of the custom fields,
%                the default is set for dj and hr:
%                custom = {'archive' 'location' 'djkeywords' 'djcomments' 'hrkeywords' 'hrcomments'};
%
% OUTPUT ARGUMENTS
%
%  1. plit       array of structures, each element (structure) has 31 string-valued fields:
%                1. label,    a combination of filname (optional), author, year and eventually a letter
%                2. citetype, type of citation, e.g., 'article', 'book', etc.
%                the other fields contain the complete information of the Endnote-File.
%
% USAGE:     plit = end2bib(litfile,mode,textwidth,custom);
% EXAMPLES:  plit = end2bib('mcalpine.ene');
%            plit = end2bib('dirk.ene','N',90,{'archive' 'location' 'djkeywords' 'djcomments' 'hrkeywords' 'hrcomments'});

% The conversion of the endnote entries is performed according to the following table.
% The symbols denote the following:
% '+' obligatory in BiBTeX documentation
% '*' optional   in BiBTeX documentation, shown in BiBTeX references
% '#' optional   in EndNote, not shown in BiBTeX references
% ':' exclusive OR
%
% %0 Endnote Type        Generic              Journal Article   Book                    Book Section    Conference Proceedings  Thesis
% %0 BibteX Type         misc=matlab-struct   article           book                    incollection    inproceedings           phdthesis
% %---------------------------------------------------------------------------------------------------------------------------------------------
% %A Author              * author             + author          +:author (XOR editor)   + author        + author                + author
% %T Title               * title              + title           + title                 + title         + title                 + title
% %B Secondary Title     # journal            + journal
% %B Secondary Title     # booktitle                                                    + booktitle     + booktitle
% %V Volume              # volume             * volume          *:volume (XOR number)   * volume        *:volume (XOR number)
% %N Number              # number             * number          * number (XOR volume)                   * number (XOR volume)
% %P Pages               # pages              * pages                                   * pages         * pages
% %8 Date                * month              * month           * month                 * month         * month                 * month
% %D Year                * year               + year            + year                  + year          + year                  + year
% %E Secondary Author    # editor                               + editor (XOR author)   * editor        * editor
% %I Publisher           # publisher                            + publisher             + publisher     * publisher
% %I Publisher           # school                                                                                               + school
% %C Place Published     # address                              * address               * address       * address               * address
% %& Section             # chapter                                                      * chapter
% %S Tertiary Title      # series                               * series                * series        * series
% %7 Edition             # edition                              * edition               * edition
% %9 Type of Work        * type                                                         * type                                  * type
% %! Short Title         * organization                                                                 * organization
% %K Keywords            # keywords           # keywords        # keywords              # keywords      # keywords              # keywords
% %X Abstract            # abstract           # abstract        # abstract              # abstract      # abstract              # abstract
% %O Notes               * note               * note            * note                  * note          * note                  * note
% %U URL                 # url                # url             # url                   # url           # url                   # url
% %@ ISBN/ISSN           # isbn               # isbn            # isbn                  # isbn          # isbn                  # isbn
% %+ Author Address      # authoraddress      # authoraddress   # authoraddress         # authoraddress # authoraddress         # authoraddress
% %1 Custom 1            # archive            # archive         # archive               # archive       # archive               # archive
% %2 Custom 2            # location           # location        # location              # location      # location              # location
% %3 Custom 3            # djkeywords         # djkeywords      # djkeywords            # djkeywords    # djkeywords            # djkeywords
% %4 Custom 4            # djcomments         # djcomments      # djcomments            # djcomments    # djcomments            # djcomments
% %# Custom 5            # hrkeywords         # hrkeywords      # hrkeywords            # hrkeywords    # hrkeywords            # hrkeywords
% %$ Custom 6            # hrcomments         # hrcomments      # hrcomments            # hrcomments    # hrcomments            # hrcomments

%disp('Book and/or Edited Book in endnote, problems with series Editor, also problems with incollection and series editor, Tabelle checken');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 1. handling of default input arguments and check if output file exists %%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%if nargin< 4 | isempty(custom)    custom   = {'custom1' 'custom2' 'custom3' 'custom4' 'custom5' 'custom6'}; end
if nargin < 4 | isempty(custom)    custom    = {'archive' 'location' 'djkeywords' 'djcomments' 'hrkeywords' 'hrcomments'}; end
if nargin < 3 | isempty(textwidth) textwidth = 90 ; end % maximal number of characters per line
if nargin < 2 | isempty(mode)      mode      = 'x'; end % avoid stupid warning
if nargin < 1
  help(mfilename);
  disp([mfilename ': litfile is an obligatory input argument, returning ...']);
  return;
end

lastdotpos = max(find(litfile=='.'));           % dot separating filename from extension
if isempty(lastdotpos)                          % if no extension was specified
  lastdotpos = length(litfile)+1;
  litfile = [litfile '.ene'];                   % add extension '.ene'
end
bibfile = [litfile(1:lastdotpos) 'bib'];        % name of the output file
if exist(bibfile) & isempty(find(mode=='o'))    % bibfile exists
  disp([mfilename ': ' bibfile ' already exists, set ''o'' in mode to overwrite, returning ...']);
  plit = []; return;
end

lastfileseppos = max(find(litfile==filesep));   % last position of file separator '/' or '\'
if isempty(lastfileseppos)
  lastfileseppos = 0;
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 2. read complete endnote-file into a cell array of structures plit %%%%%%%%%%%%%%%%%%
%%    and convert the entries of plit into the BiBTeX style           %%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tic;
fid = fopen(litfile,'rt');
if fid == -1
  disp([mfilename ': could not open ' litfile ', returning ...']); return;
end
buf = fscanf(fid,'%c');                      % read entire file into the string variable buf
fclose(fid);
buf = rem(buf,256);                          % use only 8 LSB, in some files 'ä' is not 228, but 65508 = 255*256 + 228
ctrlpos = find(buf<9 | (buf>10 & buf<32));   % positions of invisible CTRL-characters in [0:8 11:31] except TAB and LF
buf(ctrlpos) = [];                           % drop invisible control characters
buf(find(buf== 9)) = 32;                     % replace tabulators by space, TAB = CTRL-I (0x09)
buf = [10 buf];                              % add initial LF to find first startindex
lfpos = find(buf==10);                       % positions of the linefeeds,  LF  = CTRL-J (0x0A)
buf(lfpos(find(diff(lfpos)==1))) = [];       % kill double linefeeds in buf
buf = char(buf);                             % make buf a character array after the numerical operations

startindices = findstr(buf,[10 '%0']);       % citation start indices, at this LF before '%0' the citations begins
C = length(startindices);                    % number of citations
startindices = [startindices length(buf)+1]; % fake an additional citation start index at the end of buf

for c=1:C                                    % loop through the C citations
  if find(mode=='v')
    disp(['reading citation no. ' num2str(c)]);
  end
  %% 2a. initialize structure
  plit(c) = struct( ...
   'label'        , [], 'citetype'     , [], 'author'       , [], 'title'        , [], ...
   'journal'      , [], 'booktitle'    , [], 'volume'       , [], 'number'       , [], ...
   'pages'        , [], 'month'        , [], 'year'         , [], 'editor'       , [], ...
   'publisher'    , [], 'school'       , [], 'address'      , [], 'chapter'      , [], ...
   'series'       , [], 'edition'      , [], 'type'         , [], 'howpublished' , [], ...
   'organization' , [], 'keywords'     , [], 'abstract'     , [], 'note'         , [], ...
   'url'          , [], 'isbn'         , [], 'authoraddress', [], ...
   custom{1}      , [], custom{2}      , [], custom{3}      , [], ...
   custom{4}      , [], custom{5}      , [], custom{6}      , []);

  citation = buf(startindices(c):startindices(c+1)-1);   % buffer content with current citation c, starts with LF
  e0 = findstr(citation,[10 37]);                        % search all LFs followed by '%' = 37 in citation c
  e0 = e0(citation(e0+2) ~= 32 & citation(e0+3) == 32);  % the keyletter, i.e., the char after '%' must not be a space,
                                                         % and char after the keyletter must be a space
  E = length(e0);                   % number of entries
  e0 = [e0 length(citation)+1];     % fake an additional entry at the end of citation

  %% 2b. read in all entries into the structure
  for e=1:E                         % run through the entries in citation c and read them
    keyletter = citation(e0(e)+2);  % keyletter is after LF and '%'
    beginpos  = e0( e ) + 4;        % position where the citation begins (after 4 initial characters [10 '%' keyletter ' '])
    endpos    = e0(e+1) - 1;        % position where the citation ends   (before next LF)
    if strcmp(keyletter,'0') plit(c).citetype      =  citation(beginpos:endpos); end
    if strcmp(keyletter,'A') plit(c).author        = [plit(c).author {citation(beginpos:endpos)}]; end  % author list in cell array
    if strcmp(keyletter,'T') plit(c).title         =  replace_double_quotes(citation(beginpos:endpos)); end
    if strcmp(keyletter,'B')                               % endnotes 'secondary title'
      if strcmp(lower(plit(c).citetype),'journal article') % article
        plit(c).journal   = citation(beginpos:endpos);
      else                                                 % incollection or inproceedings
        plit(c).booktitle = replace_double_quotes(citation(beginpos:endpos));
      end
    end
    if strcmp(keyletter,'V') plit(c).volume        =  citation(beginpos:endpos); end
    if strcmp(keyletter,'N') plit(c).number        =  citation(beginpos:endpos); end
    if strcmp(keyletter,'P') plit(c).pages         =  citation(beginpos:endpos); end
    if strcmp(keyletter,'D') plit(c).year          =  citation(beginpos:endpos); end
    if strcmp(keyletter,'E') plit(c).editor        = [plit(c).editor {citation(beginpos:endpos)}]; end  % editor list in cell array
    if strcmp(keyletter,'I')                                % endnotes 'thesis'
      if ~strcmp(lower(plit(c).citetype),'thesis')          % book, incollection or inproceedings
        plit(c).publisher = citation(beginpos:endpos);
      else                                                  % phdthesis
        plit(c).school    = citation(beginpos:endpos);
      end
    end
    if strcmp(keyletter,'C') plit(c).address       =  citation(beginpos:endpos); end
    if strcmp(keyletter,'&') plit(c).chapter       =  citation(beginpos:endpos); end
    if strcmp(keyletter,'S') plit(c).series        =  citation(beginpos:endpos); end
    if strcmp(keyletter,'7') plit(c).edition       =  citation(beginpos:endpos); end
    if strcmp(keyletter,'9')                                % endnotes 'type of work'
      if strcmp(lower(plit(c).citetype),'misc')             % misc
        plit(c).howpublished = citation(beginpos:endpos);
      else                                                  % incollection or phdthesis
        plit(c).type = citation(beginpos:endpos);
      end
    end
    if strcmp(keyletter,'!')                                % endnotes 'short title'
      if strcmp(lower(plit(c).citetype),'conference proceedings') % inproceedings
        plit(c).organization  =  citation(beginpos:endpos);
      end
    end
    if strcmp(keyletter,'K')
      plit(c).keywords = citation(beginpos:endpos);
      plit(c).keywords(find(plit(c).keywords == '*')) = []; % kill excessive '*' symbols
      plit(c).keywords = lf2comma(plit(c).keywords);        % replace CTRL-J by ', ', strrep warns
    end
    if isempty(find(mode=='A')) & strcmp(keyletter,'X')     % output no abstract if 'A' in mode
      plit(c).abstract = citation(beginpos:endpos);
    end
    if isempty(find(mode=='M')) & strcmp(keyletter,'8')     % output no month if 'M' in mode
      plit(c).month    =  citation(beginpos:endpos);
    end
    if isempty(find(mode=='N')) & strcmp(keyletter,'O')     % note (from Notes) empty if 'N' in mode
      plit(c).note     = citation(beginpos:endpos);         % as keywords, note can have multiple lines
      plit(c).note     = lf2comma(plit(c).note);            % replace CTRL-J by ', ', strrep warns
    end
    if isempty(find(mode=='U')) & strcmp(keyletter,'U')     % output no URL if 'U' in mode
      plit(c).url      = citation(beginpos:endpos);
    end
    if strcmp(keyletter,'@') plit(c).isbn          = citation(beginpos:endpos); end
    if strcmp(keyletter,'+') plit(c).authoraddress = citation(beginpos:endpos); end

    if isempty(find(mode=='1')) & strcmp(keyletter,'1') plit(c) = setfield(plit(c),custom{1},citation(beginpos:endpos)); end
    if isempty(find(mode=='2')) & strcmp(keyletter,'2') plit(c) = setfield(plit(c),custom{2},citation(beginpos:endpos)); end
    if isempty(find(mode=='3')) & strcmp(keyletter,'3') plit(c) = setfield(plit(c),custom{3},citation(beginpos:endpos)); end
    if isempty(find(mode=='4')) & strcmp(keyletter,'4') plit(c) = setfield(plit(c),custom{4},citation(beginpos:endpos)); end
    if isempty(find(mode=='5')) & strcmp(keyletter,'#') plit(c) = setfield(plit(c),custom{5},citation(beginpos:endpos)); end
    if isempty(find(mode=='6')) & strcmp(keyletter,'$') plit(c) = setfield(plit(c),custom{6},citation(beginpos:endpos)); end
  end %e all entries of citation c read

  %% 2c. change endnotes citetypes to bibtex citetypes, only 'book' is the same
  if strcmp(lower(plit(c).citetype),'journal article'       ) plit(c).citetype = 'article'      ; end
  if strcmp(lower(plit(c).citetype),'book section'          ) plit(c).citetype = 'incollection' ; end
  if strcmp(lower(plit(c).citetype),'thesis'                ) plit(c).citetype = 'phdthesis'    ; end
  if strcmp(lower(plit(c).citetype),'conference proceedings') plit(c).citetype = 'inproceedings'; end
  if strcmp(lower(plit(c).citetype),'generic'               ) plit(c).citetype = 'misc'         ; end

  %% 2d. convert author and editor cell array to BiBTeX strings, return also first author for label
  [plit(c).author, name1 ] = bibify_authors_editors(plit(c).author);
  [plit(c).editor, name1e] = bibify_authors_editors(plit(c).editor);
  if isempty(name1)                                             % no author, e.g., for books
    name1 = name1e;                                             % use 1st editor name for label
  end
  if isempty(name1)                                             % no author or editor
    disp([mfilename ': WARNING: no author or editor in (unsorted) citation no. ' num2str(c) ', setting author to ''ANONYMOUS''']);
    plit(c).author = 'NOBODY';
    name1          = 'NOBODY';                                  % for label
  end
  name1 = replace_umlaute_kill_nonletters_nondigits(name1);     % 'ä' --> 'a', etc., 'ß' --> 'ss', '_' is maintained
                                                                % 'M{/o}ller' --> 'Moller', 'Békésy' --> 'Bekesy' for BiBTeX

  %% 2e. set label using first author, year and eventually the filename, replace Umlaute by usual vowels for BiBTeX
  if find(mode=='Y')                                            % only last 2 digits from the year in label
    if isempty(plit(c).year)
      plit(c).label =  name1;                                   % first author surname
    else
      plit(c).label = [name1 plit(c).year(end-1:end)];          % first author surname and year with last 2 digits
    end
  else                                                          % full 4 digit year
    plit(c).label = [name1 plit(c).year];                       % first author surname and year with 4 digits
  end

  if find(mode=='f')                                            % add filename and a colon to the label
    plit(c).label = [replace_umlaute_kill_nonletters_nondigits(litfile(lastfileseppos+1:lastdotpos-1)) ':' plit(c).label];
  end

  %% 2f. make labels unique, consider all labels given before (to c-1, backwards)
  for b = c-1:-1:1
    if ~isempty(plit(b).label)                                  % can happen for misc entries
      isattached = isempty(str2num(plit(b).label(end)));        % a letter was already attached to the former label of citation b
      if strcmp(plit(b).label(1:end-isattached),plit(c).label)  % there is a label conflict, same first author and year
        if isattached                                           % a letter at the label was already attached
          plit(c).label = [plit(c).label plit(b).label(end)+1]; % change to the next letter in the alphabet
        else                                                    % last char is a digit from year
          plit(b).label = [plit(b).label 'a'];                  % add an 'a' to the label before
          plit(c).label = [plit(c).label 'b'];                  % add an 'b' to the actual label
        end %if isattached
      end %if double label
    end %if ~isempty of beforehand label
  end %b(eforehand labels)

  %% 2g. handle wrong double entries by setting one of them to empty
  if strcmp(plit(c).citetype,'book')
    if ~isempty(plit(c).author) & ~isempty(plit(c).editor)
      disp([mfilename ': citation ' plit(c).label ...
       ': the entries ''author'' and ''editor'' are not allowed simultaneously in ''book'', setting ''editor'' to []']);
      plit(c).editor = [];
    end
  end
  if strcmp(plit(c).citetype,'book') | strcmp(plit(c).citetype,'inproceedings')
    if ~isempty(plit(c).volume) & ~isempty(plit(c).number)
      disp([mfilename ': citation ' plit(c).label ...
       ': the entries ''volume'' and ''number'' are not allowed simultaneously in ''incollection'' and ''inproceedings'', setting ''number'' to []']);
      plit(c).number = [];
    end
  end

  %% 2h. bibify page numbers, e.g., 1277-84 --> 1277--1284
  if isempty(plit(c).pages)                 % avoid possible empty-scalar comparison
    dashpos = [];                           % matlab hints to future versions that shall give []
  else
    dashpos = find(plit(c).pages=='-');     % 1. check dashes between page numbers
  end
  DP = length(dashpos);
  if ~DP                                    % no modification for no dashes, presumably a single page
  elseif DP>2
    disp([mfilename ': in citation ''' plit(c).label ''' ' num2str(DP) ' dashes were found in entry ''pages'', bibify_pages leaves pages unchanged']);
  elseif DP==2 & diff(dashpos) ~= 1
    disp([mfilename ': in citation ''' plit(c).label ''' 2 non-adjecent dashes found in entry ''pages'', bibify_pages leaves pages unchanged']);
  else                                    % 2. complete an abbreviated second page number
    pb = plit(c).pages(1:dashpos(1)-1);     % page begin, here DP is 1 or 2
    pe = plit(c).pages(dashpos(end)+1:end); % page end
    digitdiff = length(pb) - length(pe);    % difference in page digits
    if digitdiff
      pe = [pb(1:digitdiff) pe];            % add missing digits from pb into pe
    end
    plit(c).pages = [pb '--' pe];
  end %if DP

  %% 2i. finally wrap following entries to lines no longer than 80 characters (+19 spaces leading)
  %%     author, title, journal, booktitle, editor, publisher, school, address, series, edition,
  %%     type, howpublished, organization, keywords, abstract, note, authoraddress and the 6 custom fields
  %%     do NOT wrap url, it does usually not contain spaces, also better in one line for copy and paste
  plit(c).author        = wrap(plit(c).author       ,textwidth,' and');  % separate author list between authors
  plit(c).title         = wrap(plit(c).title        ,textwidth);         % separate title between spaces, default
  plit(c).journal       = wrap(plit(c).journal      ,textwidth);
  plit(c).booktitle     = wrap(plit(c).booktitle    ,textwidth);
  plit(c).editor        = wrap(plit(c).editor       ,textwidth,' and');  % separate editor list between authors
  plit(c).publisher     = wrap(plit(c).publisher    ,textwidth);
  plit(c).school        = wrap(plit(c).school       ,textwidth);
  plit(c).address       = wrap(plit(c).address      ,textwidth);
  plit(c).series        = wrap(plit(c).series       ,textwidth);
  plit(c).edition       = wrap(plit(c).edition      ,textwidth);
  plit(c).type          = wrap(plit(c).type         ,textwidth);
  plit(c).howpublished  = wrap(plit(c).howpublished ,textwidth);
  plit(c).organization  = wrap(plit(c).organization ,textwidth);
  plit(c).keywords      = wrap(plit(c).keywords     ,textwidth);
  plit(c).abstract      = wrap(plit(c).abstract     ,textwidth);
  plit(c).note          = wrap(plit(c).note         ,textwidth);
  plit(c).authoraddress = wrap(plit(c).authoraddress,textwidth);
  plit(c)               = setfield(plit(c),custom{1},wrap(getfield(plit(c),custom{1}),textwidth));
  plit(c)               = setfield(plit(c),custom{2},wrap(getfield(plit(c),custom{2}),textwidth));
  plit(c)               = setfield(plit(c),custom{3},wrap(getfield(plit(c),custom{3}),textwidth));
  plit(c)               = setfield(plit(c),custom{4},wrap(getfield(plit(c),custom{4}),textwidth));
  plit(c)               = setfield(plit(c),custom{5},wrap(getfield(plit(c),custom{5}),textwidth));
  plit(c)               = setfield(plit(c),custom{6},wrap(getfield(plit(c),custom{6}),textwidth));
end %c(itations)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 3. sort each structure according to its label, i.e., ascending author and year %%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
labels = '';
for c=1:C
  labels = [labels {plit(c).label}];
end
[sortedlabels, permu] = sort(labels);         % sort labels, get permuation
plit = plit(permu);                           % sort entire array of structures

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 4. write complete structure into bibfile %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if find(mode=='"')
  brace = '""';                               % "item"
else
  brace = '{}';                               % {item}, default
end

%% 4a. open file for writing
bibfile = [litfile(1:lastdotpos) 'bib'];
fid = fopen(bibfile,'rt');
if isempty(find(mode=='o')) & fid ~= -1       % bibfile could be opened for reading
  disp([mfilename ': ' bibfile ' already exists, set ''o'' in mode to overwrite, returning ...']);
  fclose(fid); return;
end
fid = fopen(bibfile,'wt');                    % open bibfile for writing
if fid == -1
  disp([mfilename ': cannot open ' bibfile ' for writing, returning ...']); return
end

%% 4b. write header information
litfile0 = litfile(lastfileseppos+1:end);     % litfile without leading path
bibfile0 = bibfile(lastfileseppos+1:end);     % bibfile without leading path

fprintf(fid,'%s\n','%%');
fprintf(fid,'%s\n',['%% ' bibfile0 ' -- converted from ' litfile0 ' using end2bib.m']);
fprintf(fid,'%s\n\n','%%');

%% 4c. build custom field names with 13 characters (like longest entry 'authoraddress')
if length(custom) ~= 6
  disp([mfilename ': custom must be a cell array with 6 entries, returning ...']); return;
end
cust13 = custom;                              % maintain custom, needed as fieldname
for n=1:6
  if length(cust13{n}) < 13
    cust13{n} = [cust13{n} char(' '*ones(1,13-length(cust13{n})))];
  end
end

%% 4d. write literature information
for c=1:C                                     % loop through the C citations
  if find(mode=='v')
    disp(['writing citation no. ' num2str(c)]);
  end
  for n = 1:6
    custom_contents{n} = getfield(plit(c),custom{n}); % contents of the custom-fields as cell array
  end

  fprintf(fid,'%s\n'  ,['@' plit(c).citetype '{' plit(c).label ',']);
  if ~isempty(plit(c).author       ) fprintf(fid,'%s\n'  ,['  author        = ' brace(1) plit(c).author        brace(2) ',']); end
  if ~isempty(plit(c).title        ) fprintf(fid,'%s\n'  ,['  title         = ' brace(1) plit(c).title         brace(2) ',']); end
  if ~isempty(plit(c).journal      ) fprintf(fid,'%s\n'  ,['  journal       = ' brace(1) plit(c).journal       brace(2) ',']); end
  if ~isempty(plit(c).booktitle    ) fprintf(fid,'%s\n'  ,['  booktitle     = ' brace(1) plit(c).booktitle     brace(2) ',']); end
  if ~isempty(plit(c).volume       ) fprintf(fid,'%s\n'  ,['  volume        = ' brace(1) plit(c).volume        brace(2) ',']); end
  if ~isempty(plit(c).number       ) fprintf(fid,'%s\n'  ,['  number        = ' brace(1) plit(c).number        brace(2) ',']); end
  if ~isempty(plit(c).pages        ) fprintf(fid,'%s\n'  ,['  pages         = ' brace(1) plit(c).pages         brace(2) ',']); end
  if ~isempty(plit(c).month        ) fprintf(fid,'%s\n'  ,['  month         = ' brace(1) plit(c).month         brace(2) ',']); end
  if ~isempty(plit(c).year         ) fprintf(fid,'%s\n'  ,['  year          = ' brace(1) plit(c).year          brace(2) ',']); end
  if ~isempty(plit(c).editor       ) fprintf(fid,'%s\n'  ,['  editor        = ' brace(1) plit(c).editor        brace(2) ',']); end
  if ~isempty(plit(c).publisher    ) fprintf(fid,'%s\n'  ,['  publisher     = ' brace(1) plit(c).publisher     brace(2) ',']); end
  if ~isempty(plit(c).school       ) fprintf(fid,'%s\n'  ,['  school        = ' brace(1) plit(c).school        brace(2) ',']); end
  if ~isempty(plit(c).address      ) fprintf(fid,'%s\n'  ,['  address       = ' brace(1) plit(c).address       brace(2) ',']); end
  if ~isempty(plit(c).chapter      ) fprintf(fid,'%s\n'  ,['  chapter       = ' brace(1) plit(c).chapter       brace(2) ',']); end
  if ~isempty(plit(c).series       ) fprintf(fid,'%s\n'  ,['  series        = ' brace(1) plit(c).series        brace(2) ',']); end
  if ~isempty(plit(c).edition      ) fprintf(fid,'%s\n'  ,['  edition       = ' brace(1) plit(c).edition       brace(2) ',']); end
  if ~isempty(plit(c).type         ) fprintf(fid,'%s\n'  ,['  type          = ' brace(1) plit(c).type          brace(2) ',']); end
  if ~isempty(plit(c).howpublished ) fprintf(fid,'%s\n'  ,['  howpublished  = ' brace(1) plit(c).howpublished  brace(2) ',']); end
  if ~isempty(plit(c).organization ) fprintf(fid,'%s\n'  ,['  organization  = ' brace(1) plit(c).organization  brace(2) ',']); end
  if ~isempty(plit(c).keywords     ) fprintf(fid,'%s\n'  ,['  keywords      = ' brace(1) plit(c).keywords      brace(2) ',']); end
  if ~isempty(plit(c).note         ) fprintf(fid,'%s\n'  ,['  note          = ' brace(1) plit(c).note          brace(2) ',']); end
  if ~isempty(plit(c).url          ) fprintf(fid,'%s\n'  ,['  url           = ' brace(1) plit(c).url           brace(2) ',']); end
  if ~isempty(plit(c).isbn         ) fprintf(fid,'%s\n'  ,['  isbn          = ' brace(1) plit(c).isbn          brace(2) ',']); end
  if ~isempty(plit(c).authoraddress) fprintf(fid,'%s\n'  ,['  authoraddress = ' brace(1) plit(c).authoraddress brace(2) ',']); end
  if ~isempty(custom_contents{1}   ) fprintf(fid,'%s\n'  ,['  ' cust13{1} ' = ' brace(1) custom_contents{1}    brace(2) ',']); end
  if ~isempty(custom_contents{2}   ) fprintf(fid,'%s\n'  ,['  ' cust13{2} ' = ' brace(1) custom_contents{2}    brace(2) ',']); end
  if ~isempty(custom_contents{3}   ) fprintf(fid,'%s\n'  ,['  ' cust13{3} ' = ' brace(1) custom_contents{3}    brace(2) ',']); end
  if ~isempty(custom_contents{4}   ) fprintf(fid,'%s\n'  ,['  ' cust13{4} ' = ' brace(1) custom_contents{4}    brace(2) ',']); end
  if ~isempty(custom_contents{5}   ) fprintf(fid,'%s\n'  ,['  ' cust13{5} ' = ' brace(1) custom_contents{5}    brace(2) ',']); end
  if ~isempty(custom_contents{6}   ) fprintf(fid,'%s\n'  ,['  ' cust13{6} ' = ' brace(1) custom_contents{6}    brace(2) ',']); end
  if ~isempty(plit(c).abstract     ) fprintf(fid,'%s\n'  ,['  abstract      = ' brace(1) plit(c).abstract      brace(2) ',']); end
  % note: abstract at the end, with mode 'A' it was set to empty above

  if find(mode == '#')           % numbering of the items
    fprintf(fid,'%s\n\n',['} %%  # ' num2str(c)]);
  else
    fprintf(fid,'%s\n\n',['}']);
  end
end %c

%% 4e. close the file and return
disp([mfilename ': ' num2str(C) ' citations written into ' bibfile ', conversion needed ' num2str(toc) ' seconds']); %disp(' ');
fclose(fid);
return

%%######################################################################################
%%## SECTION OF SUBFUNCTIONS ###########################################################
%%######################################################################################
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% a. replace a linefeed character with ', ' for keywords and notes %%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function out = lf2comma(in)
%
% replace linefeed (0x0A = 10 = CTRL-J) with ', '
%
% INPUT ARGUMENTS
%
% 1. in       string containing the linefeeds
%
% OUTPUT ARGUMENTS
%
% 1. out      string containing ', ' instead of the linefeeds, except for last linefeed

out = [];
in = [char(10) in char(10)]; % sorround in by linefeeds
lfpos = find(in==10);        % positions of the linefeeds
for lf = 1:length(lfpos)-1
  out = [out in(lfpos(lf)+1:lfpos(lf+1)-1) ', '];
end
out = out(1:end-2);          % kill excessive ', '
return;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% b. bibify_authors_editors, bring authors and editors in BiBTeX-format %%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [names, name1] = bibify_authors_editors(cell_names)
%
% bring the entries author and editors into BiBTeX-format, determine 1st name
%
% INPUT ARGUMENTS
%
% 1. cell_names   cell array of names from endnote entry, e.g., {'Meier, K. M.' 'Müller, V. H.' 'Munkner, A'}
%
% OUTPUT ARGUMENTS
%
% 1. names        string of names separated by 'and', surname first, first name (or initials) second, separated by comma
% 2. name1        string of the surname of the first author, used for label

names = []; name1 = [];
if isempty(cell_names)                          % e.g., for editors
  return;
end

for n=1:length(cell_names)
  commapos = min(find(cell_names{n}==','));     % position of the (first) comma separating surname and first name initials
  if isempty(commapos)                          % no commata given
    surname = cell_names{n};                      % only surname
    firstname = [];                               % no firstname, not typical for pubmed or endnote
  else
    surname = cell_names{n}(1:commapos-1);      % everything before comma
    firstname = cell_names{n}(commapos+1:end);  % everything after  comma
    if strcmp(firstname(1),' ')                 % first name starts with space
      firstname = [',' firstname];                % add a leading comma
    else                                        % first name does not start with space
      firstname = [', ' firstname];               % add a leading comma and space
    end
    if strcmp(firstname(end),' ')               % first name ends with space
      firstname = firstname(1:end-1);             % kill trailing space
    end
  end %if no comma
  names = [names surname firstname ' and '];    % merge all names into a string, surname first
end %n                                          % note: firstname first without comma does, e.g., not work for 'S. J. Van der Poel'
names = names(1:end-5);                         % kill the trailing ' and '

commapos1 = min(find(cell_names{1}==','));
if isempty(commapos1)                           % no comma(ta) given in 1st name of name list
  name1 = cell_names{1};                        % full first surname
else
  name1 = cell_names{1}(1:commapos1-1);         % first surname before first comma
end
return;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% c. wrap long items to lines with maximal textwidth characters (19 leading spaces) %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function out = wrap(in,textwidth,key)
%
% wrap too long lines, leave space on the following lines to align the entries
% kill remaining LFs, these occur often in the custom fields
%
% INPUT ARGUMENTS
%
% 1. in           input string
% 2. textwidth    width of the output text in characters, default 90
% 3. key          string at which the linefeeds shall take place, default is a space
%
% OUTPUT ARGUMENTS
%
% 1. out      output string containing linefeeds (each followed by width0 spaces)

out = [];
if nargin < 3 key       = ' '; end              % default key for separation is a space
if nargin < 2 textwidth = 90 ; end              % default results in 71 characters for the entries, 19 spaces

if ~isempty(in)                % avoid warning for empty in
  in(find(in==10)) = ' ';      % replace linefeeds (LFs) by spaces
end
width0 = 19;                   % width of the entrynames
L = length(in);                % length of the entry
N = textwidth - width0;        % width for the entries, subtract the 20 leading spaces

while L > N                    % for L <= N out is copied to in
  seppos = max(findstr(in(1:min(L,N)),key));               % position of last key within current width
  out = [out in(1:seppos-1) char([10 32*ones(1,width0)])]; % [entry linefeed and width0 spaces]
  in = in(seppos+1:end);       % remaining entry
  L = length(in);              % remaining length
end
out = [out in];                % finally add the remaining string
return;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% d. replace umlaute by corresponding vowels (necessary for BiBTeX label) %%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function str = replace_umlaute_kill_nonletters_nondigits(str)
%  'ä'  --> 'a' , 'ö'  --> 'o' , etc., 'ß'  --> 'ss'
str = strrep(str,'ä','a');
str = strrep(str,'ö','o');
str = strrep(str,'ü','u');     % e.g., 'Lütkenhöner' --> 'Lutkenhoner' in the label
str = strrep(str,'Ä','A');
str = strrep(str,'Ö','O');
str = strrep(str,'Ü','U');
str = strrep(str,'é','e');     % e.g., 'Békésy' --> 'Bekesy' in the label
str = strrep(str,'ß','ss');                                                       % filenames could contain digits
str = str((str>47 & str<58) | (str>64 & str<91) | (str>96 & str<123) | str==95);  % maintain only 0-9, A-Z and a-z and '_'
% author names do not contain non letter characters like '{', '/' etc., e.g., 'M{/o}ller' --> 'Moller'
return;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% e. replace double quotes by double left and right quotes (title, booktitle) %%%%%%%%%
%%    because LaTeX cannot handle, e.g., "transposed"                          %%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function str = replace_double_quotes(str)
if ~isempty(str)
  str = strrep(str,' "',' ``');    % begin of word: 1.  "transposed" --> ``transposed"
  str = strrep(str,'" ',''''' ');  % end   of word: 2. ``transposed" --> ``transposed''
  if strcmp(str(1),'"')            % 1st character (in title) is a double quote?
    str = ['``' str(2:end)];       % replace by left double quote
  end
  if strcmp(str(end),'"')          % last character (in title) is a double quote?
    str = [str(1:end-1) ''''''];   % replace by right double quote
  end
end
return;
