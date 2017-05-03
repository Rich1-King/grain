using DataMember;
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

namespace wheateWindow
{
    /// <summary>
    /// wheateHeader.xaml 的交互逻辑
    /// </summary>
    public partial class wheatePeatsZongQunHeader : Page
    {
        public wheatePeatsZongQunHeader()
        {
            InitializeComponent();
        }

        ConvertStringToRichTextBox convertToBox = new ConvertStringToRichTextBox();
        private void MenuItemDataFenxi_Click(object sender, RoutedEventArgs e)
        {
            MenuItem menuItem = sender as MenuItem;
            DataFenXi.Background = new SolidColorBrush(Colors.RoyalBlue);
            DataDisplay.Background = null;
            DataYuCe.Background = null;

            Frame frame = new Frame();
          
                if (menuItem == ZuiZhi)
                {
                    frame.Source = new Uri("pack://application:,,,/BarChart;component/series/MediaValueOverlays.xaml");                
                }
                else if (menuItem == ZZSL)
                {
                    frame.Source = new Uri("pack://application:,,,/ScatterDiagram;component/SpeedDataWindow.xaml");
                }
                else if (menuItem == NHQX)
                {
                    frame.Source = new Uri("pack://application:,,,/ScatterDiagram;component/ScatterDiagramAnaylisis.xaml");
                }
          
            if (mainGrid.Children.Count > 0)
            {
                mainGrid.Children.Clear();
            }
            mainGrid.Children.Add(frame);
        }

        private void MenuItemDataDisplay_Click(object sender, RoutedEventArgs e)
        {
            MenuItem menuItem = sender as MenuItem;

            DataFenXi.Background = null;
            DataDisplay.Background = new SolidColorBrush(Colors.RoyalBlue);
            DataYuCe.Background = null;

            Frame frame = new Frame();
        
                if (menuItem == QXT1)
                {
                    frame.Source = new Uri("pack://application:,,,/ScatterDiagram;component/LineCrosshairCoordinates.xaml");
                }
                //else if (menuItem == QXT2)
                //{
                //    frame.Source = new Uri("pack://application:,,,/ScatterDiagram;component/LineCrosshairCoordinates1.xaml");
                //}
                else if (menuItem == QXT3)
                {
                    frame.Source = new Uri("pack://application:,,,/ScatterDiagram;component/LineCrosshairCoordinates2.xaml");
                }
                else if (menuItem == TXT1)
                {
                    frame.Source = new Uri("pack://application:,,,/BarChart;component/series/ValueOverlays.xaml");
                }
                //else if (menuItem == TXT2)
                //{
                //    frame.Source = new Uri("pack://application:,,,/BarChart;component/series/ValueOverlays1.xaml");
                //}
                else if (menuItem == TXT3)
                {
                    frame.Source = new Uri("pack://application:,,,/BarChart;component/series/ValueOverlays2.xaml");
                }
                else if (menuItem == ZXT1)
                {
                    frame.Source = new Uri("pack://application:,,,/ScatterDiagram;component/ChartCrosshairCoordinates.xaml");
                }
                //else if (menuItem == ZXT2)
                //{
                //    frame.Source = new Uri("pack://application:,,,/ScatterDiagram;component/ChartCrosshairCoordinates1.xaml");
                //}
                else if (menuItem == ZXT3)
                {
                    frame.Source = new Uri("pack://application:,,,/ScatterDiagram;component/ChartCrosshairCoordinates2.xaml");
                }
                else if (menuItem == DTT)
                {
                    frame.Source = new Uri("pack://application:,,,/WpfApplication6;component/MainWindow.xaml");
                  
                  XiaoMaiDisplayModel model = (new DataSource("000051")).getMiaoShu();
                  
                  XiaoMaiDisplayModel  model1 = (new DataSource("000052")).getMiaoShu();
                  
                   XiaoMaiDisplayModel  model2 = (new DataSource("000053")).getMiaoShu();
               
                    XiaoMaiDisplayModel model3 = (new DataSource("000054")).getMiaoShu();
                    jieshi.Document = convertToBox.convertStringToFlowDocument
                        (model.chartMiaoShu+"\n"+model1.chartMiaoShu+"\n"+model2.chartMiaoShu+"\n"+model3.chartMiaoShu+"\n");
                }
                else if (menuItem == QPT)
                {
                    frame.Source = new Uri("pack://application:,,,/Glob;component/AllWindow.xaml");
                }

            if (mainGrid.Children.Count > 0)
            {
                mainGrid.Children.Clear();
            }
            mainGrid.Children.Add(frame);
        }

        /// <summary>
        /// 判断输入的天数是那种预测情况,根据天数是0，日期是1
        /// </summary>
        public static int predictIndex = -1;///判断输入的天数是那种预测情况,根据天数是0，日期是1
        private void MenuItemDataYuCe_Click(object sender, RoutedEventArgs e)
        {
            
            MenuItem menuItem = sender as MenuItem;

            DataFenXi.Background = null;
            DataDisplay.Background = null;
            DataYuCe.Background = new SolidColorBrush(Colors.RoyalBlue);

            Frame frame = new Frame();
         
                if (sender == Day)
                {
                    predictIndex = 0;
                    frame.Source = new Uri("pack://application:,,,/ScatterDiagram;component/PredictWindows/PredictDataWindow.xaml");
                }
                else if (sender == Date)
                {         
                    predictIndex = 1;
                    frame.Source = new Uri("pack://application:,,,/ScatterDiagram;component/PredictWindows/PredictDataWindow.xaml");
                }
                else if (sender == ZXEC)
                {
                    frame.Source = new Uri("pack://application:,,,/ScatterDiagram;component/PredictWindows/PredictDataWindow1.xaml");
                }
                else if (sender == LGLR)
                {
                    frame.Source = new Uri("pack://application:,,,/ScatterDiagram;component/PredictWindows/PredictDataWindow2.xaml");
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

            MenuItem menuItem = sender as MenuItem;
            DataFenXi.Background = new SolidColorBrush(Colors.RoyalBlue);
            DataDisplay.Background = null;
            DataYuCe.Background = null;
            Frame frame = new Frame();
            frame.Source = new Uri("pack://application:,,,/BarChart;component/series/MediaValueOverlays.xaml");
            if (mainGrid.Children.Count > 0)
            {
                mainGrid.Children.Clear();
            }
            mainGrid.Children.Add(frame);
        }
    }
}
