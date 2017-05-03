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

namespace DaoGuWindow
{
    /// <summary>
    /// DaoGuTeXingCanShuPage.xaml 的交互逻辑
    /// </summary>
    public partial class DaoGuTeXingCanShuPage : Page
    {
        public DaoGuTeXingCanShuPage()
        {
            InitializeComponent();
        }
        private Frame frame;

        /// <summary>
        /// 1~8 ,1 is 最值; 2 is 参数变化速率； 3 is 拟合曲线; 4 is 曲线图; 5 is 条形图; 6 is 折线图; 7 is 动态图; 8 is 气泡图
        /// </summary>
        public static int type = 0;

        ///// <summary>
        ///// 1~6,1 is seZeDu, 2 is zhengJingMiLv, 3 is chuZaoLv, 4 is huangBianLiLv, 5 is zhiFangSuanZi, 6 is qiWei....
        ///// </summary>
        //public static int yType = 0;
        private void Grid_Load(object sender, RoutedEventArgs e)
        {
            DataFenXi.Background = new SolidColorBrush(Colors.RoyalBlue);
            DataDisplay.Background = null;
            DataYuCe.Background = null;
            type = 1;
            //yType = 1;
            frame = new Frame();
            frame.Source = new Uri("pack://application:,,,/DaoGuChart;component/DaoGuDisplay.xaml");
            if (main.Children.Count > 0)
            {
                main.Children.Clear();
            }
            main.Children.Add(frame);
        }

        private void DataFenXi_Click(object sender, RoutedEventArgs e)
        {
            MenuItem menu = e.OriginalSource as MenuItem;
            DataFenXi.Background = new SolidColorBrush(Colors.RoyalBlue);
            DataDisplay.Background = null;
            DataYuCe.Background = null;
            if (menu == zuiZhi)
            {
                type = 1;
               
            }
            else if(menu == CSBHSL)
            {
                type = 2;
            
            }
            else if (menu == NHQX)
            {
                type = 3;
              
            }
           
            frame = new Frame();
            frame.Source = new Uri("pack://application:,,,/DaoGuChart;component/DaoGuDisplay.xaml");
            if (main.Children.Count > 0)
            {
                main.Children.Clear();
            }
            main.Children.Add(frame);
        }

        private void DataDisplay_Click(object sender, RoutedEventArgs e)
        {
            MenuItem menu = e.OriginalSource as MenuItem;
            DataFenXi.Background = null;
            DataDisplay.Background = new SolidColorBrush(Colors.RoyalBlue);
            DataYuCe.Background = null;
              if (menu == QXT)
            {
                type = 4;
               
            }
            else if (menu == TXT)
            {
                type = 5;
             
            }
            else if (menu == ZXT)
            {
                type = 6;
               
            }
            else if (menu == DTT)
            {
                type = 7;
              
            }
            else if (menu == QPT)
            {
                type = 8;
             
            }
            frame = new Frame();
            frame.Source = new Uri("pack://application:,,,/DaoGuChart;component/DaoGuDisplay.xaml");
            if (main.Children.Count > 0)
            {
                main.Children.Clear();
            }
            main.Children.Add(frame);
        }

        private void DataYuCe_Click(object sender, RoutedEventArgs e)
        {
            MenuItem menu = e.OriginalSource as MenuItem;
            DataFenXi.Background = null;
            DataDisplay.Background = null;
            DataYuCe.Background = new SolidColorBrush(Colors.RoyalBlue);
              if (menu == time)
            {
                type = 9;
             
            }
            else if (menu == date)
            {
                type = 10;
               
            }
            else if (menu == ZXEC)
            {
                type = 11;
              
            }
            else if (menu == LGLR)
            {
                type = 12;
             
            } 
            frame = new Frame();
            frame.Source = new Uri("pack://application:,,,/DaoGuChart;component/DaoGuDisplay.xaml");
            if (main.Children.Count > 0)
            {
                main.Children.Clear();
            }
            main.Children.Add(frame);
        }
    }
}
