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

namespace wheateWindow
{
    /// <summary>
    /// wheateHaiChongDuiXiaoMaiYingXiang.xaml 的交互逻辑
    /// </summary>
    public partial class wheateHaiChongDuiXiaoMaiYingXiang : Page
    {
        public wheateHaiChongDuiXiaoMaiYingXiang()
        {
            InitializeComponent();
        }

        private void MenuItemDataFenxi_Click(object sender, RoutedEventArgs e)
        {
            MenuItem menu = sender as MenuItem;
            DataFenXi.Background = new SolidColorBrush(Colors.RoyalBlue);
            DataDisplay.Background = null;
            DataYuCe.Background = null;
            Frame frame = new Frame();
            if(menu == guDu)
            {
                frame.Source = new Uri("pack://application:,,,/CornPeatsTeXingBarChart;component/series/CornPeatsMediaGuDu.xaml");     
            }
            else if (menu == miXiag)
            {
                frame.Source = new Uri("pack://application:,,,/CornPeatsTeXingBarChart;component/series/CornPeatsMediaMiXiang.xaml");
            }
            else if (menu == yuMiXiang)
            {
                frame.Source = new Uri("pack://application:,,,/CornPeatsTeXingBarChart;component/series/CornPeatsMediaYuMiXiang.xaml");
            }
      
            else if (menu == guDu1)
            {
                frame.Source = new Uri("pack://application:,,,/CornPeatsTeXingScatterDiagram;component/CornPeatsTeXingSpeedGuDu.xaml");
            }
            else if (menu == miXiag1)
            { 
                frame.Source = new Uri("pack://application:,,,/CornPeatsTeXingScatterDiagram;component/CornPeatsTeXingSpeedMiXiang.xaml"); 
            }
            else if (menu == yuMiXiang1)
            { 
                frame.Source = new Uri("pack://application:,,,/CornPeatsTeXingScatterDiagram;component/CornPeatsTeXingSpeedYuMiXiang.xaml");
            }
            else if (menu == guDu2)
            {
                frame.Source = new Uri("pack://application:,,,/CornPeatsTeXingScatterDiagram;component/CornPeatsTeXingAnaylisisGuDu.xaml");
            }
            else if (menu == miXiag2)
            {
                frame.Source = new Uri("pack://application:,,,/CornPeatsTeXingScatterDiagram;component/CornPeatsTeXingAnaylisisMiXiang.xaml");
            }
            else if (menu == yuMiXiang2)
            {
                frame.Source = new Uri("pack://application:,,,/CornPeatsTeXingScatterDiagram;component/CornPeatsTeXingAnaylisisYuMiXiang.xaml");
            }
            if (mainGrid.Children.Count > 0)
            {
                mainGrid.Children.Clear();
            }
            mainGrid.Children.Add(frame);


        }

        private void MenuItemDataDisplay_Click(object sender, RoutedEventArgs e)
        {
            MenuItem menu = sender as MenuItem;
            DataFenXi.Background = null;
            DataDisplay.Background = new SolidColorBrush(Colors.RoyalBlue);
            DataYuCe.Background = null;
            Frame frame = new Frame();

            if (menu == guDu3)
            {
                frame.Source = new Uri("pack://application:,,,/CornPeatsTeXingScatterDiagram;component/CornPeatsTeXingQuXianGuDu.xaml");
            }
            else if (menu == miXiag3)
            {
                frame.Source = new Uri("pack://application:,,,/CornPeatsTeXingScatterDiagram;component/CornPeatsTeXingQuXianMiXiang.xaml");
            }
            else if (menu == yuMiXiang3)
            {
                frame.Source = new Uri("pack://application:,,,/CornPeatsTeXingScatterDiagram;component/CornPeatsTeXingQuXianYuMiXiang.xaml");
            }
            else if (menu == guDu4)
            {
                frame.Source = new Uri("pack://application:,,,/CornPeatsTeXingBarChart;component/series/CornPeatsDisplayGuDu.xaml");
            }
            else if (menu == miXiag4)
            {
                frame.Source = new Uri("pack://application:,,,/CornPeatsTeXingBarChart;component/series/CornPeatsDisplayMiXiang.xaml");
            }
            else if (menu == yuMiXiang4)
            {
                frame.Source = new Uri("pack://application:,,,/CornPeatsTeXingBarChart;component/series/CornPeatsDisplayYuMiXiang.xaml");
            }
            else if (menu == guDu5)
            {
                frame.Source = new Uri("pack://application:,,,/CornPeatsTeXingScatterDiagram;component/CornPeatsTeXingLineGuDu.xaml");
            }
            else if (menu == miXiag5)
            {
                frame.Source = new Uri("pack://application:,,,/CornPeatsTeXingScatterDiagram;component/CornPeatsTeXingLineMiXiang.xaml");
            }
            else if (menu == yuMiXiang5)
            {
                frame.Source = new Uri("pack://application:,,,/CornPeatsTeXingScatterDiagram;component/CornPeatsTeXingLineYuMiXiang.xaml");
            }
            else if (menu == guDu6)
            {
                type = 1;
                frame.Source = new Uri("pack://application:,,,/CornPeatsTeXingDongTaiChart;component/CornPeatsTeXingDongTaiChart.xaml");
            }
            else if (menu == miXiag6)
            {
                type = 2;
                frame.Source = new Uri("pack://application:,,,/CornPeatsTeXingDongTaiChart;component/CornPeatsTeXingDongTaiChart.xaml");
            }
            else if (menu == yuMiXiang6)
            {
                type = 3;
                frame.Source = new Uri("pack://application:,,,/CornPeatsTeXingDongTaiChart;component/CornPeatsTeXingDongTaiChart.xaml");
            }
            else if (menu == guDu7)
            {
                frame.Source = new Uri("pack://application:,,,/CornPeatsTeXingGlob;component/CornPeatsTeXingGlobGuDu.xaml");
            }
            else if (menu == miXiag7)
            {
                frame.Source = new Uri("pack://application:,,,/CornPeatsTeXingGlob;component/CornPeatsTeXingGlobMiXiang.xaml");
            }
            else if (menu == yuMiXiang7)
            {
                frame.Source = new Uri("pack://application:,,,/CornPeatsTeXingGlob;component/CornPeatsTeXingGlobYuMiXiang.xaml");
            }


            if (mainGrid.Children.Count > 0)
            {
                mainGrid.Children.Clear();
            }
            mainGrid.Children.Add(frame);


           
          
   
        }
        /// <summary>
        /// 1为天数,2为日期
        /// </summary>
       public static int predictNum;

