using System;
using IISPLParserGenerator;
using System.IO;

namespace ASimpleLetterCounter
{
    class Program
    {
        static void Main(string[] args)
        {
            new myLexicalAnalyzer().Test(File.ReadAllText(@"D:\sym\data.txt"));
            while(true)
            {

            }
        }
    }
}
