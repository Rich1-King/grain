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

    public partial class PredictDataWindow2 : Page
    {

        public PredictDataWindow2()
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

                DateTime xDate = new DateTime((long)unscaledX);
                //DateTime xDate = new DateTime((int)unscaledX, 1, 1);
              
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

                    predictData = getPredictData("000025",date);
                    model = (new DataSource("000025")).getMiaoShu();

                }
                else if (Convert.ToDouble(comBoxTemp.SelectedItem) == 25)
                {

                    predictData = getPredictData("000026", date);
                    model = (new DataSource("000026")).getMiaoShu();

                }
                else if (Convert.ToDouble(comBoxTemp.SelectedItem) == 27.5)
                {

                    predictData = getPredictData("000027", date);
                    model = (new DataSource("000027")).getMiaoShu();
                }
                else if (Convert.ToDouble(comBoxTemp.SelectedItem) == 30)
                {

                    predictData = getPredictData("000028", date);
                    model = (new DataSource("000028")).getMiaoShu();
                }
            }
            if (but == But12)
            {
                if (Convert.ToDouble(comBoxTemp.SelectedItem) == 20)
                {

                    predictData = getPredictData("000029", date);
                    model = (new DataSource("000029")).getMiaoShu();
                }
                else if (Convert.ToDouble(comBoxTemp.SelectedItem) == 25)
                {

                    predictData = getPredictData("000030", date);
                    model = (new DataSource("000030")).getMiaoShu();
                }
                else if (Convert.ToDouble(comBoxTemp.SelectedItem) == 27.5)
                {

                    predictData = getPredictData("000031", date);
                    model = (new DataSource("000031")).getMiaoShu();
                }
                else if (Convert.ToDouble(comBoxTemp.SelectedItem) == 30)
                {

                    predictData = getPredictData("000032", date);
                    model = (new DataSource("000032")).getMiaoShu();
                }
            }
            if (but == But13)
            {
                if (Convert.ToDouble(comBoxTemp.SelectedItem) == 20)
                {

                    predictData = getPredictData("000033", date);
                    model = (new DataSource("000033")).getMiaoShu();
                }
                else if (Convert.ToDouble(comBoxTemp.SelectedItem) == 25)
                {

                    predictData = getPredictData("000034", date);
                    model = (new DataSource("000034")).getMiaoShu();
                }
                else if (Convert.ToDouble(comBoxTemp.SelectedItem) == 27.5)
                {

                    predictData = getPredictData("000035", date);
                    model = (new DataSource("000035")).getMiaoShu();
                }
                else if (Convert.ToDouble(comBoxTemp.SelectedItem) == 30)
                {

                    predictData = getPredictData("000036", date);
                    model = (new DataSource("000036")).getMiaoShu();
                }
            }
            wheateZhiLiangTeXingHeader.miaoShu.Document = convertToBox.convertStringToFlowDocument(model.chartMiaoShu);
            labelY.Content = "不\n完\n善\n度\n(\n%\n)";
            numericYAxis.MinimumValue = 2;
            numericYAxis.MaximumValue = 4;
            numericYAxis.Interval = 0.2;
            text.Content = "不完善度";

            col.ItemsSource = predictData;
            col.Visibility = Visibility.Visible;
            //textName.Text = predictData[0].yLable;
            //water.Text = Convert.ToString(predictData[0].Water);
            //temp.Text = Convert.ToString(predictData[0].GrainTemp);
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
            colPredict.Brush = new SolidColorBrush(Colors.Green);
            this.CategoryChart.Series.Add(colPredict);


            numericXAxis.MinimumValue = predictData[0].date.Ticks;
            numericXAxis.MaximumValue = predictData[predictData.Count - 1].date.Ticks;
 
            ClipLine.Value = predictData[date-1].date.Ticks;
            moveLine.Value = predictData[date-1].date.Ticks;
            categoryDateAxis.ItemsSource = predictData;

            textChaZhi.Text = string.Format("{0:MM-dd}", predictData[date-1].date);
            //textTime.Text = string.Format("{0:yyyy-MM-dd}", predictData[date-1].date);



        }
        public void ButMap2(RadioButton but,int date)
        {
            if (but == But11)
            {
                if (Convert.ToDouble(comBoxTemp.SelectedItem) == 20)
                {
          

                    predictData = getPredictData("000013", date);
                    model = (new DataSource("000013")).getMiaoShu();


                }
                else if (Convert.ToDouble(comBoxTemp.SelectedItem) == 25)
                {
                 
                    predictData = getPredictData("000014", date);
                    model = (new DataSource("000014")).getMiaoShu();
                }
                else if (Convert.ToDouble(comBoxTemp.SelectedItem) == 27.5)
                {
                  
                    predictData = getPredictData("000015", date);
                    model = (new DataSource("000015")).getMiaoShu();
                }
                else if (Convert.ToDouble(comBoxTemp.SelectedItem) == 30)
                {
                
                    predictData = getPredictData("000016", date);
                    model = (new DataSource("000016")).getMiaoShu();
                }
            }
            if (but == But12)
            {

                if (Convert.ToDouble(comBoxTemp.SelectedItem) == 20)
                {
           

                    predictData = getPredictData("000017", date);
                    model = (new DataSource("000017")).getMiaoShu();


                }
                else if (Convert.ToDouble(comBoxTemp.SelectedItem) == 25)
                {
            
                    predictData = getPredictData("000018", date);
                    model = (new DataSource("000018")).getMiaoShu();
                }
                else if (Convert.ToDouble(comBoxTemp.SelectedItem) == 27.5)
                {
              
                    predictData = getPredictData("000019", date);
                    model = (new DataSource("000019")).getMiaoShu();
                }
                else if (Convert.ToDouble(comBoxTemp.SelectedItem) == 30)
                {
                    predictData = getPredictData("000020", date);
                    model = (new DataSource("000020")).getMiaoShu();
                }
            }
            if (but == But13)
            {

                if (Convert.ToDouble(comBoxTemp.SelectedItem) == 20)
                {
                    predictData = getPredictData("000021", date);
                    model = (new DataSource("000021")).getMiaoShu();

                }
                else if (Convert.ToDouble(comBoxTemp.SelectedItem) == 25)
                {
            
                    predictData = getPredictData("000022", date);
                    model = (new DataSource("000022")).getMiaoShu();
                }
                else if (Convert.ToDouble(comBoxTemp.SelectedItem) == 27.5)
                {
           
                    predictData = getPredictData("000023", date);
                    model = (new DataSource("000023")).getMiaoShu();
                }
                else if (Convert.ToDouble(comBoxTemp.SelectedItem) == 30)
                {
             
                    predictData = getPredictData("000024", date);
                    model = (new DataSource("000024")).getMiaoShu();
                }
            }
            wheateZhiLiangTeXingHeader.miaoShu.Document = convertToBox.convertStringToFlowDocument(model.chartMiaoShu);
            labelY.Content = "脂\n肪\n酸\n值\n(\n%\n)";
            numericYAxis.MinimumValue = 25;
            numericYAxis.MaximumValue = 40;
            numericYAxis.Interval = 2;
            text.Content = "脂肪酸值";

            col.ItemsSource = predictData;
            col.Visibility = Visibility.Visible;
            //textName.Text = predictData[0].yLable;
            //water.Text = Convert.ToString(predictData[0].Water);
            //temp.Text = Convert.ToString(predictData[0].GrainTemp);
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

            numericXAxis.MinimumValue = predictData[0].date.Ticks;
            numericXAxis.MaximumValue = predictData[predictData.Count - 1].date.Ticks;
  
            ClipLine.Value = predictData[date - 1].date.Ticks;
            moveLine.Value = predictData[date - 1].date.Ticks;
            categoryDateAxis.ItemsSource = predictData;

            textChaZhi.Text = string.Format("{0:MM-dd}", predictData[date - 1].date);
            //textTime.Text = string.Format("{0:yyyy-MM-dd}", predictData[date - 1].date);
  


        }

        public void ButMap3(RadioButton but,int date)
        {
            if (but == But11)
            {
                if (Convert.ToDouble(comBoxTemp.SelectedItem) == 20)
                {
                    predictData = getPredictData("000001", date);
                    model = (new DataSource("000001")).getMiaoShu();


                }
                else if (Convert.ToDouble(comBoxTemp.SelectedItem) == 25)
                {
           
                    predictData = getPredictData("000002", date);
                    model = (new DataSource("000002")).getMiaoShu();
                }
                else if (Convert.ToDouble(comBoxTemp.SelectedItem) == 27.5)
                {
            
                    predictData = getPredictData("000004", date);
                    model = (new DataSource("000004")).getMiaoShu();
                }
                else if (Convert.ToDouble(comBoxTemp.SelectedItem) == 30)
                {
          
                    predictData = getPredictData("000006", date);
                    model = (new DataSource("000006")).getMiaoShu();
                }
            }
            if (but == But12)
            {

                if (Convert.ToDouble(comBoxTemp.SelectedItem) == 20)
                {
     

                    predictData = getPredictData("000007", date);
                    model = (new DataSource("000007")).getMiaoShu();


                }
                else if (Convert.ToDouble(comBoxTemp.SelectedItem) == 25)
                {
        
                    predictData = getPredictData("000008", date);
                    model = (new DataSource("000008")).getMiaoShu();
                }
                else if (Convert.ToDouble(comBoxTemp.SelectedItem) == 27.5)
                {

                    predictData = getPredictData("000009", date);
                    model = (new DataSource("000009")).getMiaoShu();
                }
                else if (Convert.ToDouble(comBoxTemp.SelectedItem) == 30)
                {
          
                    predictData = getPredictData("000010", date);
                    model = (new DataSource("000010")).getMiaoShu();
                }
            }
            if (but == But13)
            {

                if (Convert.ToDouble(comBoxTemp.SelectedItem) == 20)
                {
                

                    predictData = getPredictData("000011", date);
                    model = (new DataSource("000011")).getMiaoShu();


                }
                else if (Convert.ToDouble(comBoxTemp.SelectedItem) == 25)
                {
                    
                    predictData = getPredictData("000012", date);
                    model = (new DataSource("000012")).getMiaoShu();
                }
                else if (Convert.ToDouble(comBoxTemp.SelectedItem) == 27.5)
                {
                 
                    predictData = getPredictData("000013", date);
                    model = (new DataSource("000013")).getMiaoShu();
                }
                else if (Convert.ToDouble(comBoxTemp.SelectedItem) == 30)
                {
                   
                    predictData = getPredictData("000014", date);
                    model = (new DataSource("000014")).getMiaoShu();
                }
            }

            wheateZhiLiangTeXingHeader.miaoShu.Document = convertToBox.convertStringToFlowDocument(model.chartMiaoShu);
            labelY.Content = "面\n筋\n吸\n水\n率\n(\n%\n)";
            numericYAxis.MinimumValue = 185;
            numericYAxis.MaximumValue = 210;
            numericYAxis.Interval = 2;
            text.Content = "面筋吸水率";

            col.ItemsSource = predictData;
            col.Visibility = Visibility.Visible;
           // textName.Text = predictData[0].yLable;
           // water.Text = Convert.ToString(predictData[0].Water);
            //temp.Text = Convert.ToString(predictData[0].GrainTemp);
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

            numericXAxis.MinimumValue = predictData[0].date.Ticks;
            numericXAxis.MaximumValue = predictData[predictData.Count - 1].date.Ticks;


            ClipLine.Value = predictData[date - 1].date.Ticks;
            moveLine.Value = predictData[date - 1].date.Ticks;
            categoryDateAxis.ItemsSource = predictData;

            textChaZhi.Text = string.Format("{0:MM-dd}", predictData[date - 1].date);
           // textTime.Text = string.Format("{0:yyyy-MM-dd}", predictData[date - 1].date);


        }
        private void Button_Click(object sender, RoutedEventArgs e)
        {
            RadioButton but = sender as RadioButton;
            But11.IsChecked = false;
            But12.IsChecked = false;
            But13.IsChecked = false;
            but.IsChecked = true;
            initDate(but);
        }

        private void initDate(RadioButton but)
        {

            int date;

            if (!this.IsLoaded)
            {
                return;
            }
           // MessageBox.Show(daySelect.SelectedIndex.ToString());
            date = Convert.ToInt32(daySelect.SelectedItem);

            if (wheateZhiLiangTeXingHeader.type == 1)
            {
                ButMap(but,date);
            }
            else if (wheateZhiLiangTeXingHeader.type == 2)
            {
                ButMap2(but,date);
            }
            else if (wheateZhiLiangTeXingHeader.type == 3)
            {
                ButMap3(but, date);
            }
            else
            {
                MessageBox.Show("初始化失败!!");
            }
        }

        public List<DataValue> getPredictData(String shiYanNumber,int date)
        {
           
            return SelectData.getLagPredictValue(shiYanNumber, date);

        }

        SplineSeries colPredict = new SplineSeries();
        List<DataValue> predictData = null;

        private void Grid_Loaded(object sender, RoutedEventArgs e)
        {
            List<int> day = new List<int>();
            int num = 365;
            for (int i = 1; i <= num; i++)
            {
                day.Add(i);
            }

            daySelect.ItemsSource = day;

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
            initDate(But11);
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

        private void moveLine_MouseEnter(object sender, MouseEventArgs e)
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

        private void JiaZaiData_Loaded(object sender, RoutedEventArgs e)
        {
           
        }

        private void daySelect_Changed(object sender, EventArgs e)
        {
            if (But11.IsChecked == true)
            {
                initDate(But11);
            }
            else if (But12.IsChecked == true)
            {
                initDate(But12);
            }
            else if (But13.IsChecked == true)
            {
                initDate(But13);
            }
        }

        private void comBoxTemp_load(object sender, RoutedEventArgs e)
        {
           
        }

        private void comBoxTemp_Change(object sender, SelectionChangedEventArgs e)
        {
            if (But11.IsChecked == true)
            {
                initDate(But11);
            }
            else if (But12.IsChecked == true)
            {
                initDate(But12);
            }
            else if (But13.IsChecked == true)
            {
                initDate(But13);
            }
        }
    } 
}
