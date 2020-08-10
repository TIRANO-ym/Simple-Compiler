%{
    /* A Lex Program for A Simple Letter Counter
    file name : Test.lex
    tokens : word, CR,
    2020.04.02
    Yoon Joong Kim
    */
    int WordNo=0, CharacterNo=0, LnNo=0;
%}

alpha  [a-z]
digit    [0-9]
CR     [\n]
word   ({alpha}|{digit})+
%%
{word}  { WordNo++; CharacterNo+=lexbuf.Length ; return("WORD");}
{CR}     { LnNo++;     CharacterNo++;                    return("CR"); }
.|\r      { CharacterNo++;  return(lexbuf); }
%%
public void Test(string fn)
{
    install(fn);
    do
    {
         string t=(string)lexan();
         // Console.WriteLine("["+t+"]"+lexbuf);
    } while(!IsDone());
    Console.Write("Word No:" + WordNo + " LineNo:" + LnNo + "  CharacterNo:" + CharacterNo);
}