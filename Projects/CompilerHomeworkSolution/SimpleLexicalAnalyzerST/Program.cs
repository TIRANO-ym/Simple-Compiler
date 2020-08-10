using System;
using IISPLParserGenerator;

namespace SimpleLexicalAnalyzerST
{
    class Program
    {
        static void Main(string[] args)
        {
            new myLexicalAnalyzer().Test("../../../소스c.txt");
        }
    }
}
