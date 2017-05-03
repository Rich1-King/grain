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
    /// CornPeatsTeXingSpeedYuMiXiang.xaml 的交互逻辑
    /// </summary>
    public partial class CornPeatsTeXingSpeedYuMiXiang : Page
    {
        public CornPeatsTeXingSpeedYuMiXiang()
        {
            InitializeComponent();
        }
        DataSource Data;
        XiaoMaiDisplayModel model;
        ConvertStringToRichTextBox convertToBox = new ConvertStringToRichTextBox();

        private void OnCategoryChartMouseMove(object sender, MouseEventArgs e)
        {

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
        private void Button_Click(object sender, RoutedEventArgs e)
        {

            RadioButton but = sender as RadioButton;

            but0.IsChecked = false;
            but2.IsChecked = false;
            but5.IsChecked = false;
            but10.IsChecked = false;
            but.IsChecked = true;

            if (Convert.ToInt16(temp.SelectedItem) == 20)
            {
                if (but == but0)
                {
                    Data = new DataSource("000043");
                }
                else if (but == but2)
                {
                    Data = new DataSource("000044");
                }
                else if (but == but5)
                {
                    Data = new DataSource("000045");
                }
                else if (but == but10)
                {
                    Data = new DataSource("000046");
                }
                else
                {
                    MessageBox.Show("没有数据");
                    return;
                }

            }
            else if (Convert.ToInt16(temp.SelectedItem) == 25)
            {
                if (but == but0)
                {
                    Data = new DataSource("000047");
                }
                else if (but == but2)
                {
                    Data = new DataSource("000048");
                }
                else if (but == but5)
                {
                    Data = new DataSource("000049");
                }
                else if (but == but10)
                {
                    Data = new DataSource("000050");
                }
                else
                {
                    MessageBox.Show("没有数据");
                    return;
                }
            }
            else
            {
                MessageBox.Show("没有数据");
                return;
            }
            model = Data.getMiaoShu();
            wheateHaiChongDuiXiaoMaiYingXiang.miaoShu.Document = convertToBox.convertStringToFlowDocument(model.chartSpeedMiaoShu);
            col.ItemsSource = Data;
            col.Visibility = Visibility.Visible;
            //textName.Text = Data[0].yLable;
            //num.Content = Data[0].PeatsMiDu;   
            labTitle.Content = "小麦感染玉米象后容重的增长速率的变化情况";
            categoryDateAxis.ItemsSource = Data;

        }

        private void temp_load(object sender, RoutedEventArgs e)
        {
            int[] tempValue = new int[2];
            tempValue[0] = 20;
            tempValue[1] = 25;
            temp.ItemsSource = tempValue;
        }

        private void temp_Changed(object sender, EventArgs e)
        {

            if (Convert.ToInt16(temp.SelectedItem) == 20)
            {
                if (but0.IsChecked == true)
                {
                    Data = new DataSource("000043");
                }
                else if (but2.IsChecked == true)
                {
                    Data = new DataSource("000044");
                }
                else if (but5.IsChecked == true)
                {
                    Data = new DataSource("000045");
                }
                else if (but10.IsChecked == true)
                {
                    Data = new DataSource("000046");
                }
                else
                {
                    MessageBox.Show("没有数据");
                    return;
                }

            }
            else if (Convert.ToInt16(temp.SelectedItem) == 25)
            {
                if (but0.IsChecked == true)
                {
                    Data = new DataSource("000047");
                }
                else if (but2.IsChecked == true)
                {
                    Data = new DataSource("000048");
                }
                else if (but5.IsChecked == true)
                {
                    Data = new DataSource("000049");
                }
                else if (but10.IsChecked == true)
                {
                    Data = new DataSource("000050");
                }
                else
                {
                    MessageBox.Show("没有数据");
                    return;
                }
            }
            else
            {
                MessageBox.Show("没有数据");
                return;
            }
            model = Data.getMiaoShu();
            wheateHaiChongDuiXiaoMaiYingXiang.miaoShu.Document = convertToBox.convertStringToFlowDocument(model.chartSpeedMiaoShu);
            col.ItemsSource = Data;
            col.Visibility = Visibility.Visible;
            //textName.Text = Data[0].yLable;
            //num.Content = Data[0].PeatsMiDu;   
            labTitle.Content = "小麦感染玉米象后容重的增长速率的变化情况";
            categoryDateAxis.ItemsSource = Data;

        }

    }
}
