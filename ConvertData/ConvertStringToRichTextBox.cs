using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Documents;
using System.Windows.Media;

namespace ConvertData
{
   public class ConvertStringToRichTextBox
    {
       
        public FlowDocument convertStringToFlowDocument(string str)
        {
            Run run;
            FlowDocument fd = new FlowDocument();
            Paragraph para = new Paragraph();
            char[] chs = str.ToCharArray();
            Hyperlink link = new Hyperlink();
            link.Foreground = new SolidColorBrush(Colors.Black);
            Style style = new Style();
            Setter setter = new Setter();
            setter.Property = TextBlock.TextDecorationsProperty;
            setter.Value = null;
            style.Setters.Add(setter);
            link.Style = style;
            for (int i = 0; i < chs.Length; i++)
            {
               
                if (chs[i] == '&')//下标
                {
                     run = new Run();
                    run.Typography.Variants = FontVariants.Subscript;
                    run.Text = chs[++i].ToString();
                    link.Inlines.Add(run);
                }
                else if (chs[i] == '$')//上标
                {
                     run = new Run();
                    run.Typography.Variants = FontVariants.Superscript;
                    run.Text = chs[++i].ToString();
                    //run.Text = "5";
                    link.Inlines.Add(run);
                }
                else if (chs[i] == '@')
                {
                    run = new Run();
                    run.Text = "\n";
                    link.Inlines.Add(run);
                }
                else
                {
                    link.Inlines.Add(chs[i].ToString());
                }
               
            }
            para.Inlines.Add(link);
            fd.Blocks.Add(para);
            return fd;
        } 
    }
}
