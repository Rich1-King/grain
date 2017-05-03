using DataModel;
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
using DataBaseControl;
using Infragistics.Controls.Charts;
using XAndYAxis;
using YuMiWindow;



namespace YuMiChart
{
    /// <summary>
    /// ChartDisplay.xaml 的交互逻辑
    /// </summary>
    public partial class ChartDisplay : Page
    {    
        public ChartDisplay()
        {
            InitializeComponent();
            xamDataChart = dataChart;
           
        }

        private Frame frame;

        public static Label title;
        public static Label xText;
        public static TextBlock yText;
        public static Grid biaoShiGrid;
    
        public static XamDataChart xamDataChart;
        public static Grid mainGrid;
        public static RichTextBox jieShi;
        private void Grid_load(object sender, RoutedEventArgs e)
        {
            mainGrid = main;
            biaoShiGrid = biaoShi;
            title = labTitle;
            xText = xLabel;
            yText = yLabel;
            jieShi = jieshi;
            frame = new Frame();
            if (YuMiMainPage.type == 1)
            { 
                frame.Source = new Uri("pack://application:,,,/yuMiChart;component/SelectPage.xaml");
               
            }
            else if (YuMiMainPage.type == 2)
            {
                frame.Source = new Uri("pack://application:,,,/yuMiChart;component/SelectPageBaoZi.xaml");
            }
            else if (YuMiMainPage.type == 3)
            {
                frame.Source = new Uri("pack://application:,,,/yuMiChart;component/SelectPageYuMiPoHuai.xaml");
            }
            if (select.Children.Count > 0)
            {
                select.Children.Clear();
            }
            select.Children.Add(frame);   
        }

        private void OnCategoryChartMouseMove(object sender, MouseEventArgs e)
        {
            //DataSource data=new DataSource();
            var series = this.dataChart.Series.FirstOrDefault();

            if (series == null) return;

            var position = e.GetPosition(series);

            if (((XamDataChart)series.SeriesViewer).Axes.OfType<CategoryXAxis>().Any())
            {
                var xAxis = ((XamDataChart)series.SeriesViewer).Axes.OfType<CategoryXAxis>().First();
                var yAxis = ((XamDataChart)series.SeriesViewer).Axes.OfType<NumericYAxis>().First();

                var viewport = new Rect(0, 0, xAxis.ActualWidth, yAxis.ActualHeight);
                var window = series.SeriesViewer.WindowRect;

                bool isInverted = xAxis.IsInverted;
                ScalerParams param = new ScalerParams(window, viewport, isInverted);
                var unscaledX = xAxis.GetUnscaledValue(position.X, param);

                isInverted = yAxis.IsInverted;
                param = new ScalerParams(window, viewport, isInverted);
                var unscaledY = yAxis.GetUnscaledValue(position.Y, param);

               // MessageBox.Show((unscaledX).ToString() +"  "+ unscaledY.ToString());

                //DateTime xDate = new DateTime((long)unscaledX);
                //DateTime xDate = new DateTime((int)unscaledX, 1, 1);

                //this.CategoryXCoordinateTextBlock.Text = String.Format("{0:MM-dd}", xDate);
                //this.CategoryYCoordinateTextBlock.Text = String.Format("{0:0.00}", unscaledY);

                //textGrainY.Text = String.Format("{0:0.00}",unscaledY);
                //textGrainDate.Text = String.Format("{0:MM-dd}", xDate);

                //textCornY1.Text = String.Format("{0:0.00}", unscaledY);
                //textCornDate.Text = String.Format("{0:MM-dd}", xDate);

                //textRiceY2.Text = String.Format("{0:0.00}", unscaledY);
                //textRiceDate.Text = String.Format("{0:MM-dd}", xDate);

                //textTCCY3.Text = String.Format("{0:0.00}", unscaledY);
                //textTCCDate.Text = String.Format("{0:MM-dd}", xDate);
            }

        }

      
       
    } 
}
