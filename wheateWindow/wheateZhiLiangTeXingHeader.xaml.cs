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
    /// wheateZhiLiangTeXingHeader.xaml 的交互逻辑
    /// </summary>
    public partial class wheateZhiLiangTeXingHeader : Page
    {
        public wheateZhiLiangTeXingHeader()
        {
            InitializeComponent();
        }

        private void MenuItemDataDisplay_Click(object sender, RoutedEventArgs e)
        {
            MenuItem menu = sender as MenuItem;
            DataFenXi.Background = null;
            DataDisplay.Background = new SolidColorBrush(Colors.RoyalBlue);
            DataYuCe.Background = null;
            Frame frame = new Frame();


            if (menu == BuWanShanDu3)
            {
                frame.Source = new Uri("pack://application:,,,/ZhiLiangCanShuScatterDiagram;component/LineCrosshairCoordinates.xaml");
            }
            else if (menu == ZhiFangSuanZhi3)
            {
                frame.Source = new Uri("pack://application:,,,/ZhiLiangCanShuScatterDiagram;component/LineCrosshairCoordinates1.xaml");
            }
            else if (menu == MianJinXiShuiLv3)
            {
                frame.Source = new Uri("pack://application:,,,/ZhiLiangCanShuScatterDiagram;component/LineCrosshairCoordinates2.xaml");
            }
           
            else if (menu == BuWanShanDu4)
            {
                frame.Source = new Uri("pack://application:,,,/ZhiLiangCanShuBarChart;component/series/ValueOverlays.xaml");
            }
            else if (menu == ZhiFangSuanZhi4)
            {
                frame.Source = new Uri("pack://application:,,,/ZhiLiangCanShuBarChart;component/series/ValueOverlays1.xaml");
            }
            else if (menu == MianJinXiShuiLv4)
            {
                frame.Source = new Uri("pack://application:,,,/ZhiLiangCanShuBarChart;component/series/ValueOverlays2.xaml");
            }
              else if (menu == BuWanShanDu5)
            {
                frame.Source = new Uri("pack://application:,,,/ZhiLiangCanShuScatterDiagram;component/ChartCrosshairCoordinates.xaml");
            }
            else if (menu == ZhiFangSuanZhi5)
            {
                frame.Source = new Uri("pack://application:,,,/ZhiLiangCanShuScatterDiagram;component/ChartCrosshairCoordinates1.xaml");
            }
            else if (menu == MianJinXiShuiLv5)
            {
                frame.Source = new Uri("pack://application:,,,/ZhiLiangCanShuScatterDiagram;component/ChartCrosshairCoordinates2.xaml");
            }
            else if (menu == BuWanShanDu6)
            {
                type = 1;
                frame.Source = new Uri("pack://application:,,,/ZhiLiangCanShuDongTaiTu;component/MainWindow.xaml");
            }
            else if (menu == ZhiFangSuanZhi6)
            {
                type = 2;
                frame.Source = new Uri("pack://application:,,,/ZhiLiangCanShuDongTaiTu;component/MainWindow.xaml");
            }
            else if (menu == MianJinXiShuiLv6)
            {
                type = 3;
                frame.Source = new Uri("pack://application:,,,/ZhiLiangCanShuDongTaiTu;component/MainWindow.xaml");
            }
            else if (menu == BuWanShanDu7)
            {
                frame.Source = new Uri("pack://application:,,,/ZhiLiangCanShuGlob;component/AllWindow.xaml");
            }
            else if (menu == ZhiFangSuanZhi7)
            {
                frame.Source = new Uri("pack://application:,,,/ZhiLiangCanShuGlob;component/AllWindow1.xaml");
            }
            else if (menu == MianJinXiShuiLv7)
            {
                frame.Source = new Uri("pack://application:,,,/ZhiLiangCanShuGlob;component/AllWindow2.xaml");
            }

            if (mainGrid.Children.Count > 0)
            {
                mainGrid.Children.Clear();
            }
            mainGrid.Children.Add(frame);
        }

        private void MenuItemDataFenxi_Click(object sender, RoutedEventArgs e)
        {
            MenuItem menu = sender as MenuItem;
            DataFenXi.Background = new SolidColorBrush(Colors.RoyalBlue);
            DataDisplay.Background = null;
            DataYuCe.Background = null;
            Frame frame = new Frame();
            if (menu == BuWanShanDu)
            {
                frame.Source = new Uri("pack://application:,,,/ZhiLiangCanShuBarChart;component/series/MediaValueOverlays.xaml");
            }
            else if (menu == ZhiFangSuanZhi)
            {
                frame.Source = new Uri("pack://application:,,,/ZhiLiangCanShuBarChart;component/series/MediaValueOverlays1.xaml") ;
 
            }
            else if (menu == MianJinXiShuiLv)
            {
                frame.Source = new Uri("pack://application:,,,/ZhiLiangCanShuBarChart;component/series/MediaValueOverlays2.xaml");
            }
            else if (menu == BuWanShanDu1)
            {
                frame.Source = new Uri("pack://application:,,,/ZhiLiangCanShuScatterDiagram;component/SpeedDataWindow.xaml");
            }
            else if (menu == ZhiFangSuanZhi1)
            {
                frame.Source = new Uri("pack://application:,,,/ZhiLiangCanShuScatterDiagram;component/SpeedDataWindow1.xaml");

            }
            else if (menu == MianJinXiShuiLv1)
            {
                frame.Source = new Uri("pack://application:,,,/ZhiLiangCanShuScatterDiagram;component/SpeedDataWindow2.xaml");
            }

            else if (menu == BuWanShanDu2)
            {
                frame.Source = new Uri("pack://application:,,,/ZhiLiangCanShuScatterDiagram;component/ScatterDiagramAnaylisis.xaml");
            }
            else if (menu == ZhiFangSuanZhi2)
            {
                frame.Source = new Uri("pack://application:,,,/ZhiLiangCanShuScatterDiagram;component/ScatterDiagramAnaylisis1.xaml");

            }
            else if (menu == MianJinXiShuiLv2)
            {
                frame.Source = new Uri("pack://application:,,,/ZhiLiangCanShuScatterDiagram;component/ScatterDiagramAnaylisis2.xaml");
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
        /// 1为不完善度，2为脂肪酸值，3为面筋吸水率
        /// </summary>
        public static int type;

        private void MenuItemDataYuCe_Click(object sender, RoutedEventArgs e)
        {
            MenuItem menu = sender as MenuItem;
            DataFenXi.Background = null;
            DataDisplay.Background = null;
            DataYuCe.Background = new SolidColorBrush(Colors.RoyalBlue);
            Frame frame = new Frame();

            if (menu == BuWanShanDu8)
            {
                type = 1;
                predictNum = 1;

                frame.Source = new Uri("pack://application:,,,/ZhiLiangCanShuScatterDiagram;component/PredictWindows/PredictDataWindow.xaml");
            }
            else if (menu == ZhiFangSuanZhi8)
            {
                type = 2;
                predictNum = 1;
                frame.Source = new Uri("pack://application:,,,/ZhiLiangCanShuScatterDiagram;component/PredictWindows/PredictDataWindow.xaml");
            }
            else if (menu == MianJinXiShuiLv8)
            {
                type = 3;
                predictNum = 1;

                frame.Source = new Uri("pack://application:,,,/ZhiLiangCanShuScatterDiagram;component/PredictWindows/PredictDataWindow.xaml");
            }
            else if (menu == BuWanShanDu9)
            {
                type = 1;
                predictNum = 2;
                frame.Source = new Uri("pack://application:,,,/ZhiLiangCanShuScatterDiagram;component/PredictWindows/PredictDataWindow.xaml");
            }
            else if (menu == ZhiFangSuanZhi9)
            {
                type = 2;
                predictNum = 2;
                frame.Source = new Uri("pack://application:,,,/ZhiLiangCanShuScatterDiagram;component/PredictWindows/PredictDataWindow.xaml");
            }
            else if (menu == MianJinXiShuiLv9)
            {
                type = 3;
                predictNum = 2;
                frame.Source = new Uri("pack://application:,,,/ZhiLiangCanShuScatterDiagram;component/PredictWindows/PredictDataWindow.xaml");
            }
            else if (menu == BuWanShanDu10)
            {
                type = 1;
                frame.Source = new Uri("pack://application:,,,/ZhiLiangCanShuScatterDiagram;component/PredictWindows/PredictDataWindow1.xaml");
            }
            else if (menu == ZhiFangSuanZhi10)
            {
                type = 2;
                frame.Source = new Uri("pack://application:,,,/ZhiLiangCanShuScatterDiagram;component/PredictWindows/PredictDataWindow1.xaml");
            }
            else if (menu == MianJinXiShuiLv10)
            {
                type = 3;
                frame.Source = new Uri("pack://application:,,,/ZhiLiangCanShuScatterDiagram;component/PredictWindows/PredictDataWindow1.xaml");
            }
            else if (menu == BuWanShanDu11)
            {
                type = 1;
                frame.Source = new Uri("pack://application:,,,/ZhiLiangCanShuScatterDiagram;component/PredictWindows/PredictDataWindow2.xaml");
            }
            else if (menu == ZhiFangSuanZhi11)
            {
                type = 2;
                frame.Source = new Uri("pack://application:,,,/ZhiLiangCanShuScatterDiagram;component/PredictWindows/PredictDataWindow2.xaml");

            }
            else if (menu == MianJinXiShuiLv11)
            {
                type = 3;
                frame.Source = new Uri("pack://application:,,,/ZhiLiangCanShuScatterDiagram;component/PredictWindows/PredictDataWindow2.xaml");
            }

            if (mainGrid.Children.Count > 0)
            {
                mainGrid.Children.Clear();
            }
            mainGrid.Children.Add(frame);
        }

        public static RichTextBox miaoShu;
        private void Grid_Load(object sender, RoutedEventArgs e)
        {
            miaoShu = jieshi;
            DataFenXi.Background = new SolidColorBrush(Colors.RoyalBlue);
            DataDisplay.Background = null;
            DataYuCe.Background = null;
            Frame frame = new Frame();
            frame.Source = new Uri("pack://application:,,,/ZhiLiangCanShuBarChart;component/series/MediaValueOverlays.xaml");
            if (mainGrid.Children.Count > 0)
            {
                mainGrid.Children.Clear();
            }
            mainGrid.Children.Add(frame);
        }


    }
}