        /// <summary>
        /// 1为谷蠹，2为米象，3为玉米象
        /// </summary>
       public static int type;

        private void MenuItemDataYuCe_Click(object sender, RoutedEventArgs e)
        {
            MenuItem menu = sender as MenuItem;
            DataFenXi.Background = null;
            DataDisplay.Background = null;
            DataYuCe.Background = new SolidColorBrush(Colors.RoyalBlue);
            Frame frame = new Frame();

            if (menu == guDu8)
            {
                type = 1;
                predictNum = 1;

                frame.Source = new Uri("pack://application:,,,/CornPeatsTeXingScatterDiagram;component/PredictWindows/CornPeatsTeXingPredict1.xaml");
            }
            else if (menu == miXiag8)
            {
                type = 2;
                predictNum = 1;
                frame.Source = new Uri("pack://application:,,,/CornPeatsTeXingScatterDiagram;component/PredictWindows/CornPeatsTeXingPredict1.xaml");
            }
            else if (menu == yuMiXiang8)
            {
                type = 3;
                predictNum = 1;

                frame.Source = new Uri("pack://application:,,,/CornPeatsTeXingScatterDiagram;component/PredictWindows/CornPeatsTeXingPredict1.xaml");
            }
            else if (menu == guDu9)
            {
                type = 1;
                predictNum = 2;
                frame.Source = new Uri("pack://application:,,,/CornPeatsTeXingScatterDiagram;component/PredictWindows/CornPeatsTeXingPredict1.xaml");
            }
            else if (menu == miXiag9)
            {
                type = 2;
                predictNum = 2;
                frame.Source = new Uri("pack://application:,,,/CornPeatsTeXingScatterDiagram;component/PredictWindows/CornPeatsTeXingPredict1.xaml");
            }
            else if (menu == yuMiXiang9)
            {
                type = 3;
                predictNum = 2;
                frame.Source = new Uri("pack://application:,,,/CornPeatsTeXingScatterDiagram;component/PredictWindows/CornPeatsTeXingPredict1.xaml");
            }
            else if (menu == guDu10)
            {
                type = 1;
                frame.Source = new Uri("pack://application:,,,/CornPeatsTeXingScatterDiagram;component/PredictWindows/CornPeatsTeXingPredict2.xaml");
            }
            else if (menu == miXiag10)
            {
                type = 2;
                frame.Source = new Uri("pack://application:,,,/CornPeatsTeXingScatterDiagram;component/PredictWindows/CornPeatsTeXingPredict2.xaml");
            }
            else if (menu == yuMiXiang10)
            {
                type = 3;
                frame.Source = new Uri("pack://application:,,,/CornPeatsTeXingScatterDiagram;component/PredictWindows/CornPeatsTeXingPredict2.xaml");
            }
            else if (menu == guDu11)
            {
                type = 1;
                frame.Source = new Uri("pack://application:,,,/CornPeatsTeXingScatterDiagram;component/PredictWindows/CornPeatsTeXingPredict3.xaml");
            }
            else if (menu == miXiag11)
            {
                type = 2;
                frame.Source = new Uri("pack://application:,,,/CornPeatsTeXingScatterDiagram;component/PredictWindows/CornPeatsTeXingPredict3.xaml");

            }
            else if (menu == yuMiXiang11)
            {
                type = 3;
                frame.Source = new Uri("pack://application:,,,/CornPeatsTeXingScatterDiagram;component/PredictWindows/CornPeatsTeXingPredict3.xaml");

            }

            if (mainGrid.Children.Count > 0)
            {
                mainGrid.Children.Clear();
            }
            mainGrid.Children.Add(frame);

        }

        public static RichTextBox miaoShu;
        private void Grid_load(object sender, RoutedEventArgs e)
        {
            miaoShu = jieshi;
            DataFenXi.Background = new SolidColorBrush(Colors.RoyalBlue);
            DataDisplay.Background = null;
            DataYuCe.Background = null;
            Frame frame = new Frame();
            frame.Source = new Uri("pack://application:,,,/CornPeatsTeXingBarChart;component/series/CornPeatsMediaGuDu.xaml");
            if (mainGrid.Children.Count > 0)
            {
                mainGrid.Children.Clear();
            }
            mainGrid.Children.Add(frame);
        }


    }
}
