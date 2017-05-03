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
namespace CornPeatsTeXingScatterDiagram.PredictWindows
{
    /// <summary>
    /// CornPeatsTeXingPredict1.xaml 的交互逻辑
    /// </summary>
    public partial class CornPeatsTeXingPredict1 : Page
    {
        XiaoMaiDisplayModel model;
        ConvertStringToRichTextBox convertToBox = new ConvertStringToRichTextBox();
        
        public CornPeatsTeXingPredict1()
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
                if ((long)unscaledX > DateTime.MaxValue.Ticks || (long)unscaledX < DateTime.MinValue.Ticks)
                {
                    return;
                }
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
            but1.IsChecked = false;
            but2.IsChecked = false;
            but3.IsChecked = false;
            but4.IsChecked = false;
            but.IsChecked = true;
            initDate();
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

                // moveLine.Value = unscaledX;

            }

        }

        private void display_Load(object sender, RoutedEventArgs e)
        {
            //Frame frame = new Frame();
            //frame.Source = new Uri("pack://application:,,,/ScatterDiagram;component/Title/Title.xaml");
            //if (display.Children.Count > 0)
            //{
            //    display.Children.Clear();
            //}
            //display.Children.Add(frame);
        }

        private void JiaZaiData_Loaded(object sender, RoutedEventArgs e)
        {
            List<int> day = new List<int>();
            for (int i = 0; i <= 30; i++)
            {
                day.Add(i);
            }

            daySelect.ItemsSource = day;
        }

        private void DayOrDate_Load(object sender, RoutedEventArgs e)
        {

            if (wheateHaiChongDuiXiaoMaiYingXiang.predictNum == 1)
            {
                dateSelect.IsEnabled = false;
            }
            else if (wheateHaiChongDuiXiaoMaiYingXiang.predictNum == 2)
            {
                daySelect.IsEnabled = false;
            }

        }
 
        private void daySelect_Changed(object sender, EventArgs e)
        {
            if (wheateHaiChongDuiXiaoMaiYingXiang.predictNum == 2)
            {
                return;
            }
            if (!this.IsLoaded)
            {
                return;
            }

            initDate(); 
        }

        private void dateSelect_Changed(object sender, SelectionChangedEventArgs e)
        {
            if (wheateHaiChongDuiXiaoMaiYingXiang.predictNum == 1)
            {
                return;
            }

            if (!this.IsLoaded)
            {
                return;
            }

            initDate();
        }
        DataSource Data;
        List<DataValue> predictData;
        SplineSeries colPredict = new SplineSeries();
        public List<DataValue> getPredictData(String shiYanNumber,int dayNum)
        {
           

            return SelectData.getPredictData(shiYanNumber, dayNum);

        }
        public void ButMap(RadioButton but,int dayNum)
        {
            if (but == but1)
            {
                Data = new DataSource("000037");
                predictData = getPredictData("000037",dayNum);
            }
            if (but == but2)
            {
                Data = new DataSource("000038");
                predictData = getPredictData("000038", dayNum);
            }
            if (but == but3)
            {
                predictData = getPredictData("000039", dayNum);
                Data = new DataSource("000039");
            }
            model = Data.getMiaoShu();
            wheateHaiChongDuiXiaoMaiYingXiang.miaoShu.Document = convertToBox.convertStringToFlowDocument(model.chartMiaoShu);
            col.ItemsSource = Data;
            //col.Visibility = Visibility.Visible;
            //textName.Text = Data[0].yLable;
            //water.Content = Data[0].PeatsMiDu;
            tempText.Text = Data[0].InTemp;
            labTitle.Content = "小麦感染谷蠹后虫蚀粒率的变化预测情况";

            colPredict.MarkerType = MarkerType.None;
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

            numericXAxis.MinimumValue = predictData[0].date.Ticks;
            numericXAxis.MaximumValue = predictData[predictData.Count - 1].date.Ticks;
            //textTime.Text = String.Format("{0:yyyy-MM-dd}", predictData[predictData.Count - 1].date);//预测时间
            ClipLine.Value = Data[0].EndTime.Ticks;
            categoryDateAxis.ItemsSource = predictData;
            textChaZhi.Text = String.Format("{0:MM-dd}", Data[0].EndTime);


        }

        public void ButMap2(RadioButton but, int dayNum)
        {
            if (but == but1)
            {
                Data = new DataSource("000040");
                predictData = getPredictData("000040",dayNum);
            }
            if (but == but2)
            {
                Data = new DataSource("000041");
                predictData = getPredictData("000041",dayNum);
            }
            if (but == but3)
            {
                Data = new DataSource("000042");
                predictData = getPredictData("000042",dayNum);
            }
            model = Data.getMiaoShu();
            wheateHaiChongDuiXiaoMaiYingXiang.miaoShu.Document = convertToBox.convertStringToFlowDocument(model.chartMiaoShu);
            col.ItemsSource = Data;
            //col.Visibility = Visibility.Visible;
            //textName.Text = Data[0].yLable;
            //water.Content = Data[0].PeatsMiDu;
            tempText.Text = Data[0].InTemp;
            labTitle.Content = "小麦感染米象后虫蚀粒率的变化预测情况";

            colPredict.MarkerType = MarkerType.None;
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
            numericXAxis.MinimumValue = predictData[0].date.Ticks;
            numericXAxis.MaximumValue = predictData[predictData.Count - 1].date.Ticks;
            //textTime.Text = String.Format("{0:yyyy-MM-dd}", predictData[predictData.Count - 1].date);
            ClipLine.Value = Data[0].EndTime.Ticks;
            textChaZhi.Text = String.Format("{0:MM-dd}", Data[0].EndTime);


        }

        public void ButMap3(RadioButton but,int dayNum)
        {
            if (but == but1)
            {
                
                if (Convert.ToInt16(tempCom.SelectedItem) == 20)
                {
                    Data = new DataSource("000043");
                    predictData = getPredictData("000043",dayNum);
                }
                else if (Convert.ToInt16(tempCom.SelectedItem) == 25)
                {
                    Data = new DataSource("000047");
                    predictData = getPredictData("000047",dayNum);
                }

            }
            if (but == but2)
            {
                if (Convert.ToInt16(tempCom.SelectedItem) == 20)
                {
                    Data = new DataSource("000044");
                    predictData = getPredictData("000044",dayNum);
                }
                else if (Convert.ToInt16(tempCom.SelectedItem) == 25)
                {
                    Data = new DataSource("000048");
                    predictData = getPredictData("000048",dayNum);
                }

            }
            if (but == but3)
            {
                if (Convert.ToInt16(tempCom.SelectedItem) == 20)
                {
                    Data = new DataSource("000045");
                    predictData = getPredictData("000045",dayNum);
                }
                else if (Convert.ToInt16(tempCom.SelectedItem) == 25)
                {
                    Data = new DataSource("000049");
                    predictData = getPredictData("000049",dayNum);
                }

            }
            if (but == but4)
            {
                if (Convert.ToInt16(tempCom.SelectedItem) == 20)
                {
                    Data = new DataSource("000046");
                    predictData = getPredictData("000046",dayNum);
                }
                else if (Convert.ToInt16(tempCom.SelectedItem) == 25)
                {
                    Data = new DataSource("000050");
                    predictData = getPredictData("000050",dayNum);
                }

            }
            model = Data.getMiaoShu();
            wheateHaiChongDuiXiaoMaiYingXiang.miaoShu.Document = convertToBox.convertStringToFlowDocument(model.chartMiaoShu); ;
            col.ItemsSource = Data;
            //col.Visibility = Visibility.Visible;
            //textName.Text = Data[0].yLable;
            //water.Content = Data[0].PeatsMiDu;
            //temp.Content = Data[0].InTemp;
            labTitle.Content = "小麦感染玉米象后容重的变化预测情况";

            colPredict.MarkerType = MarkerType.None;
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

            numericXAxis.MinimumValue = predictData[0].date.Ticks;
            numericXAxis.MaximumValue = predictData[predictData.Count - 1].date.Ticks;
            //textTime.Text = String.Format("{0:yyyy-MM-dd}", predictData[predictData.Count - 1].date);
            ClipLine.Value = Data[0].EndTime.Ticks;
            textChaZhi.Text = String.Format("{0:MM-dd}", Data[0].EndTime);


        }

        private void initDate()
        {
            int date;
            if (wheateHaiChongDuiXiaoMaiYingXiang.predictNum == 1)
            {
                date = Convert.ToInt32(daySelect.SelectedItem);   
            }
            else if (wheateHaiChongDuiXiaoMaiYingXiang.predictNum == 2)
            {
                DateTime dateTime = (DateTime)dateSelect.SelectedDate;
                TimeSpan time = dateTime - (new DateTime(2015, 5, 31));
                date = time.Days;
            }
            else
            {
                MessageBox.Show("初始化错误!!");
                return;
            }
            if (!this.IsLoaded)
            {
                return;
            }

            try
            {
                if (but1.IsChecked == true)
                {
                    if (wheateHaiChongDuiXiaoMaiYingXiang.type == 1)
                    {
                        ButMap(but1, date);
                    }
                    else if (wheateHaiChongDuiXiaoMaiYingXiang.type == 2)
                    {
                        ButMap2(but1, date);
                    }
                    else if (wheateHaiChongDuiXiaoMaiYingXiang.type == 3)
                    {
                        ButMap3(but1, date);
                    }
                }
                else if (but2.IsChecked == true)
                {

                    if (wheateHaiChongDuiXiaoMaiYingXiang.type == 1)
                    {
                        ButMap(but2, date);
                    }
                    else if (wheateHaiChongDuiXiaoMaiYingXiang.type == 2)
                    {
                        ButMap2(but2, date);
                    }
                    else if (wheateHaiChongDuiXiaoMaiYingXiang.type == 3)
                    {
                        ButMap3(but2, date);
                    }
                }
                else if (but3.IsChecked == true)
                {

                    if (wheateHaiChongDuiXiaoMaiYingXiang.type == 1)
                    {
                        ButMap(but3, date);
                    }
                    else if (wheateHaiChongDuiXiaoMaiYingXiang.type == 2)
                    {
                        ButMap2(but3, date);
                    }
                    else if (wheateHaiChongDuiXiaoMaiYingXiang.type == 3)
                    {
                        ButMap3(but3, date);
                    }
                }
                else if (but4.IsChecked == true)
                {
                    if (wheateHaiChongDuiXiaoMaiYingXiang.type == 1)
                    {
                        MessageBox.Show("没有数据!!");
                        return;
                    }
                    else if (wheateHaiChongDuiXiaoMaiYingXiang.type == 2)
                    {
                        MessageBox.Show("没有数据!!");
                        return;
                    }
                    else if (wheateHaiChongDuiXiaoMaiYingXiang.type == 3)
                    {
                        ButMap3(but4, date);
                    }
                }

               

            }
            catch (Exception e1)
            {
                MessageBox.Show(e1.Message);
            }
        }

        private void LayoutRoot_load(object sender, RoutedEventArgs e)
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
            initDate();
        }

        private void tempComm_Changed(object sender, EventArgs e)
        {
            initDate();
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
