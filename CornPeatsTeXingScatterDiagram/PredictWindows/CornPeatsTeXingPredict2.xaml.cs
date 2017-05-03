using CornPeatsTeXingDataMember;
using Infragistics.Controls.Charts;
using Infragistics.Windows.Chart;
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

namespace CornPeatsTeXingScatterDiagram.PredictWindows
{
    /// <summary>
    /// CornPeatsTeXingPredict2.xaml 的交互逻辑
    /// </summary>
    public partial class CornPeatsTeXingPredict2 : Page
    {
        XiaoMaiDisplayModel model;
        ConvertStringToRichTextBox convertToBox = new ConvertStringToRichTextBox();
        
        public CornPeatsTeXingPredict2()
        {
            InitializeComponent();
        }

        private void OnCategoryChartMouseMove(object sender, MouseEventArgs e)
        {

            DataSource data = new DataSource();
            var series1 = this.CategoryChart.Series.FirstOrDefault();

            if (series1 == null) return;

            var position = e.GetPosition(series1);

            // calculate crosshair coordinates on CategoryDateTimeXAxis 
            if (((XamDataChart)series1.SeriesViewer).Axes.OfType<CategoryDateTimeXAxis>().Any())
            {
                var xAxis = ((XamDataChart)series1.SeriesViewer).Axes.OfType<CategoryDateTimeXAxis>().First();
                var yAxis = ((XamDataChart)series1.SeriesViewer).Axes.OfType<NumericYAxis>().First();

                var viewport = new Rect(0, 0, xAxis.ActualWidth, yAxis.ActualHeight);
                var window = series1.SeriesViewer.WindowRect;

                bool isInverted = xAxis.IsInverted;
                ScalerParams param = new ScalerParams(window, viewport, isInverted);
                var unscaledX = xAxis.GetUnscaledValue(position.X, param);

                isInverted = yAxis.IsInverted;
                param = new ScalerParams(window, viewport, isInverted);
                var unscaledY = yAxis.GetUnscaledValue(position.Y, param);

                if ((long)unscaledX < DateTime.MinValue.Ticks || (long)unscaledX > DateTime.MaxValue.Ticks)
                {
                    return;
                }
                DateTime xDate = new DateTime((long)unscaledX);

                this.CategoryXCoordinateTextBlock.Text = String.Format("{0:MM-dd}", xDate);
                this.CategoryYCoordinateTextBlock.Text = String.Format("{0:0.00}", unscaledY);

                string dateStr = String.Format("{0:MM-dd}", xDate);
                if (col != null && col.Visibility == Visibility.Visible)
                {
                    foreach (DataValue data1 in predictData)
                    {
                        string dateStr1 = String.Format("{0:MM-dd}", data1.date);
                        if (dateStr1.Equals(dateStr))
                        {
                            textDate.Text = dateStr;
                            textCha.Text = String.Format("{0:0.00}", data1.ChaValue);
                            break;
                        }
                    }
                }
                textCornY1.Text = String.Format("{0:0.00}", unscaledY);
                textCornDate.Text = String.Format("{0:MM-dd}", xDate);


            }
        }
      
