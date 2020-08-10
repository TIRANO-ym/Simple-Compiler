using System;
using IISPLParserGenerator;

namespace ASimpleTokenCounter
{
    class Program
    {
        static void Main(string[] args)
        {
            new myLexicalAnalyzer().Test("../../../data.txt");
        }
    }
}
