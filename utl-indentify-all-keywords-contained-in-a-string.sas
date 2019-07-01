utl-indentify-all-keywords-contained-in-a-string
Identify these keywords and assign a logical 0/1 if the keyword is in the string                                       
                                                                                                                       
     string= 004 Chair- Window/Glass Frame-                                                                            
                                                                                                                       
         chair window table  door  sofa  couch                                                                         
           1     0      1      1    0      1                                                                           
                                                                                                                       
github                                                                                                                 
https://tinyurl.com/y6tax9s7                                                                                           
https://github.com/rogerjdeangelis/utl-indentify-all-keywords-contained-in-a-string                                    
                                                                                                                       
StacOverflow R                                                                                                         
https://tinyurl.com/y4gpf2ed                                                                                           
https://stackoverflow.com/questions/56792985/split-uneven-strings-into-sorted-columns-in-r                             
                                                                                                                       
     MethodS                                                                                                           
                                                                                                                       
      a. Paul Dorfman's very elegant findw and array solution                                                          
         Paul Dorfman                                                                                                  
         sashole@bellsouth.net                                                                                         
      b. My feeble attempt                                                                                             
                                                                                                                       
         1. Replace non alphabetic characters with blanks                                                              
         2. Output just the words in the leyword list                                                                  
         3. Transpose the long list by house                                                                           
                                                                                                                       
      c. Optimized for speed by Richard DeVenezia                                                                      
         Richard DeVenezia                                                                                             
         rdevenezia@gmail.com                                                                                          
                                                                                                                       
*_                   _                                                                                                 
(_)_ __  _ __  _   _| |_                                                                                               
| | '_ \| '_ \| | | | __|                                                                                              
| | | | | |_) | |_| | |_                                                                                               
|_|_| |_| .__/ \__,_|\__|                                                                                              
        |_|                                                                                                            
;                                                                                                                      
data have;                                                                                                             
length house $4. items $50 ;                                                                                           
input ;                                                                                                                
 house=scan(_infile_,1);                                                                                               
 items=substr(_infile_,5);                                                                                             
cards4;                                                                                                                
001 Chair                                                                                                              
002 Chair- Window/Glass-                                                                                               
003 Door- Sofa-                                                                                                        
004 Chair- Window/Glass Frame-                                                                                         
005 1. Window/Glass Frame                                                                                              
006 Chair- Door- Window-                                                                                               
007 Chair- Sofa - Door- Table-                                                                                         
008 4. Table                                                                                                           
009 Couch (2)                                                                                                          
010 Window- Table- Chair- Sofa- Door- Couch                                                                            
011 2. Door / Chair                                                                                                    
;;;;                                                                                                                   
run;quit;                                                                                                              
                                                                                                                       
data keywords;                                                                                                         
 input keyword$;                                                                                                       
cards4;                                                                                                                
chair                                                                                                                  
window                                                                                                                 
table                                                                                                                  
door                                                                                                                   
sofa                                                                                                                   
couch                                                                                                                  
;;;;                                                                                                                   
run;quit;                                                                                                              
                                                                                                                       
WORK.HAVE total obs=11                                                                                                 
                                                                                                                       
  HOUSE   ITEMS                                                                                                        
                                                                                                                       
   001    Chair                                                                                                        
   002    Chair- Window/Glass-                                                                                         
   003    Door- Sofa-                                                                                                  
   004    Chair- Window/Glass Frame-                                                                                   
   005    1. Window/Glass Frame                                                                                        
   006    Chair- Door- Window-                                                                                         
   007    Chair- Sofa - Door- Table-                                                                                   
   008    4. Table                                                                                                     
   009    Couch (2)                                                                                                    
   010    Window- Table- Chair- Sofa- Door- Couch                                                                      
   011    2. Door / Chair                                                                                              
                                                                                                                       
                                                                                                                       
WORK.KEYWORDS total obs=6                                                                                              
                                                                                                                       
   KEYWORD                                                                                                             
                                                                                                                       
   chair                                                                                                               
   window                                                                                                              
   table                                                                                                               
   door                                                                                                                
   sofa                                                                                                                
   couch                                                                                                               
                                                                                                                       
*            _               _                                                                                         
  ___  _   _| |_ _ __  _   _| |_                                                                                       
 / _ \| | | | __| '_ \| | | | __|                                                                                      
| (_) | |_| | |_| |_) | |_| | |_                                                                                       
 \___/ \__,_|\__| .__/ \__,_|\__|                                                                                      
                |_|                                                                                                    