        public List<DataValue> getPredictData(String shiYanNumber)
        {
            return SelectData.getAllPredictValue(shiYanNumber);

        }
        public void ButMap(RadioButton but)
        {
            if (but == but1)
            {
                predictData = getPredictData("000037");
                model = (new DataSource("000037")).getMiaoShu();
            }
            if (but == but2)
            {
                predictData = getPredictData("000038");
                model = (new DataSource("000038")).getMiaoShu();
            }
            if (but == but3)
            {
                predictData = getPredictData("000039");
                model = (new DataSource("000039")).getMiaoShu();
            }

            wheateHaiChongDuiXiaoMaiYingXiang.miaoShu.Document = convertToBox.convertStringToFlowDocument(model.chartMiaoShu); ;
            col.ItemsSource = predictData;
            col.Visibility = Visibility.Visible;
            //textName.Text = predictData[0].yLable;
            //num.Text = Convert.ToString(predictData[0].PeatsMiDu);
            tempText.Text = predictData[0].InTemp;
            labTitle.Content = "小麦感染谷蠹后虫蚀粒率的变化预测情况";

            colPredict.MarkerType = Infragistics.Controls.Charts.MarkerType.None;
            colPredict.Thickness = 5;
            colPredict.ItemsSource = predictData;
            colPredict.ValueMemberPath = "PredictData";
            colPredict.XAxis = categoryDateAxis;
            colPredict.YAxis = numericYAxis;
            colPredict.Opacity = 0.5;
            colPredict.Visibility = Visibility.Visible;
            colPredict.ToolTip = col.ToolTip;
            colPredict.Brush = new SolidColorBrush(Colors.Green);
            this.CategoryChart.Series.Add(colPredict);


            categoryDateAxis.ItemsSource = predictData;
        }
        public void ButMap2(RadioButton but)
        {
            if (but == but1)
            {
                predictData = getPredictData("000040");
                model = (new DataSource("000040")).getMiaoShu();
            }
            if (but == but2)
            {
                predictData = getPredictData("000041");
                model = (new DataSource("000041")).getMiaoShu();
            }
            if (but == but3)
            {
                predictData = getPredictData("000042");
                model = (new DataSource("000042")).getMiaoShu();
            }

            wheateHaiChongDuiXiaoMaiYingXiang.miaoShu.Document = convertToBox.convertStringToFlowDocument(model.chartMiaoShu); ;
            col.ItemsSource = predictData;
            col.Visibility = Visibility.Visible;
            //textName.Text = predictData[0].yLable;
            //num.Text = Convert.ToString(predictData[0].PeatsMiDu);
            tempText.Text = predictData[0].InTemp;
            labTitle.Content = "小麦感染米象后虫蚀粒率的变化预测情况";

            colPredict.MarkerType = Infragistics.Controls.Charts.MarkerType.None;
            colPredict.Thickness = 5;
            colPredict.ItemsSource = predictData;
            colPredict.ValueMemberPath = "PredictData";
            colPredict.XAxis = categoryDateAxis;
            colPredict.YAxis = numericYAxis;
            colPredict.Opacity = 0.5;
            colPredict.Visibility = Visibility.Visible;
            colPredict.ToolTip = col.ToolTip;
            colPredict.Brush = new SolidColorBrush(Colors.Green);
            this.CategoryChart.Series.Add(colPredict);

            categoryDateAxis.ItemsSource = predictData;

        }
        public void ButMap3(RadioButton but)
        {
            if (but == but1)
            {
                if (Convert.ToInt16(tempCom.SelectedItem) == 20)
                {

                    predictData = getPredictData("000043");
                    model = (new DataSource("000043")).getMiaoShu();
                }
                else if (Convert.ToInt16(tempCom.SelectedItem) == 25)
                {

                    predictData = getPredictData("000047");
                    model = (new DataSource("000047")).getMiaoShu();
                }

            }
            if (but == but2)
            {
                if (Convert.ToInt16(tempCom.SelectedItem) == 20)
                {

                    predictData = getPredictData("000044");
                    model = (new DataSource("000044")).getMiaoShu();
                }
                else if (Convert.ToInt16(tempCom.SelectedItem) == 25)
                {

                    predictData = getPredictData("000048");
                    model = (new DataSource("000048")).getMiaoShu();
                }

            }
            if (but == but3)
            {
                if (Convert.ToInt16(tempCom.SelectedItem) == 20)
                {

                    predictData = getPredictData("000045");
                    model = (new DataSource("000045")).getMiaoShu();
                }
                else if (Convert.ToInt16(tempCom.SelectedItem) == 25)
                {

                    predictData = getPredictData("000049");
                    model = (new DataSource("000049")).getMiaoShu();
                }

            }
            if (but == but4)
            {
                if (Convert.ToInt16(tempCom.SelectedItem) == 20)
                {

                    predictData = getPredictData("000046");
                    model = (new DataSource("000046")).getMiaoShu();
                }
                else if (Convert.ToInt16(tempCom.SelectedItem) == 25)
                {

                    predictData = getPredictData("000050");
                    model = (new DataSource("000050")).getMiaoShu();
                }

            }

            wheateHaiChongDuiXiaoMaiYingXiang.miaoShu.Document = convertToBox.convertStringToFlowDocument(model.chartMiaoShu); ;
            col.ItemsSource = predictData;
            col.Visibility = Visibility.Visible;
            //textName.Text = predictData[0].yLable;
            //num.Text = Convert.ToString(predictData[0].PeatsMiDu);
            tempText.Text = predictData[0].InTemp;
            labTitle.Content = "小麦感染玉米象后容重的变化预测情况";

            colPredict.MarkerType = Infragistics.Controls.Charts.MarkerType.None;
            colPredict.Thickness = 5;
            colPredict.ItemsSource = predictData;
            colPredict.ValueMemberPath = "PredictData";
            colPredict.XAxis = categoryDateAxis;
            colPredict.YAxis = numericYAxis;
            colPredict.Opacity = 0.5;
            colPredict.Visibility = Visibility.Visible;
            colPredict.ToolTip = col.ToolTip;
            colPredict.Brush = new SolidColorBrush(Colors.Green);
            this.CategoryChart.Series.Add(colPredict);


            categoryDateAxis.ItemsSource = predictData;
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            RadioButton but = sender as RadioButton;
            but1.IsChecked = false;
            but2.IsChecked = false;
            but3.IsChecked = false;
            but4.IsChecked = false;
            but.IsChecked = true;

            initDate(but);
        
        }


