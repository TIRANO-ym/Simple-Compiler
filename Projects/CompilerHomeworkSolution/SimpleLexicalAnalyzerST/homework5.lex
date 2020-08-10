%{
    /* hoemwork5.lex */
CSymbolTable st = new CSymbolTable();
%}

ws     [ \t\n\r]*
digit    [0-9]
letter   [a-zA-Z]
ereal   ({digit}+|{digit}+\.{digit}+)E(\-|\+){digit}+
id       {letter}({letter}|{digit})*
real     {digit}+\.{digit}+
num    {digit}*
array   (\[\])
ble_op (\+\+|\+\=|\-\=|\*\=|\/\=)
op       [+\-*/=;{}(),]
rel_op  <|<=|<>|>|>=

%%

{ws}      {return("T_ws");}
{ereal}   {yyoval=lexbuf; return("T_ereal");}
{id}        {yyoval=install_id(lexbuf); return(st[(int)yyoval].token);}
{real}     {yyoval=lexbuf; return("T_real");}
{num}    {yyoval=lexbuf; return("T_num");}
{array}   {yyoval=lexbuf; return("T_array");}
{ble_op} {return(lexbuf);}
{op}       {return(lexbuf);}
{rel_op}  {yyoval=lexbuf; return("T_relop");}


%%

public void Test(string path)
{
    install(path);
    install_reserved_words();
    do
    {
         yyoval="";
         string tok=(string)lexan();

         if(tok == "T_ws") {}
         else if(tok == "T_id"){
             Item item = st[(int)yyoval];
             Console.WriteLine(string.Format("{0}\t{1}\t{2}SymbolTable[{3}]",
                    tok.PadLeft(12), item.lexeme, item.attribute, yyoval));
         }
         else if (tok == "T_ereal" || tok == "T_real" || tok == "T_num" || tok == "T_relop")
             Console.WriteLine(string.Format("{0}\t{1}", tok.PadLeft(12), yyoval));
         else
             Console.WriteLine(string.Format("{0:10}", tok.PadLeft(12)));
    } while(!IsDone());
    Console.WriteLine(st.ToString());
    Console.ReadKey();
}
public void install_reserved_words() {
    st.Add("T_if", "if");
    st.Add("T_foreach", "foreach");
    st.Add("T_in", "in");
    st.Add("T_int", "int");
    st.Add("T_double", "double");
}
public int install_id(string lexeme){
    int idx=st.Look_Up(lexeme);
    if(idx != -1) return idx;
    st.Add("T_id", lexeme);
    return st.Count-1;
}