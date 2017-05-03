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

namespace YuMiWindow
{
    /// <summary>
    /// YuMiTeXingaCanShuPage.xaml 的交互逻辑
    /// </summary>
    public partial class YuMiTeXingaCanShuPage : Page
    {
        public YuMiTeXingaCanShuPage()
        {
            InitializeComponent();
        }

        private Frame frame;

        ///// <summary>
        ///// 1 and 2 , 1 is rongzhong ;2 is jingzhijiao
        ///// </summary>
        //public static int yType = 0;
        ///// <summary>
        ///// 1~3, 1 is 水分 ;2 is 破碎率; 3 is 杂质含量
        ///// </summary>
        //public static int xType = 0;

        /// <summary>
        /// 1~8 ,1 is 最值; 2 is 参数变化速率； 3 is 拟合曲线; 4 is 曲线图; 5 is 条形图; 6 is 折线图; 7 is 动态图; 8 is 气泡图
        /// </summary>
        public static int type = 0;
        private void Grid_Load(object sender, RoutedEventArgs e)
        {
            DataFenXi.Background = new SolidColorBrush(Colors.RoyalBlue);
            DataDisplay.Background = null;  
            type = 1;
            frame = new Frame();
            frame.Source = new Uri("pack://application:,,,/YuMiChart;component/ChartDisplay.xaml");
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

            if (menu == ZuiZhi)
            {
                type = 1;
            }
            else if (menu == ZZSL)
            {
                type = 2;
              
            }
            else if (menu == NHQX)
            {
                type = 3;
            } 

            frame = new Frame();
            frame.Source = new Uri("pack://application:,,,/YuMiChart;component/ChartDisplay.xaml");
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
            frame.Source = new Uri("pack://application:,,,/YuMiChart;component/ChartDisplay.xaml");
            if (main.Children.Count > 0)
            {
                main.Children.Clear();
            }
            main.Children.Add(frame);
        }

  
    }
}
