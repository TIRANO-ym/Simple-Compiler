%{
    /* if.lex */
%}

ws   [ \t\n\r]*
digit  [0-9]
letter [a-zA-Z]
id     {letter}({letter}|{digit})*
num  {digit}+
op     [+\-*/=(){};]
rel_op <|<=|<>|>|>=

%%

{ws}  {return("T_ws");}
int      {return("T_int");}
if        {return("T_if");}
{id}    {yyoval=lexbuf; return("T_id");}
{num} {yyoval=lexbuf; return("T_num");}
{op}   {return(lexbuf);}
{rel_op} {yyoval=lexbuf; return("T_relop");}

%%

public void Test(string path)
{
    install(path);
    do
    {
         yyoval="";
         string tok=(string)lexan();
         if(tok!="T_ws")
              Console.WriteLine(string.Format("{0:10} {1}", tok.PadLeft(12), yyoval));
    } while(!IsDone());
}