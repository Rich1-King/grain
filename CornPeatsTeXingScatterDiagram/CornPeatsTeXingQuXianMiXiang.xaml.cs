using CornPeatsTeXingDataMember;
using Infragistics.Controls.Charts;
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
using wheateWindow;
using ConvertData;

namespace CornPeatsTeXingScatterDiagram
{
    /// <summary>
    /// CornPeatsTeXingQuXianMiXiang.xaml 的交互逻辑
    /// </summary>
    public partial class CornPeatsTeXingQuXianMiXiang : Page
    {
        public CornPeatsTeXingQuXianMiXiang()
        {
            InitializeComponent();
        }
        private void OnCategoryChartMouseMove(object sender, MouseEventArgs e)
        {
            DataSource data = new DataSource();
            var series = this.CategoryChart.Series.FirstOrDefault();

            if (series == null) return;

            var position = e.GetPosition(series);

            // calculate crosshair coordinates on CategoryDateTimeXAxis 
            if (((XamDataChart)series.SeriesViewer).Axes.OfType<CategoryDateTimeXAxis>().Any())
            {
                var xAxis = ((XamDataChart)series.SeriesViewer).Axes.OfType<CategoryDateTimeXAxis>().First();
                var yAxis = ((XamDataChart)series.SeriesViewer).Axes.OfType<NumericYAxis>().First();

                var viewport = new Rect(0, 0, xAxis.ActualWidth, yAxis.ActualHeight);
                var window = series.SeriesViewer.WindowRect;

                bool isInverted = xAxis.IsInverted;
                ScalerParams param = new ScalerParams(window, viewport, isInverted);
                var unscaledX = xAxis.GetUnscaledValue(position.X, param);

                isInverted = yAxis.IsInverted;
                param = new ScalerParams(window, viewport, isInverted);
                var unscaledY = yAxis.GetUnscaledValue(position.Y, param);

                DateTime xDate = new DateTime((long)unscaledX);
                //DateTime xDate = new DateTime((int)unscaledX, 1, 1);

                this.CategoryXCoordinateTextBlock.Text = String.Format("{0:MM-dd}", xDate);
                this.CategoryYCoordinateTextBlock.Text = String.Format("{0:0.00}", unscaledY);

                textCornY1.Text = String.Format("{0:0.00}", unscaledY);
                textCornDate.Text = String.Format("{0:MM-dd}", xDate);

            }
        }

        DataSource Data;
        XiaoMaiDisplayModel model;
        ConvertStringToRichTextBox convertToBox = new ConvertStringToRichTextBox();
        private void Button_Click(object sender, RoutedEventArgs e)
        {
            RadioButton but = sender as RadioButton;
            but4.IsChecked = false;
            but6.IsChecked = false;
            but10.IsChecked = false;
            but.IsChecked = true;
            if (but == but4)
            {
                Data = new DataSource("000040");
            }
            if (but == but6)
            {
                Data = new DataSource("000041");
            }
            if (but == but10)
            {
                Data = new DataSource("000042");
            }
            model = Data.getMiaoShu();
            wheateHaiChongDuiXiaoMaiYingXiang.miaoShu.Document = convertToBox.convertStringToFlowDocument(model.chartMiaoShu); ;
            col.ItemsSource = Data;
            col.Visibility = Visibility.Visible;
            //textName.Text = Data[0].yLable;
            //num.Content = Convert.ToString(Data[0].PeatsMiDu);
            temp.Text = Data[0].InTemp;
            labTitle.Content = "小麦感染米象后虫蚀粒率的变化情况";
            categoryDateAxis.ItemsSource = Data;

        }

        private void LayoutRoot_load(object sender, RoutedEventArgs e)
        {
            Data = new DataSource("000040");
            model = Data.getMiaoShu();
            wheateHaiChongDuiXiaoMaiYingXiang.miaoShu.Document = convertToBox.convertStringToFlowDocument(model.chartMiaoShu); ;
            col.ItemsSource = Data;
            col.Visibility = Visibility.Visible;
            //textName.Text = Data[0].yLable;
            // num.Content = Data[0].PeatsMiDu;
            temp.Text = Data[0].InTemp;
            labTitle.Content = "小麦感染米象后虫蚀粒率的变化情况";
            categoryDateAxis.ItemsSource = Data;
        }
    }
}
