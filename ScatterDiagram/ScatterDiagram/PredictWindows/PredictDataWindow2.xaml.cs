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

    public partial class PredictDataWindow2 : Infragistics.Samples.Framework.SampleContainer
    {

        public PredictDataWindow2()
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

        XiaoMaiDisplayModel model3;
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
                if (colCorn != null && colCorn.Visibility == Visibility.Visible)
                {
                    foreach (DataValue data1 in predictY1Data)
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
                else if (colGrain != null && colGrain.Visibility == Visibility.Visible)
                {
                    foreach (DataValue data1 in predictYData)
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
                else if (colTCC != null && colTCC.Visibility == Visibility.Visible)
                {
                    foreach (DataValue data1 in predictY3Data)
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
                else if (colRice != null && colRice.Visibility == Visibility.Visible)
                {
                    foreach (DataValue data1 in predictY2Data)
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

        private void Click(RadioButton but)
        {
            if (but == butCorn)
            {
                if (colCorn != null)
                {
                    colCorn.Visibility = Visibility.Visible;
                    colCornPredict.Visibility = Visibility.Visible;

                    colRice.Visibility = Visibility.Hidden;
                    colRicePredict.Visibility = Visibility.Hidden;
                    colGrain.Visibility = Visibility.Hidden;
                    colGrainPredict.Visibility = Visibility.Hidden;
                    colTCC.Visibility = Visibility.Hidden;
                    colTCCPredict.Visibility = Visibility.Hidden;

                    labTitle.Content = "常温条件下当初始虫口密度为2头/kg时不同储存时间的储粮害虫谷蠹种群数量预测情况";
                    wheatePeatsZongQunHeader.miaoShu.Document = convertToBox.convertStringToFlowDocument(model1.chartMiaoShu);

                }
            }

            if (but == butRice)
            {
                if (colRice != null)
                {
                    colRice.Visibility = Visibility.Visible;
                    colRicePredict.Visibility = Visibility.Visible;

                    colCorn.Visibility = Visibility.Hidden;
                    colCornPredict.Visibility = Visibility.Hidden;
                    colGrain.Visibility = Visibility.Hidden;
                    colGrainPredict.Visibility = Visibility.Hidden;
                    colTCC.Visibility = Visibility.Hidden;
                    colTCCPredict.Visibility = Visibility.Hidden;

                    labTitle.Content = "常温条件下当初始虫口密度为2头/kg时不同储存时间的储粮害虫米象种群数量预测情况";
                    wheatePeatsZongQunHeader.miaoShu.Document = convertToBox.convertStringToFlowDocument( model2.chartMiaoShu);
                }

            }
            if (but == butGrain)
            {
                if (colGrain != null)
                {
                    colGrain.Visibility = Visibility.Visible;
                    colGrainPredict.Visibility = Visibility.Visible;

                    colCorn.Visibility = Visibility.Hidden;
                    colCornPredict.Visibility = Visibility.Hidden;
                    colRice.Visibility = Visibility.Hidden;
                    colRicePredict.Visibility = Visibility.Hidden;
                    colTCC.Visibility = Visibility.Hidden;
                    colTCCPredict.Visibility = Visibility.Hidden;

                    labTitle.Content = "常温条件下当初始虫口密度为2头/kg时不同储存时间的储粮害虫玉米象种群数量预测情况";
                    wheatePeatsZongQunHeader.miaoShu.Document = convertToBox.convertStringToFlowDocument(model.chartMiaoShu);
                }
            }
            if (but == butTcc)
            {
                if (colTCC != null && colTCC.Visibility == Visibility.Hidden)
                {
                    colTCC.Visibility = Visibility.Visible;
                    colTCCPredict.Visibility = Visibility.Visible;

                    colCorn.Visibility = Visibility.Hidden;
                    colCornPredict.Visibility = Visibility.Hidden;
                    colRice.Visibility = Visibility.Hidden;
                    colRicePredict.Visibility = Visibility.Hidden;
                    colGrain.Visibility = Visibility.Hidden;
                    colGrainPredict.Visibility = Visibility.Hidden;
                    labTitle.Content = "常温条件下当初始虫口密度为2头/kg时不同储存时间的储粮害虫赤拟谷盗种群数量预测情况";
                    wheatePeatsZongQunHeader.miaoShu.Document = convertToBox.convertStringToFlowDocument(model3.chartMiaoShu);
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
            Click(but);
        }

        SplineSeries colGrainPredict = new SplineSeries();
        SplineSeries colCornPredict = new SplineSeries();
        SplineSeries colTCCPredict = new SplineSeries();
        SplineSeries colRicePredict = new SplineSeries();

        List<DataValue> predictYData = null;
        List<DataValue> predictY1Data = null;
        List<DataValue> predictY2Data = null;
        List<DataValue> predictY3Data = null;

        public double getMax(List<DataValue> datapoint,string str)
        {
            double[] dataPredict = new double[datapoint.Count];
            double[] dataValue = new double[datapoint.Count];
            for (int i = 0; i < datapoint.Count; i++)
            {
                dataPredict[i] = datapoint[i].PredictData;
                if(str=="000051")
                {
                    dataValue[i] = datapoint[i].Y;
                }
                else if (str == "000052")
                {
                    dataValue[i] = datapoint[i].Y;
                }
                else if (str == "000053")
                {
                    dataValue[i] = datapoint[i].Y;
                }
                else if (str == "000054")
                {
                    dataValue[i] = datapoint[i].Y;
                }
            }

            return SelectData.getHigh(dataPredict)>SelectData.getHigh(dataValue)?SelectData.getHigh(dataPredict):SelectData.getHigh(dataValue);
        }
        public double getLow(List<DataValue> datapoint)
        {
            double[] dataPredict = new double[datapoint.Count];
            for (int i = 0; i < datapoint.Count; i++)
            {
                dataPredict[i] = datapoint[i].PredictData;
            }

            return SelectData.getLow(dataPredict);
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

        private void display_Load(object sender, RoutedEventArgs e)
        {
            //Frame frame = new Frame();
            //frame.Source = new Uri("pack://application:,,,/ScatterDiagram;component/Title/Title2.xaml");   
            //if (display.Children.Count > 0)
            //{
            //    display.Children.Clear();
            //}
            //display.Children.Add(frame);

        }

        private void JiaZaiData_Loaded(object sender, RoutedEventArgs e)
        {
            List<int> day = new List<int>();
            
            for (int i = 1; i <= 77; i++)
            {
                day.Add(i);
            }
            daySelect.ItemsSource = day;
        }

        private void daySelect_Changed(object sender, EventArgs e)
        {
            
            int date;

            if (!this.IsLoaded)
            {
                return;
            }

            date = Convert.ToInt32(daySelect.SelectedItem);

            try
            {
                predictYData = SelectData.getLagPredictValue("000051", date);
                predictY1Data = SelectData.getLagPredictValue("000052", date);
                predictY2Data = SelectData.getLagPredictValue("000053", date);
                predictY3Data = SelectData.getLagPredictValue("000054", date);

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

                categoryDateAxis.ItemsSource = predictYData;
                colCorn.ItemsSource = predictY1Data;
                colRice.ItemsSource = predictY2Data;
                colGrain.ItemsSource = predictYData;
                colTCC.ItemsSource = predictY3Data;


                numericXAxis.MinimumValue = 1;
                numericXAxis.MaximumValue = predictYData.Count;

                ClipLine.Value = date;
                moveLine.Value = date;
                textChaZhi.Text = string.Format("{0:MM-dd}", predictYData[date - 1].date);
            }
            catch (Exception e1)
            {
                MessageBox.Show(e1.Message);
            }

            if (butCorn.IsChecked == true)
            {
                Click(butCorn);
            }
            else if (butGrain.IsChecked == true)
            {
                Click(butGrain);
            }
            else if (butRice.IsChecked == true)
            {
                Click(butRice);
            }
            else if (butTcc.IsChecked == true)
            {
                Click(butTcc);
            }
        }
    }
}
