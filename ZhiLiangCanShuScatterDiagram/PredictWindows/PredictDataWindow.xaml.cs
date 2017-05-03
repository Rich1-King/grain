using System;
using System.Collections.ObjectModel;
using System.Linq;
using System.Windows;
using Infragistics.Controls.Charts;
using System.Windows.Input;
using ZhiLiangCanShuDataMember;
using System.Windows.Shapes;
using System.Windows.Controls;
using System.Collections.Generic;
using System.Windows.Media;
using wheateWindow;
using ConvertData;

namespace ZhiLiangCanShuScatterDiagram.PredictWindows
{

    public partial class PredictDataWindow : Page
    {
        public PredictDataWindow()
        {
            InitializeComponent();   
        }

        XiaoMaiDisplayModel model;
        ConvertStringToRichTextBox convertToBox = new ConvertStringToRichTextBox();
        private void OnCategoryChartMouseMove(object sender, MouseEventArgs e)
        {
            DataSource data = new DataSource();
            var series1 = this.CategoryChart.Series.FirstOrDefault();

            if (series1 == null) return;

            var position = e.GetPosition(series1);

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

                if ((long)unscaledX < DateTime.MinValue.Ticks || (long)unscaledY > DateTime.MaxValue.Ticks)
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

        public void ButMap(RadioButton but,int date)
        {
            if (but == But11)
            {
                if (Convert.ToDouble(comBoxTemp.SelectedItem) == 20)
                {
                    Data = new DataSource("000025");
                    predictData = getPredictData("000025",date);
                }
                else if (Convert.ToDouble(comBoxTemp.SelectedItem) == 25)
                {
                    Data = new DataSource("000026");
                    predictData = getPredictData("000026",date);
                }
                else if (Convert.ToDouble(comBoxTemp.SelectedItem) == 27.5)
                {
                    Data = new DataSource("000027");
                    predictData = getPredictData("000027",date);
                }
                else if (Convert.ToDouble(comBoxTemp.SelectedItem) == 30)
                {
                    Data = new DataSource("000028");
                    predictData = getPredictData("000028",date);
                }
            }
            if (but == But12)
            {
                if (Convert.ToDouble(comBoxTemp.SelectedItem) == 20)
                {
                    Data = new DataSource("000029");
                    predictData = getPredictData("000029",date);
                }
                else if (Convert.ToDouble(comBoxTemp.SelectedItem) == 25)
                {
                    Data = new DataSource("000030");
                    predictData = getPredictData("000030",date);
                }
                else if (Convert.ToDouble(comBoxTemp.SelectedItem) == 27.5)
                {
                    Data = new DataSource("000031");
                    predictData = getPredictData("000031",date);
                }
                else if (Convert.ToDouble(comBoxTemp.SelectedItem) == 30)
                {
                    Data = new DataSource("000032");
                    predictData = getPredictData("000032",date);
                }
            }
            if (but == But13)
            {
                if (Convert.ToDouble(comBoxTemp.SelectedItem) == 20)
                {
                    Data = new DataSource("000033");
                    predictData = getPredictData("000033",date);
                }
                else if (Convert.ToDouble(comBoxTemp.SelectedItem) == 25)
                {
                    Data = new DataSource("000034");
                    predictData = getPredictData("000034",date);
                }
                else if (Convert.ToDouble(comBoxTemp.SelectedItem) == 27.5)
                {
                    Data = new DataSource("000035");
                    predictData = getPredictData("000035", date);
                }
                else if (Convert.ToDouble(comBoxTemp.SelectedItem) == 30)
                {
                    Data = new DataSource("000036");
                    predictData = getPredictData("000036", date);
                }
            }
            model = Data.getMiaoShu();
            wheateZhiLiangTeXingHeader.miaoShu.Document = convertToBox.convertStringToFlowDocument(model.chartMiaoShu) ;
            labelY.Content = "不\n完\n善\n度\n(\n%\n)";
            numericYAxis.MinimumValue = 2;
            numericYAxis.MaximumValue = 4;
            numericYAxis.Interval = 0.2;
            text.Content = "不完善度";

            labTitle.Content = "储藏过程中小麦不完善度的预测情况";

            colPredict.MarkerType = MarkerType.None;
            colPredict.Thickness = 5;
            colPredict.ItemsSource = predictData;
            colPredict.ValueMemberPath = "PredictData";
            colPredict.XAxis = categoryDateAxis;
            colPredict.YAxis = numericYAxis;
            colPredict.Opacity = 0.5;
            colPredict.Visibility = Visibility.Visible;
            colPredict.ToolTip = col.ToolTip;
           // lableName.Text = "不完善度:";
            colPredict.Brush = new SolidColorBrush(Colors.Green);
            this.CategoryChart.Series.Add(colPredict);

            numericXAxis.MinimumValue = predictData[0].date.Ticks;
            numericXAxis.MaximumValue = predictData[predictData.Count-1].date.Ticks;
     
            ClipLine.Value = Data[0].EndTime.Ticks;
            categoryDateAxis.ItemsSource = predictData;
            numericYAxis.Interval = 0.2;
         
 
        }
        public void ButMap2(RadioButton but,int date)
        {
            if (but == But11)
            {
                if (Convert.ToDouble(comBoxTemp.SelectedItem) == 20)
                {
                    Data = new DataSource("000013");

                    predictData = getPredictData("000013", date);


                }
                else if (Convert.ToDouble(comBoxTemp.SelectedItem) == 25)
                {
                    Data = new DataSource("000014");
                    predictData = getPredictData("000014", date);
                }
                else if (Convert.ToDouble(comBoxTemp.SelectedItem) == 27.5)
                {
                    Data = new DataSource("000015");
                    predictData = getPredictData("000015", date);
                }
                else if (Convert.ToDouble(comBoxTemp.SelectedItem) == 30)
                {
                    Data = new DataSource("000016");
                    predictData = getPredictData("000016", date);
                }
            }
            if (but == But12)
            {

                if (Convert.ToDouble(comBoxTemp.SelectedItem) == 20)
                {
                    Data = new DataSource("000017");

                    predictData = getPredictData("000017", date);


                }
                else if (Convert.ToDouble(comBoxTemp.SelectedItem) == 25)
                {
                    Data = new DataSource("000018");
                    predictData = getPredictData("000018", date);
                }
                else if (Convert.ToDouble(comBoxTemp.SelectedItem) == 27.5)
                {
                    Data = new DataSource("000019");
                    predictData = getPredictData("000019", date);
                }
                else if (Convert.ToDouble(comBoxTemp.SelectedItem) == 30)
                {
                    Data = new DataSource("000020");
                    predictData = getPredictData("000020", date);
                }
            }
            if (but == But13)
            {

                if (Convert.ToDouble(comBoxTemp.SelectedItem) == 20)
                {
                    Data = new DataSource("000021");

                    predictData = getPredictData("000021", date);


                }
                else if (Convert.ToDouble(comBoxTemp.SelectedItem) == 25)
                {
                    Data = new DataSource("000022");
                    predictData = getPredictData("000022", date);
                }
                else if (Convert.ToDouble(comBoxTemp.SelectedItem) == 27.5)
                {
                    Data = new DataSource("000023");
                    predictData = getPredictData("000023", date);
                }
                else if (Convert.ToDouble(comBoxTemp.SelectedItem) == 30)
                {
                    Data = new DataSource("000024");
                    predictData = getPredictData("000024", date);
                }
            }
            model = Data.getMiaoShu();
            wheateZhiLiangTeXingHeader.miaoShu.Document = convertToBox.convertStringToFlowDocument(model.chartMiaoShu);
            labelY.Content = "脂\n肪\n酸\n值\n(\n%\n)";
            numericYAxis.MinimumValue = 25;
            numericYAxis.MaximumValue = 40;
            numericYAxis.Interval = 2;
            text.Content = "脂肪酸值";

           // col.ItemsSource = Data;
           // col.Visibility = Visibility.Visible;
           // textName.Text = Data[0].yLable;
           // water.Content = Data[0].Water;
            //temp.Content = Data[0].GrainTemp;
            labTitle.Content = "储藏过程中小麦脂肪酸的预测情况";

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
            //categoryXAxis.ItemsSource = predictData;

            numericXAxis.MinimumValue = predictData[0].date.Ticks;
            numericXAxis.MaximumValue = predictData[predictData.Count-1].date.Ticks;
            //textTime.Text = String.Format("{0:yyyy-MM-dd}", predictData[predictData.Count - 1].date);
            ClipLine.Value = Data[0].EndTime.Ticks;
 
        
        }

        public void ButMap3(RadioButton but,int date)
        {
              if (but == But11)
            {
                if (Convert.ToDouble(comBoxTemp.SelectedItem) == 20)
                {
                    Data = new DataSource("000001");

                    predictData = getPredictData("000001", date);


                }
                else if (Convert.ToDouble(comBoxTemp.SelectedItem) == 25)
                {
                    Data = new DataSource("000002");
                    predictData = getPredictData("000002", date);
                }
                else if (Convert.ToDouble(comBoxTemp.SelectedItem) == 27.5)
                {
                    Data = new DataSource("000003");
                    predictData = getPredictData("000003", date);
                }
                else if (Convert.ToDouble(comBoxTemp.SelectedItem) == 30)
                {
                    Data = new DataSource("000004");
                    predictData = getPredictData("000004", date);
                }
            }
            if (but == But12)
            {

                if (Convert.ToDouble(comBoxTemp.SelectedItem) == 20)
                {
                    Data = new DataSource("000005");

                    predictData = getPredictData("000005", date);


                }
                else if (Convert.ToDouble(comBoxTemp.SelectedItem) == 25)
                {
                    Data = new DataSource("000006");
                    predictData = getPredictData("000006", date);
                }
                else if (Convert.ToDouble(comBoxTemp.SelectedItem) == 27.5)
                {
                    Data = new DataSource("000007");
                    predictData = getPredictData("000007", date);
                }
                else if (Convert.ToDouble(comBoxTemp.SelectedItem) == 30)
                {
                    Data = new DataSource("000008");
                    predictData = getPredictData("000008", date);
                }
            }
            if (but == But13)
            {

                if (Convert.ToDouble(comBoxTemp.SelectedItem) == 20)
                {
                    Data = new DataSource("000009");

                    predictData = getPredictData("000009", date);


                }
                else if (Convert.ToDouble(comBoxTemp.SelectedItem) == 25)
                {
                    Data = new DataSource("000010");
                    predictData = getPredictData("000010", date);
                }
                else if (Convert.ToDouble(comBoxTemp.SelectedItem) == 27.5)
                {
                    Data = new DataSource("000011");
                    predictData = getPredictData("000011", date);
                }
                else if (Convert.ToDouble(comBoxTemp.SelectedItem) == 30)
                {
                    Data = new DataSource("000012");
                    predictData = getPredictData("000012", date);
                }
            }

            model = Data.getMiaoShu();
            wheateZhiLiangTeXingHeader.miaoShu.Document = convertToBox.convertStringToFlowDocument(model.chartMiaoShu);
            labelY.Content = "面\n筋\n吸\n水\n率\n(\n%\n)";
            numericYAxis.MinimumValue = 185;
            numericYAxis.MaximumValue = 210;
            numericYAxis.Interval = 2;
            text.Content = "面筋吸水率";

            //col.ItemsSource = Data;
           // col.Visibility = Visibility.Visible;
            //textName.Text = Data[0].yLable;
            //water.Content = Data[0].Water;
            //temp.Content = Data[0].GrainTemp;
            labTitle.Content = "储藏过程中小麦面筋吸水率的预测情况";

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


        }

        DataSource Data;
        List<DataValue> predictData;
        private void Button_Click(object sender, RoutedEventArgs e)
        {
            RadioButton but = sender as RadioButton;
            But11.IsChecked = false;
            But12.IsChecked = false;
            But13.IsChecked = false;
            but.IsChecked = true;
            initDate();      
        }

        private void initDate()
        {
            if (!this.IsLoaded)
            {
                return;
            }

            int date;
            if (wheateZhiLiangTeXingHeader.predictNum == 1)
            {
                date = Convert.ToInt32(daySelect.SelectedItem);
            }
            else if (wheateZhiLiangTeXingHeader.predictNum == 2)
            {
                DateTime dateTime = (DateTime)dateSelect.SelectedDate;
                TimeSpan time;
                try
                {
                     time = dateTime - (new DateTime(2015, 1, 1));
                }
                catch (Exception)
                {
                    MessageBox.Show("时间选择不正确!!");
                    return;
                }
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

         
                if (But11.IsChecked == true)
                {
                    if (wheateZhiLiangTeXingHeader.type == 1)
                    {
                        ButMap(But11, date);
                    }
                    else if (wheateZhiLiangTeXingHeader.type == 2)
                    {
                        ButMap2(But11, date);
                    }
                    else if (wheateZhiLiangTeXingHeader.type == 3)
                    {
                        ButMap3(But11, date);
                    }
                }
                else if (But12.IsChecked == true)
                {

                    if (wheateZhiLiangTeXingHeader.type == 1)
                    {
                        ButMap(But12, date);
                    }
                    else if (wheateZhiLiangTeXingHeader.type == 2)
                    {
                        ButMap2(But12, date);
                    }
                    else if (wheateZhiLiangTeXingHeader.type == 3)
                    {
                        ButMap3(But12, date);
                    }
                }
                else if (But13.IsChecked == true)
                {

                    if (wheateZhiLiangTeXingHeader.type == 1)
                    {
                        ButMap(But13, date);
                    }
                    else if (wheateZhiLiangTeXingHeader.type == 2)
                    {
                        ButMap2(But13, date);
                    }
                    else if (wheateZhiLiangTeXingHeader.type == 3)
                    {
                        ButMap3(But13, date);
                    }
                }
                else 
                {  
                     MessageBox.Show("没有数据!!");
                     return;
                }
            
           


        }

        public List<DataValue> getPredictData(String shiYanNumber,int date)
        {

           return SelectData.getPredictData(shiYanNumber, date);
 
        }

        SplineSeries colPredict = new SplineSeries();
        private void Grid_Loaded(object sender, RoutedEventArgs e)
        {
            List<int> num = new List<int>();
            for (int i = 0; i <= 30; i++)
            {
                num.Add(i);
            }
            daySelect.ItemsSource = num;

            List<double> temp = new List<double>();
            temp.Add(20);
            temp.Add(25);
            temp.Add(27.5);
            temp.Add(30);
            comBoxTemp.ItemsSource = temp;

                labelY.Content = "不\n完\n善\n度\n(\n%\n)";
                numericYAxis.MinimumValue = 2;
                numericYAxis.MaximumValue = 4;
                numericYAxis.Interval = 0.2;
                text.Content = "不完善度";
                initDate();
        }

        private void JiaZaiData_Loaded(object sender, RoutedEventArgs e)
        {
           
        }

        private void comBoxTemp_load(object sender, RoutedEventArgs e)
        {      
           
        }

        private void comBoxTemp_Change(object sender, SelectionChangedEventArgs e)
        {
            initDate();
        }

        private void daySelect_Changed(object sender, EventArgs e)
        {
            initDate();
        }

        private void DayOrDate_Load(object sender, RoutedEventArgs e)
        {

            if (wheateZhiLiangTeXingHeader.predictNum == 1)
            {
                dateSelect.IsEnabled = false;
               
            }
            else if (wheateZhiLiangTeXingHeader.predictNum == 2)
            {
                daySelect.IsEnabled = false;
            }

        }

        private void dateSelect_Changed(object sender, SelectionChangedEventArgs e)
        {
            initDate();
        }
    }
}
