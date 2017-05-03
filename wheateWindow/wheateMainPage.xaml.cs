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


namespace wheateWindow
{
    /// <summary>
    /// wheateMainPage.xaml 的交互逻辑
    /// </summary>
    public partial class wheateMainPage : Page
    {
        public static Button selectBut;
        //public static int butType;//butType =1, 2, 3
        public wheateMainPage()
        {
            InitializeComponent();
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            but1.Background = new SolidColorBrush(Colors.Chartreuse);
            but2.Background = new SolidColorBrush(Colors.Chartreuse);
            but3.Background = new SolidColorBrush(Colors.Chartreuse);

            Button but = sender as Button;
            selectBut = but;
            selectBut.Background = new SolidColorBrush(Colors.Red);

            Frame frame = new Frame();

            if (but == but1)
            {
                //butType = 1;
                try
                {
                    jieshi.Text = MiaoShu.WheateMessage.GongNengMiaoShu[0];
                }
                catch (Exception)
                { }
                frame.Source = new Uri("pack://application:,,,/wheateWindow;component/wheatePeatsZongQunHeader.xaml");

            }
            else if (but == but2)
            {
                //butType = 2;
                try
                {
                    jieshi.Text = MiaoShu.WheateMessage.GongNengMiaoShu[1];
                }
                catch (Exception)
                { 
                }
                frame.Source = new Uri("pack://application:,,,/wheateWindow;component/wheateZhiLiangTeXingHeader.xaml");

            }
            else if (but == but3)
            {
                //butType = 3;
                try
                {
                    jieshi.Text = MiaoShu.WheateMessage.GongNengMiaoShu[2];
                }
                catch (Exception)
                { }
                frame.Source = new Uri("pack://application:,,,/wheateWindow;component/wheateHaiChongDuiXiaoMaiYingXiang.xaml");
            }
            if (mainGridWheate.Children.Count > 0)
            {
                mainGridWheate.Children.Clear();
            }
            mainGridWheate.Children.Add(frame);
        }

        private void Grid_Load(object sender, RoutedEventArgs e)
        {
            selectBut = but1;
            selectBut.Background = new SolidColorBrush(Colors.Red);
            //butType = 1;
            try
            {
                jieshi.Text = MiaoShu.WheateMessage.GongNengMiaoShu[0];
            }
            catch (Exception)
            { }

            Frame frame = new Frame();
            frame.Source = new Uri("pack://application:,,,/wheateWindow;component/wheatePeatsZongQunHeader.xaml");

            if (mainGridWheate.Children.Count > 0)
            {
                mainGridWheate.Children.Clear();
            }
            mainGridWheate.Children.Add(frame);

        }
    }
}
