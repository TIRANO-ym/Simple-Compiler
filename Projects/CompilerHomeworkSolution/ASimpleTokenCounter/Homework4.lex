%{
    /* A Lex Program for A Simple Token Counter
    file name : Homework4.lex
    tokens : odd, even, int, real, ereal, ID, email, hanbatemail, birth, RRnumber
    2020.04.07
    Yeo Myeong Seong
    */
    int OddNo=0, EvenNo=0, IntNo=0, RealNo=0, ERealNo=0, IDNo=0, EmailNo=0, HanbatEmailNo=0, BirthNo=0, RRnumberNo=0;
%}
letter  [A-Za-z]
digit    [0-9]
evendigit   [02468]
odddigit     [13579]
RRnumber {digit}{digit}[01]{digit}{digit}{digit}[1234]{digit}{digit}{digit}{digit}{digit}{digit}
birth    {digit}+\.{digit}+\.{digit}+
hanbatemail   {letter}+@(hanbat.ac.kr)
email  {letter}+@{letter}+\.({letter}+\.)?(co.kr|com)
ID       {letter}({letter}|{digit})*
ereal   {digit}+E{digit}+
real     {digit}+\.{digit}+
even   {digit}*{evendigit}
odd     {digit}*{odddigit}
int       {digit}+
newline   \n
cr            \r
ws          [\t ]+
%%
{newline} { return(lexbuf); }
{cr} { return("CR"); }
{ws} { return(lexbuf); }
{RRnumber} {RRnumberNo++; return("RRnumber");}
{birth} {BirthNo++; return("Birth");}
{hanbatemail} {HanbatEmailNo++; return("HanbatEmail");}
{email} {EmailNo++; return("Email");}
{ID} {IDNo++; return("ID");}
{ereal} {ERealNo++; return("EReal");}
{real} {RealNo++; return("Real");}
{even} {EvenNo++; IntNo++; return("Even");}
{odd} {OddNo++; IntNo++; return("Odd");}
{int} {IntNo++; return("Int");}
%%
public void Test(string fn)
{
    install(fn);
    do
    {
         string t=(string)lexan();
         // Console.WriteLine("["+t+"]"+lexbuf);
    } while(!IsDone());
    Console.Write("Int No:" + IntNo + "\tOdd No:" + OddNo + " \tEven No:" + EvenNo + "\tReal No:" + RealNo + "\tEReal No:" + ERealNo + "\nID No:" + IDNo + "\t\tEmail No:" + EmailNo + "\tHanbat-E No:" + HanbatEmailNo + "\tBirth No:" + BirthNo + "\tRR Number No:" + RRnumberNo + "\n");
}