;                                                                                                                      
                                                                                                                       
WORK>WANT                                                                                         | RULES              
                                                                                                  |                    
 HOUSE  ITMSAV                                   CHAIR    WINDOW   DOOR    SOFA    TABLE    COUCH |                    
                                                                                                  |                    
 001    Chair                                      1        0       0       0        0        0   | Only Chair         
                                                                                                    is present         
                                                                                                                       
 002    Chair- Window/Glass-                       1        1       0       0        0        0   |                    
 003    Door- Sofa-                                0        0       1       1        0        0   |                    
 004    Chair- Window/Glass Frame-                 1        1       0       0        0        0   |                    
 005    1. Window/Glass Frame                      0        1       0       0        0        0   |                    
 006    Chair- Door- Window-                       1        1       1       0        0        0   |                    
 007    Chair- Sofa - Door- Table-                 1        0       1       1        1        0   |                    
 008    4. Table                                   0        0       0       0        1        0   |                    
 009    Couch (2)                                  0        0       0       0        0        1   |                    
 010    Window- Table- Chair- Sofa- Door- Couch    1        1       1       1        1        1   |                    
 011    2. Door / Chair                            1        0       1       0        0        0                        
                                                                                                                       
*          _       _   _                                                                                               
 ___  ___ | |_   _| |_(_) ___  _ __  ___                                                                               
/ __|/ _ \| | | | | __| |/ _ \| '_ \/ __|                                                                              
\__ \ (_) | | |_| | |_| | (_) | | | \__ \                                                                              
|___/\___/|_|\__,_|\__|_|\___/|_| |_|___/                                                                              
                                                                                                                       
*           ____             _                                                                                         
  __ _     |  _ \ __ _ _   _| |                                                                                        
 / _` |    | |_) / _` | | | | |                                                                                        
