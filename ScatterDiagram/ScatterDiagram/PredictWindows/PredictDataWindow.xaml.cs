using System;
using System.Collections.ObjectModel;
using System.Linq;
using System.Windows;
using Infragistics.Controls.Charts;
using System.Windows.Input;
using DataMember;
using System.Windows.Shapes;
using System.Windows.Controls;
using System.Collections.Generic;
using System.Windows.Media;
using wheateWindow;
using ConvertData;
namespace ScatterDiagram.PredictWindows
{

    public partial class PredictDataWindow : Infragistics.Samples.Framework.SampleContainer
    {

        public PredictDataWindow()
        {
            InitializeComponent();

            model = (new DataSource("000051")).getMiaoShu();

            model1 = (new DataSource("000052")).getMiaoShu();

            model2 = (new DataSource("000053")).getMiaoShu();

            model3 = (new DataSource("000054")).getMiaoShu();
        }
        XiaoMaiDisplayModel model;

        XiaoMaiDisplayModel model1;

        XiaoMaiDisplayModel model2;

        XiaoMaiDisplayModel model3 ;
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
                if ((long)unscaledX > DateTime.MaxValue.Ticks ||(long)unscaledX < DateTime.MinValue.Ticks)
                {
                    return;
                }
                DateTime xDate = new DateTime((long)unscaledX);
                //DateTime xDate = new DateTime((int)unscaledX, 1, 1);

                this.CategoryXCoordinateTextBlock.Text = String.Format("{0:MM-dd}", xDate);
                this.CategoryYCoordinateTextBlock.Text = String.Format("{0:0.00}", unscaledY);

                textGrainY.Text = String.Format("{0:0.00}", unscaledY);
                textGrainDate.Text = String.Format("{0:MM-dd}", xDate);

                textCornY1.Text = String.Format("{0:0.00}", unscaledY);
                textCornDate.Text = String.Format("{0:MM-dd}", xDate);

                textRiceY2.Text = String.Format("{0:0.00}", unscaledY);
                textRiceDate.Text = String.Format("{0:MM-dd}", xDate);

