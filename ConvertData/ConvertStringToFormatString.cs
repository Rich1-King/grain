using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace ConvertData
{
    public class ConvertStringToFormatString
    {
        public string ConvertToFormatString(string str)
        {
            string formatString = null;

            char[] chs = str.ToCharArray();

            for (int i = 0; i < chs.Length; i++)
            {
                if (chs[i] == '@')
                {
                    formatString = formatString + "\n";
                }
                else
                {
                    formatString = formatString + chs[i];
                }

            }
                
            return formatString;
        }
    }
}