        SplineSeries colPredict = new SplineSeries();

        List<DataValue> predictData = new List<DataValue>();

        private void Grid_Loaded(object sender, RoutedEventArgs e)
        {
            if (wheateHaiChongDuiXiaoMaiYingXiang.type == 1 || wheateHaiChongDuiXiaoMaiYingXiang.type == 2)
            {
                but4.Visibility = Visibility.Hidden;
                tempCom.Visibility = Visibility.Hidden;
                but1.Content = "虫口密度为:4";
                but2.Content = "虫口密度为:6";
                but3.Content = "虫口密度为:10";
                numericYAxis.MinimumValue = 0;
                numericYAxis.MaximumValue = 50;
                numericYAxis.Interval = 5;
                yLabel.Content = "虫\n蚀\n粒\n率\n（\n%\n)";

            }
            else if (wheateHaiChongDuiXiaoMaiYingXiang.type == 3)
            {
                tempText.Visibility = Visibility.Hidden;
                but1.Content = "虫口密度为:0";
                but2.Content = "虫口密度为:2";
                but3.Content = "虫口密度为:5";
                but4.Content = "虫口密度为:10";
                numericYAxis.MinimumValue = 700;
                numericYAxis.MaximumValue = 800;
                numericYAxis.Interval = 10;
                yLabel.Content = "容\n重\n（\ng\n/\nL\n)";
            }
            else
            {
                MessageBox.Show("初始化错误!");
                return;
            }
            initDate(but1);
        }

        private void initDate(RadioButton but)
        {

            if (wheateHaiChongDuiXiaoMaiYingXiang.type == 1)
            {
                ButMap(but);
            }
            else if (wheateHaiChongDuiXiaoMaiYingXiang.type == 2)
            {
                ButMap2(but);
            }
            else if (wheateHaiChongDuiXiaoMaiYingXiang.type == 3)
            {
                ButMap3(but);
            }
            else
            {
                MessageBox.Show("初始化失败!!");
            }
        }


        public double getMax(List<DataValue> datapoint)
        {
            double[] dataPredict = new double[datapoint.Count];
            for (int i = 0; i < datapoint.Count; i++)
            {
                dataPredict[i] = datapoint[i].PredictData;
            }

            return SelectData.getHigh(dataPredict);
        }


        private void moveLine_MouseMove(object sender, MouseEventArgs e)
        {

            var series = this.CategoryChart.Series.FirstOrDefault();

            if (series == null) return;

            var position = e.GetPosition(series);

            // calculate crosshair coordinates on CategoryDateTimeXAxis 
            if (((XamDataChart)series.SeriesViewer).Axes.OfType<NumericXAxis>().Any())
            {
                var xAxis = ((XamDataChart)series.SeriesViewer).Axes.OfType<NumericXAxis>().First();
                var yAxis = ((XamDataChart)series.SeriesViewer).Axes.OfType<NumericYAxis>().First();

                var viewport = new Rect(0, 0, xAxis.ActualWidth, yAxis.ActualHeight);
                var window = series.SeriesViewer.WindowRect;

                bool isInverted = xAxis.IsInverted;
                ScalerParams param = new ScalerParams(window, viewport, isInverted);
                var unscaledX = xAxis.GetUnscaledValue(position.X, param);

                moveLine.Value = unscaledX;

            }

        }

      

        private void tempComm_Changed(object sender, EventArgs e)
        {
            if (but1.IsChecked == true)
            {
                initDate(but1);
            }
            else if (but2.IsChecked == true)
            {
                initDate(but2);
            }
            else if (but3.IsChecked == true)
            {
                initDate(but3);
            }
            else if (but4.IsChecked == true)
            {
                initDate(but4);
            }
            else
            {
                MessageBox.Show("没有数据!!");
            }
        }

        private void tempCom_load(object sender, RoutedEventArgs e)
        {
            int[] tempValue = new int[2];
            tempValue[0] = 20;
            tempValue[1] = 25;
            tempCom.ItemsSource = tempValue;
        }
    }
}