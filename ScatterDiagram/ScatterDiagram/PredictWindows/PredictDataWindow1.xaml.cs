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

    public partial class PredictDataWindow1 : Infragistics.Samples.Framework.SampleContainer
    {

        public PredictDataWindow1()
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

                if ((long)unscaledX > DateTime.MaxValue.Ticks || (long)unscaledX < DateTime.MinValue.Ticks)
                {
                    return;
                }

                DateTime xDate = new DateTime((long)unscaledX);

                this.CategoryXCoordinateTextBlock.Text = String.Format("{0:MM-dd}", xDate);
                this.CategoryYCoordinateTextBlock.Text = String.Format("{0:0.00}", unscaledY);

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

        private void Button_Click(object sender, RoutedEventArgs e)
        {

            RadioButton but = sender as RadioButton;
            butRice.IsChecked = false;
            butCorn.IsChecked = false;
            butGrain.IsChecked = false;
            butTcc.IsChecked = false;
            but.IsChecked = true;
            if (but == butCorn)
            {
                if (colCorn != null && colCorn.Visibility == Visibility.Hidden)
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
                else if (colCorn != null && colCorn.Visibility == Visibility.Visible)
                {
                    colCorn.Visibility = Visibility.Hidden;
                    colCornPredict.Visibility = Visibility.Hidden;
               
                }
               
            }

            if (but == butRice)
            {
                if (colRice != null && colRice.Visibility == Visibility.Hidden)
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
                    wheatePeatsZongQunHeader.miaoShu.Document = convertToBox.convertStringToFlowDocument(model2.chartMiaoShu);
                }
                else if (colRice != null && colRice.Visibility == Visibility.Visible)
                {
                    colRice.Visibility = Visibility.Hidden;
                    colRicePredict.Visibility = Visibility.Hidden;
             
                }
              
            }
            if (but == butGrain)
            {
                if (colGrain != null && colGrain.Visibility == Visibility.Hidden)
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
                else if (colGrain != null && colGrain.Visibility == Visibility.Visible)
                {
                    colGrain.Visibility = Visibility.Hidden;
                    colGrainPredict.Visibility = Visibility.Hidden;
                
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
                else if (colTCC != null && colTCC.Visibility == Visibility.Visible)
                {
                    colTCC.Visibility = Visibility.Hidden;
                    colTCCPredict.Visibility = Visibility.Hidden;
                
                }
             
            }
        }


        SplineSeries colGrainPredict = new SplineSeries();
        SplineSeries colCornPredict = new SplineSeries();
        SplineSeries colTCCPredict = new SplineSeries();
        SplineSeries colRicePredict = new SplineSeries();
        List<DataValue> predictYData = new List<DataValue>();
        List<DataValue> predictY1Data = new List<DataValue>();
        List<DataValue> predictY2Data = new List<DataValue>();
        List<DataValue> predictY3Data = new List<DataValue>();
        private void Grid_Loaded(object sender, RoutedEventArgs e)
        {

            try
            {
                predictYData = SelectData.getAllPredictValue("000051");
                predictY1Data = SelectData.getAllPredictValue("000052");
                predictY2Data = SelectData.getAllPredictValue("000053");
                predictY3Data = SelectData.getAllPredictValue("000054");

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
                colRicePredict.Visibility = Visibility.Visible;
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

                double[] high = new double[8];
                high[0] = getMax(predictYData);
                high[1] = getMax(predictY1Data);
                high[2] = getMax(predictY2Data);
                high[3] = getMax(predictY3Data);

                numericYAxis.MaximumValue = SelectData.getHigh(high) + 5;
            }
            catch (Exception e1)
            {
                MessageBox.Show(e1.Message);
            }
            labTitle.Content = "常温条件下当初始虫口密度为2头/kg时不同储存时间的储粮害虫米象种群数量预测情况";
            wheatePeatsZongQunHeader.miaoShu.Document = convertToBox.convertStringToFlowDocument(model2.chartMiaoShu);

         
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

        private void display_Load(object sender, RoutedEventArgs e)
        {
            //Frame frame = new Frame();
            //frame.Source = new Uri("pack://application:,,,/ScatterDiagram;component/Title/Title1.xaml");
            //if (display.Children.Count > 0)
            //{
            //    display.Children.Clear();
            //}
            //display.Children.Add(frame);
        }
    }

    public class TrackingGrid : Grid
    {
        public static readonly DependencyProperty SeriesProperty =
           DependencyProperty.Register(
           "Series",
           typeof(Series),
           typeof(TrackingGrid),
           new PropertyMetadata(null,
               (o, e) =>
               {
                   (o as TrackingGrid)
                       .OnSeriesChanged(e);
               }));

        private void OnSeriesChanged(
            DependencyPropertyChangedEventArgs e)
        {
            Refresh();
        }

        public Series Series
        {
            get { return (Series)GetValue(SeriesProperty); }
            set { SetValue(SeriesProperty, value); }
        }

        public static readonly DependencyProperty VisibilityItemProperty =
           DependencyProperty.Register(
           "VisibilityItem",
           typeof(VisibilityItem),
           typeof(TrackingGrid),
           new PropertyMetadata(null,
               (o, e) =>
               {
                   (o as TrackingGrid)
                       .OnVisibilityItemChanged(e);
               }
               ));

        private void OnVisibilityItemChanged(
            DependencyPropertyChangedEventArgs e)
        {
            Refresh();
        }

        public VisibilityItem VisibilityItem
        {
            get { return (VisibilityItem)GetValue(VisibilityItemProperty); }
            set { SetValue(VisibilityItemProperty, value); }
        }

        public TrackingGrid()
        {
            this.Loaded += TrackingGrid_Loaded;
            this.Unloaded += TrackingGrid_Unloaded;
        }

        private void Refresh()
        {
            if (_items.ContainsKey(this))
            {
                _items.Remove(this);
            }
            _items.Add(this, new ItemInfo
            {
                Series = Series,
                Item = this,
                VisibilityItem = VisibilityItem
            });
        }

        void TrackingGrid_Unloaded(object sender, RoutedEventArgs e)
        {
            _items.Remove(this);
        }

        void TrackingGrid_Loaded(object sender, RoutedEventArgs e)
        {
            Refresh();
        }

        public class ItemInfo
        {
            public Series Series { get; set; }
            public TrackingGrid Item { get; set; }
            public VisibilityItem VisibilityItem { get; set; }
        }

        private static Dictionary<TrackingGrid, ItemInfo> _items
            = new Dictionary<TrackingGrid, ItemInfo>();

        public static IEnumerable<ItemInfo> Items()
        {
            return _items.Values;
        }
    }

    public class VisibilityItem : ContentControl
    {
    }
}
