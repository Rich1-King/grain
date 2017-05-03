 using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using ConvertData;
using DataMember;

namespace YuMiWindow
{
    /// <summary>
    /// YuMiMainPage.xaml 的交互逻辑
    /// </summary>
    public partial class YuMiMainPage : Page
    {
        public YuMiMainPage()
        {
            InitializeComponent();
        }

        private ConvertStringToFormatString formatString = new ConvertStringToFormatString();

        private Frame frame;
        /// <summary>
        /// type = 1 or 2...,if type = 1 is one ,type = 2 is two
        /// </summary>
        public static int type = 0;
        /// <summary>
        /// 1 and 2 , 1 is rongzhong ;2 is jingzhijiao
        /// </summary>
        public static int yType = 0;
        /// <summary>
        /// 1~3, 1 is 水分 ;2 is 破碎率; 3 is 杂质含量
        /// </summary>
        public static int xType = 0;
        private void Button_Click(object sender, RoutedEventArgs e)
        {

            Button but = sender as Button;

            but1.Background = new SolidColorBrush(Colors.Chartreuse);
            but2.Background = new SolidColorBrush(Colors.Chartreuse);
            but3.Background = new SolidColorBrush(Colors.Chartreuse);
            but4.Background = new SolidColorBrush(Colors.Chartreuse);
            but5.Background = new SolidColorBrush(Colors.Chartreuse);
            but6.Background = new SolidColorBrush(Colors.Chartreuse);
            but7.Background = new SolidColorBrush(Colors.Chartreuse);
            but8.Background = new SolidColorBrush(Colors.Chartreuse);
            but.Background = new SolidColorBrush(Colors.Red);
            
            frame = new Frame();

            if (but == but1)
            {
                type = 1;
                xType= 1;
                yType = 1;

                try
                {
                    jieshi.Text = formatString.ConvertToFormatString(MiaoShu.CoreMessage.GongNengMiaoShu[0]);
                }
                catch (Exception)
                {

                }

                frame.Source = new Uri("pack://application:,,,/YuMiWindow;component/YuMiTeXingaCanShuPage.xaml");

            }
            else if (but == but2)
            {
                type = 1;
                xType = 1;
                yType = 2;

                try
                {
                    jieshi.Text = formatString.ConvertToFormatString(MiaoShu.CoreMessage.GongNengMiaoShu[1]);
                }
                catch (Exception)
                {

                }

                frame.Source = new Uri("pack://application:,,,/YuMiWindow;component/YuMiTeXingaCanShuPage.xaml");
            }
            else if (but == but3)
            {
                type = 1;
                xType = 2;
                yType = 1;

                try
                {
                    jieshi.Text = formatString.ConvertToFormatString(MiaoShu.CoreMessage.GongNengMiaoShu[2]);
                }
                catch (Exception)
                {

                }

                frame.Source = new Uri("pack://application:,,,/YuMiWindow;component/YuMiTeXingaCanShuPage.xaml");
            }
            else if (but == but4)
            {
                type = 1;
                xType = 2;
                yType = 2;

                try
                {
                    jieshi.Text = formatString.ConvertToFormatString(MiaoShu.CoreMessage.GongNengMiaoShu[3]);
                }
                catch (Exception)
                {

                }

                frame.Source = new Uri("pack://application:,,,/YuMiWindow;component/YuMiTeXingaCanShuPage.xaml");
            }
            else if (but == but5)
            {
                type = 1;
                xType = 3;
                yType = 1;

                try
                {
                    jieshi.Text = formatString.ConvertToFormatString(MiaoShu.CoreMessage.GongNengMiaoShu[4]);
                }
                catch (Exception)
                {

                }

                frame.Source = new Uri("pack://application:,,,/YuMiWindow;component/YuMiTeXingaCanShuPage.xaml");
            }
            else if (but == but6)
            {
                type = 1;
                xType = 3;
                yType = 2;

                try
                {
                    jieshi.Text = formatString.ConvertToFormatString(MiaoShu.CoreMessage.GongNengMiaoShu[5]);
                }
                catch (Exception)
                {

                }

                frame.Source = new Uri("pack://application:,,,/YuMiWindow;component/YuMiTeXingaCanShuPage.xaml");
            }
            else if (but == but7)
            {
                type = 2;

                try
                {
                    jieshi.Text = formatString.ConvertToFormatString(MiaoShu.CoreMessage.GongNengMiaoShu[6]);
                }
                catch (Exception)
                {

                }

                frame.Source = new Uri("pack://application:,,,/YuMiWindow;component/YuMiBaoZiPage.xaml");

            }

            else if (but == but8)
            {
                type = 3;

                try
                {
                    jieshi.Text = formatString.ConvertToFormatString(MiaoShu.CoreMessage.GongNengMiaoShu[7]);
                }
                catch (Exception)
                {

                }

                frame.Source = new Uri("pack://application:,,,/YuMiWindow;component/YuMiPoHuaiPage.xaml");
            }

            if (mainGridWheate.Children.Count > 0)
            {
                mainGridWheate.Children.Clear();
            }
            mainGridWheate.Children.Add(frame);
        }

        private void Grid_Load(object sender, RoutedEventArgs e)
        {
            type = 1;
            type = 1;
            xType = 1;
            yType = 1;
            but1.Background = new SolidColorBrush(Colors.Red);

            try
            {
                jieshi.Text = formatString.ConvertToFormatString(MiaoShu.CoreMessage.GongNengMiaoShu[0]);
            }
            catch (Exception)
            {

            }

            frame = new Frame();
            frame.Source = new Uri("pack://application:,,,/YuMiWindow;component/YuMiTeXingaCanShuPage.xaml");
            if (mainGridWheate.Children.Count > 0)
            {
                mainGridWheate.Children.Clear();
            }
            mainGridWheate.Children.Add(frame);
        }
    }
}
