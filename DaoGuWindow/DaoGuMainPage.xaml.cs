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
using DataMember;
using ConvertData;


namespace DaoGuWindow
{
    /// <summary>
    /// DaoGuMainPage.xaml 的交互逻辑
    /// </summary>
    public partial class DaoGuMainPage : Page
    {

        ConvertStringToFormatString formatString = new ConvertStringToFormatString();

        public DaoGuMainPage()
        {
            InitializeComponent();
        }
        private Frame frame;
        /// <summary>
        /// type = 1 or 2....，
        /// type = 1 is one ,type = 2 is two.... 
        /// </summary>
        public static int type = 0;

        /// <summary>
        /// 1~6,1 is seZeDu, 2 is zhengJingMiLv, 3 is chuZaoLv, 4 is huangBianLiLv, 5 is zhiFangSuanZi, 6 is qiWei....
        /// </summary>
        public static int yType = 0;
        private void Button_Click(object sender, RoutedEventArgs e)
        {
             Button but = sender as Button;

            but1.Background = new SolidColorBrush(Colors.Chartreuse);
            but2.Background = new SolidColorBrush(Colors.Chartreuse);
            but3.Background = new SolidColorBrush(Colors.Chartreuse);
            but4.Background = new SolidColorBrush(Colors.Chartreuse);
            but5.Background = new SolidColorBrush(Colors.Chartreuse);
            but6.Background = new SolidColorBrush(Colors.Chartreuse); 
            but.Background = new SolidColorBrush(Colors.Red);
            
            frame = new Frame();

            if (but == but1)
            {
                type = 1;
                yType = 1;
                try
                {
                    jieshi.Text = formatString.ConvertToFormatString(MiaoShu.RiceMessage.GongNengMiaoShu[0]);
                }
                catch (Exception)
                { }
            }
            else if (but == but2)
            {
                type = 1;
                yType = 2;
                try
                {
                    jieshi.Text = formatString.ConvertToFormatString(MiaoShu.RiceMessage.GongNengMiaoShu[1]);
                }
                catch (Exception)
                { }
            }
            else if (but == but3)
            {
                type = 1;
                yType = 3;
                try
                {
                    jieshi.Text = formatString.ConvertToFormatString(MiaoShu.RiceMessage.GongNengMiaoShu[2]);
                }
                catch (Exception)
                { }
            }
            else if (but == but4)
            {
                type = 1;
                yType = 4;
                try
                {
                    jieshi.Text = formatString.ConvertToFormatString(MiaoShu.RiceMessage.GongNengMiaoShu[3]);
                }
                catch (Exception)
                { }
            }
            else if (but == but5)
            {
                type = 1;
                yType = 5;
                try
                {
                    jieshi.Text = formatString.ConvertToFormatString(MiaoShu.RiceMessage.GongNengMiaoShu[4]);
                }
                catch (Exception)
                { }
            }
            else if (but == but6)
            {
                type = 1;
                yType = 6;
                try
                {
                    jieshi.Text = formatString.ConvertToFormatString(MiaoShu.RiceMessage.GongNengMiaoShu[5]);
                }
                catch (Exception)
                { }
            }
            else
            {
                MessageBox.Show("没有数据");
                return;
            }
            frame.Source = new Uri("pack://application:,,,/DaoGuWindow;component/DaoGuTeXingCanShuPage.xaml");
            if (mainGridWheate.Children.Count > 0)
            {
                mainGridWheate.Children.Clear();
            }
            mainGridWheate.Children.Add(frame); 
        }

        private void Grid_Load(object sender, RoutedEventArgs e)
        {
            type = 1;
            yType = 1;
            but1.Background = new SolidColorBrush(Colors.Red);

            try
            {
                jieshi.Text = formatString.ConvertToFormatString(MiaoShu.RiceMessage.GongNengMiaoShu[0]);
            }
            catch (Exception)
            {
 
            }

            frame = new Frame();
            frame.Source = new Uri("pack://application:,,,/DaoGuWindow;component/DaoGuTeXingCanShuPage.xaml");
            if (mainGridWheate.Children.Count > 0)
            {
                mainGridWheate.Children.Clear();
            }
            mainGridWheate.Children.Add(frame);
        }
    }
}
