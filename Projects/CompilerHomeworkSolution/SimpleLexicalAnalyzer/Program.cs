using System;
using IISPLParserGenerator;

namespace SimpleLexicalAnalyzer
{
    class Program
    {
        static void Main(string[] args)
        {
            new myLexicalAnalyzer().Test("../../../if_c.txt");
        }
    }
}