                textTCCY3.Text = String.Format("{0:0.00}", unscaledY);
                textTCCDate.Text = String.Format("{0:MM-dd}", xDate);

            }
        } 

        private void ClickPredict(RadioButton but)
        {
            if (but == butCorn)
            {
                if (colCornPredict != null && colCornPredict.Visibility == Visibility.Hidden)
                {
                    
                    colCornPredict.Visibility = Visibility.Visible;

                    colRicePredict.Visibility = Visibility.Hidden;
                
                    colGrainPredict.Visibility = Visibility.Hidden;
                
                    colTCCPredict.Visibility = Visibility.Hidden;


                    labTitle.Content = "常温条件下当初始虫口密度为2头/kg时不同储存时间的储粮害虫谷蠹种群数量预测情况";
                    wheatePeatsZongQunHeader.miaoShu.Document = convertToBox.convertStringToFlowDocument(model1.chartMiaoShu);
                }
            }

            if (but == butRice)
            {
                if (colRicePredict != null && colRicePredict.Visibility == Visibility.Hidden)
                {
                   
                    colRicePredict.Visibility = Visibility.Visible;

                    colCornPredict.Visibility = Visibility.Hidden;

                    colGrainPredict.Visibility = Visibility.Hidden;

                    colTCCPredict.Visibility = Visibility.Hidden;

                    labTitle.Content = "常温条件下当初始虫口密度为2头/kg时不同储存时间的储粮害虫米象种群数量预测情况";
                    wheatePeatsZongQunHeader.miaoShu.Document =convertToBox.convertStringToFlowDocument( model2.chartMiaoShu);
                }

            }
            if (but == butGrain)
            {
                if (colGrainPredict != null && colGrainPredict.Visibility == Visibility.Hidden)
                {
               
                    colGrainPredict.Visibility = Visibility.Visible;

              
                    colCornPredict.Visibility = Visibility.Hidden;
                   
                    colRicePredict.Visibility = Visibility.Hidden;
                
                    colTCCPredict.Visibility = Visibility.Hidden;

                    labTitle.Content = "常温条件下当初始虫口密度为2头/kg时不同储存时间的储粮害虫玉米象种群数量预测情况";
                    wheatePeatsZongQunHeader.miaoShu.Document =convertToBox.convertStringToFlowDocument( model.chartMiaoShu);
                }
            }
            if (but == butTcc)
            {
                if (colTCCPredict != null && colTCCPredict.Visibility == Visibility.Hidden)
                {
                    
                    colTCCPredict.Visibility = Visibility.Visible;

                
                    colCornPredict.Visibility = Visibility.Hidden;
              
                    colRicePredict.Visibility = Visibility.Hidden;
              
                    colGrainPredict.Visibility = Visibility.Hidden;
                    labTitle.Content = "常温条件下当初始虫口密度为2头/kg时不同储存时间的储粮害虫赤拟谷盗种群数量预测情况";
                    wheatePeatsZongQunHeader.miaoShu.Document =convertToBox.convertStringToFlowDocument( model3.chartMiaoShu);
             
                }
            }
        }
        private void Button_Click(object sender, RoutedEventArgs e)
        {      
            RadioButton but = sender as RadioButton;
            butRice.IsChecked = false;
            butCorn.IsChecked = false;
            butGrain.IsChecked = false;
            butTcc.IsChecked = false;
            but.IsChecked = true;
          
            ClickPredict(but);  
            
             
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

            if (wheatePeatsZongQunHeader.predictIndex == 0)
            {
                dateSelect.IsEnabled = false;  
            }
            else if (wheatePeatsZongQunHeader.predictIndex == 1)
            {
                daySelect.IsEnabled = false;
            }

        }

        SplineSeries colGrainPredict = new SplineSeries();
        SplineSeries colCornPredict = new SplineSeries();
        SplineSeries colTCCPredict = new SplineSeries();
        SplineSeries colRicePredict = new SplineSeries();
        private void daySelect_Changed(object sender, EventArgs e)
        {
            
            int date;
            if (wheatePeatsZongQunHeader.predictIndex == 1)
            {
                return;
            }

            if (!this.IsLoaded)
            {
                return;
            }

            date = Convert.ToInt32(daySelect.SelectedItem);
            List<DataValue> Axis;
            DataSource yData;
            DataSource y1Data;
            DataSource y2Data;
            DataSource y3Data;
            List<DataValue> predictYData;
            List<DataValue> predictY1Data;
            List<DataValue> predictY2Data;
            List<DataValue> predictY3Data;

            try
            {
                 Axis = SelectData.getPredictData("000051", date);
                 yData = new DataSource("000051");
                 y1Data = new DataSource("000052");
                 y2Data = new DataSource("000053");
                 y3Data = new DataSource("000054");

                predictYData = SelectData.getPredictData("000051", date);
                predictY1Data = SelectData.getPredictData("000052", date);
                predictY2Data = SelectData.getPredictData("000053", date);
                predictY3Data = SelectData.getPredictData("000054", date);
         

            colGrainPredict.MarkerType = MarkerType.None;
            colGrainPredict.Thickness = 5;
            colGrainPredict.ItemsSource = predictYData;
            colGrainPredict.ValueMemberPath = "PredictData";
            colGrainPredict.XAxis = categoryDateAxis;
            colGrainPredict.YAxis = numericYAxis;
            colGrainPredict.Opacity = 0.5;
            colGrainPredict.Visibility = Visibility.Hidden;
            colGrainPredict.ToolTip = colGrain.ToolTip;
            colGrainPredict.Brush = new SolidColorBrush(Colors.Green);
            this.CategoryChart.Series.Add(colGrainPredict);

            colCornPredict.MarkerType = MarkerType.None;
            colCornPredict.Thickness = 5;
            colCornPredict.ItemsSource = predictY1Data;
            colCornPredict.ValueMemberPath = "PredictData";
            colCornPredict.XAxis = categoryDateAxis;
            colCornPredict.YAxis = numericYAxis;
            colCornPredict.Opacity = 0.5;
            colCornPredict.Visibility = Visibility.Hidden;
            colCornPredict.ToolTip = colCorn.ToolTip;
            colCornPredict.Brush = new SolidColorBrush(Colors.Black);
            this.CategoryChart.Series.Add(colCornPredict);


            colRicePredict.MarkerType = MarkerType.None;
            colRicePredict.Thickness = 5;
            colRicePredict.ItemsSource = predictY2Data;
            colRicePredict.ValueMemberPath = "PredictData";
            colRicePredict.XAxis = categoryDateAxis;
            colRicePredict.YAxis = numericYAxis;
            colRicePredict.Opacity = 0.5;
            colRicePredict.Visibility = Visibility.Hidden;
            colRicePredict.ToolTip = colRice.ToolTip;
            colRicePredict.Brush = new SolidColorBrush(Colors.Chocolate);
            this.CategoryChart.Series.Add(colRicePredict);


            colTCCPredict.MarkerType = MarkerType.None;
            colTCCPredict.Thickness = 5;
            colTCCPredict.ItemsSource = predictY3Data;
            colTCCPredict.ValueMemberPath = "PredictData";
            colTCCPredict.XAxis = categoryDateAxis;
            colTCCPredict.YAxis = numericYAxis;
            colTCCPredict.Opacity = 0.5;
            colTCCPredict.Visibility = Visibility.Hidden;
            colTCCPredict.ToolTip = colTCC.ToolTip;
            colTCCPredict.Brush = new SolidColorBrush(Colors.Blue);
            this.CategoryChart.Series.Add(colTCCPredict);

            categoryDateAxis.ItemsSource = Axis;
            colCorn.ItemsSource = y1Data;
            colRice.ItemsSource = y2Data;
            colGrain.ItemsSource = yData;
            colTCC.ItemsSource = y3Data;


            numericXAxis.MinimumValue = Convert.ToDouble(Axis[0].date.Ticks);
            numericXAxis.MaximumValue = Convert.ToDouble(Axis[Axis.Count-1].date.Ticks);

            double[] high = new double[8];
            high[0] = getMax(predictYData);
            high[1] = getMax(predictY1Data);
            high[2] = getMax(predictY2Data);
            high[3] = getMax(predictY3Data);


            numericYAxis.MaximumValue = SelectData.getHigh(high) + 5;

            //ClipLine.Value = yData.Count;
            ClipLine.Value = Convert.ToDouble((new DateTime(2015, 7, 17)).Ticks);
            }
            catch (Exception e1)
            {
                MessageBox.Show(e1.Message);
            }

            if (butCorn.IsChecked == true)
            {
                ClickPredict(butCorn);
            }
            else if (butGrain.IsChecked == true)
            {
                ClickPredict(butGrain);
            }
            else if (butRice.IsChecked == true)
            {
                ClickPredict(butRice);
            }
            else if (butTcc.IsChecked == true)
            {
                ClickPredict(butTcc);
            }
        }

        private void dateSelect_Changed(object sender, SelectionChangedEventArgs e)
        {

            initDate();
        }

        private void initDate()
        {
            int date;
            if (wheatePeatsZongQunHeader.predictIndex == 0)
            {
                return;
            }

            if (!this.IsLoaded)
            {
                return;
            }
            DateTime dateTime = (DateTime)dateSelect.SelectedDate;
            TimeSpan time = dateTime - (new DateTime(2015, 7, 17));
            date = time.Days;

            try
            {
                List<DataValue> Axis = SelectData.getPredictData("000051", date);
                DataSource yData = new DataSource("000051");
                DataSource y1Data = new DataSource("000052");
                DataSource y2Data = new DataSource("000053");
                DataSource y3Data = new DataSource("000054");

                List<DataValue> predictYData = SelectData.getPredictData("000051", date);
                List<DataValue> predictY1Data = SelectData.getPredictData("000052", date);
                List<DataValue> predictY2Data = SelectData.getPredictData("000053", date);
                List<DataValue> predictY3Data = SelectData.getPredictData("000054", date);



                colGrainPredict.MarkerType = MarkerType.None;
                colGrainPredict.Thickness = 5;
                colGrainPredict.ItemsSource = predictYData;
                colGrainPredict.ValueMemberPath = "PredictData";
                colGrainPredict.XAxis = categoryDateAxis;
                colGrainPredict.YAxis = numericYAxis;
                colGrainPredict.Opacity = 0.5;
                colGrainPredict.Visibility = Visibility.Hidden;
                colGrainPredict.Brush = new SolidColorBrush(Colors.Green);

                colGrainPredict.ToolTip = colGrain.ToolTip;
                this.CategoryChart.Series.Add(colGrainPredict);


                colCornPredict.MarkerType = MarkerType.None;
                colCornPredict.Thickness = 5;
                colCornPredict.ItemsSource = predictY1Data;
                colCornPredict.ValueMemberPath = "PredictData";
                colCornPredict.XAxis = categoryDateAxis;
                colCornPredict.YAxis = numericYAxis;
                colCornPredict.Opacity = 0.5;
                colCornPredict.Visibility = Visibility.Hidden;
                colCornPredict.Brush = new SolidColorBrush(Colors.Black);

                colCornPredict.ToolTip = colCorn.ToolTip;
                this.CategoryChart.Series.Add(colCornPredict);



                colRicePredict.MarkerType = MarkerType.None;
                colRicePredict.Thickness = 5;
                colRicePredict.ItemsSource = predictY2Data;
                colRicePredict.ValueMemberPath = "PredictData";
                colRicePredict.XAxis = categoryDateAxis;
                colRicePredict.YAxis = numericYAxis;
                colRicePredict.Opacity = 0.5;
                colRicePredict.Visibility = Visibility.Hidden;
                colRicePredict.Brush = new SolidColorBrush(Colors.Chocolate);

                colRicePredict.ToolTip = colRice.ToolTip;
                this.CategoryChart.Series.Add(colRicePredict);


                colTCCPredict.MarkerType = MarkerType.None;
                colTCCPredict.Thickness = 5;
                colTCCPredict.ItemsSource = predictY3Data;
                colTCCPredict.ValueMemberPath = "PredictData";
                colTCCPredict.XAxis = categoryDateAxis;
                colTCCPredict.YAxis = numericYAxis;
                colTCCPredict.Opacity = 0.5;
                colTCCPredict.Visibility = Visibility.Hidden;
                colTCCPredict.Brush = new SolidColorBrush(Colors.Blue);

                colTCCPredict.ToolTip = colTCC.ToolTip;
                this.CategoryChart.Series.Add(colTCCPredict);


                categoryDateAxis.ItemsSource = Axis;
                colCorn.ItemsSource = y1Data;
                colRice.ItemsSource = y2Data;
                colGrain.ItemsSource = yData;
                colTCC.ItemsSource = y3Data;


                numericXAxis.MinimumValue = Convert.ToDouble(Axis[0].date.Ticks);
                numericXAxis.MaximumValue = Convert.ToDouble(Axis[Axis.Count - 1].date.Ticks);

                double[] high = new double[8];
                high[0] = getMax(predictYData);
                high[1] = getMax(predictY1Data);
                high[2] = getMax(predictY2Data);
                high[3] = getMax(predictY3Data);


                numericYAxis.MaximumValue = SelectData.getHigh(high) + 5;

                //ClipLine.Value = yData.Count;
                ClipLine.Value = Convert.ToDouble((new DateTime(2015, 7, 17)).Ticks);
            }
            catch (Exception e1)
            {
                MessageBox.Show(e1.Message);
            }

            if (butCorn.IsChecked == true)
            {
                ClickPredict(butCorn);
            }
            else if (butGrain.IsChecked == true)
            {
                ClickPredict(butGrain);
            }
            else if (butRice.IsChecked == true)
            {
                ClickPredict(butRice);
            }
            else if (butTcc.IsChecked == true)
            {
                ClickPredict(butTcc);
            }
        }

        private void LayoutRoot_load(object sender, RoutedEventArgs e)
        {
            initDate();
        }
    }
}