| (_| |_   |  __/ (_| | |_| | |                                                                                        
 \__,_(_)  |_|   \__,_|\__,_|_|                                                                                        
                                                                                                                       
                                                                                                                       
data have ;                                                                                                            
  length house $4. items $50 ;                                                                                         
  input ;                                                                                                              
  house = scan (_infile_, 1) ;                                                                                         
  items = substr (_infile_, 5) ;                                                                                       
  cards ;                                                                                                              
001 Chair                                                                                                              
002 Chair- Window/Glass-                                                                                               
003 Door- Sofa-                                                                                                        
004 Chair- Window/Glass Frame-                                                                                         
005 1. Window/Glass Frame                                                                                              
006 Chair- Door- Window-                                                                                               
007 Chair- Sofa - Door- Table-                                                                                         
008 4. Table                                                                                                           
009 Couch (2)                                                                                                          
010 Window- Table- Chair- Sofa- Door- Couch                                                                            
011 2. Door / Chair                                                                                                    
run ;                                                                                                                  
                                                                                                                       
data keywords ;                                                                                                        
  input keyword $ ;                                                                                                    
  cards ;                                                                                                              
chair                                                                                                                  
window                                                                                                                 
table                                                                                                                  
door                                                                                                                   
sofa                                                                                                                   
couch                                                                                                                  
run ;                                                                                                                  
                                                                                                                       
proc sql noprint ;                                                                                                     
  select upper (keyword) into :kw separated by " " from keywords ;                                                     
quit ;                                                                                                                 
                                                                                                                       
data want (keep = house items &kw) ;                                                                                   
  set have ;                                                                                                           
  array kw &kw ;                                                                                                       
  do over kw ;                                                                                                         
    kw = ^^ findw (upcase (items), strip (vname (kw))) ;                                                               
  end ;                                                                                                                
run ;                                                                                                                  
run;quit;                                                                                                              
                                                                                                                       
*_                                                                                                                     
| |__      _ __ ___   ___                                                                                              
| '_ \    | '_ ` _ \ / _ \                                                                                             
| |_) |   | | | | | |  __/                                                                                             
|_.__(_)  |_| |_| |_|\___|                                                                                             
                                                                                                                       
;                                                                                                                      
%symdel keys / nowarn;                                                                                                 
* The SAS compiler is very fast at this;                                                                               
data havNrm ( where=(                                                                                                  
                                                                                                                       
         %let rc=%sysfunc(dosubl('                                                                                     
         proc sql;                                                                                                     
             select                                                                                                    
                 quote(strip(keyword))                                                                                 
             into                                                                                                      
                 :keys separated by ","                                                                                
             from                                                                                                      
                  keywords                                                                                             
        ;quit;                                                                                                         
        %put items in (&keys);                                                                                         
        '));                                                                                                           
                                                                                                                       
         nrm in (&keys)                                                                                                
                                                                                                                       
         )) ;                                                                                                          
  set have;                                                                                                            
  itmSav=items;                                                                                                        
  items=lowcase(translate(items,' ',compress(items,,'a')));                                                            
  do i=1 to countw(items);                                                                                             
     nrm=scan(items,i);                                                                                                
     output;                                                                                                           
     put nrm=;                                                                                                         
  end;                                                                                                                 
  keep house itmSav nrm;                                                                                               
run;quit;                                                                                                              
                                                                                                                       
proc transpose data=havNrm out=want(drop=_name_);                                                                      
  by house itmSav;                                                                                                     
  id nrm;                                                                                                              
  var nrm;                                                                                                             
run;quit;                                                                                                              
                                                                                                                       
proc format;                                                                                                           
 value $chr2ZroOne                                                                                                     
  " "="0"                                                                                                              
  other="1";                                                                                                           
run;quit;                                                                                                              
                                                                                                                       
proc print data=want(drop=name);                                                                                       
  format _character_ $chr2ZroOne. itmSav $44. house $4.;                                                               
run;quit;                                                                                                              
                                                                                                                       
*                      _   _           _             _                                                                 
  ___       ___  _ __ | |_(_)_ __ ___ (_)_______  __| |                                                                
 / __|     / _ \| '_ \| __| | '_ ` _ \| |_  / _ \/ _` |                                                                
| (__ _   | (_) | |_) | |_| | | | | | | |/ /  __/ (_| |                                                                
 \___(_)   \___/| .__/ \__|_|_| |_| |_|_/___\___|\__,_|                                                                
                |_|                                                                                                    
;                                                                                                                      
                                                                                                                       
Richard DeVenezia                                                                                                      
rdevenezia@gmail.com                                                                                                   
                                                                                                                       
For the case of unconditional testing of all keywords, an extreme optimization                                         
would eliminate the array and run-time looping (and therein keyword variable                                           
address computation at each row) and push that into the compile time work.                                             
                                                                                                                       
data have ; input                                                                                                      
house $char4. items $char50.;                                                                                          
datalines;                                                                                                             
001 Chair                                                                                                              
002 Chair- Window/Glass-                                                                                               
003 Door- Sofa-                                                                                                        
004 Chair- Window/Glass Frame-                                                                                         
005 1. Window/Glass Frame                                                                                              
006 Chair- Door- Window-                                                                                               
007 Chair- Sofa - Door- Table-                                                                                         
008 4. Table                                                                                                           
009 Couch (2)                                                                                                          
010 Window- Table- Chair- Sofa- Door- Couch                                                                            
011 2. Door / Chair                                                                                                    
run ;                                                                                                                  
                                                                                                                       
data keywords ;                                                                                                        
  input keyword $ ;                                                                                                    
  cards ;                                                                                                              
chair                                                                                                                  
window                                                                                                                 
table                                                                                                                  
door                                                                                                                   
sofa                                                                                                                   
couch                                                                                                                  
run ;                                                                                                                  
                                                                                                                       
proc sql noprint ;                                                                                                     
  select upper (keyword) into :kw1- from keywords;                                                                     
quit ;                                                                                                                 
                                                                                                                       
%* submit-time work;                                                                                                   
%* support macro resolving macro array over single tokened template;                                                   
%macro foreach(items, n, template, token=<token>, symdel=1);                                                           
  %local item;                                                                                                         
  %do i = 1 %to &n;                                                                                                    
    %let item = &&&items.&i;                                                                                           
%sysfunc(TRANWRD(%superq(template),&token,&item))                                                                      
%if &symdel %then %symdel &&items.&i;                                                                                  
  %end;                                                                                                                
%mend;                                                                                                                 
                                                                                                                       
options mprint;                                                                                                        
data want;                                                                                                             
  set have;                                                                                                            
  uitems = upcase(items);                                                                                              
                                                                                                                       
  /* submit-time work codegens source for compile-time work  */                                                        
  %foreach (kw, &sqlobs, %nrbquote(<token> = ^^findw(uitems, "<token>");))                                             
                                                                                                                       
run;                                                                                                                   
                                                                                                                       
Regards,                                                                                                               
Richard DeVenezia                                                                                                      
                                                                                                                       
                                                                                                        
                                                                                                                            
                                                                                                                            
