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

    public partial class PredictDataWindow1 : Page
    {

        public PredictDataWindow1()
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


        XiaoMaiDisplayModel model;
        ConvertStringToRichTextBox convertToBox = new ConvertStringToRichTextBox();
        public List<DataValue> getPredictData(String shiYanNumber)
        {
            return SelectData.getAllPredictValue(shiYanNumber);

        }
        public void ButMap(RadioButton but)
        {
            
            if (but == But11)
            {
                if (Convert.ToDouble(comBoxTemp.SelectedItem) == 20)
                {  
                    predictData = getPredictData("000025");
                    model = (new DataSource("000025")).getMiaoShu();
                }
                else if (Convert.ToDouble(comBoxTemp.SelectedItem) == 25)
                {
                    predictData = getPredictData("000026");
                    model = (new DataSource("000026")).getMiaoShu();
                }
                else if (Convert.ToDouble(comBoxTemp.SelectedItem) == 27.5)
                {
                    
                    predictData = getPredictData("000027");
                    model = (new DataSource("000027")).getMiaoShu();
                }
                else if (Convert.ToDouble(comBoxTemp.SelectedItem) == 30)
                {
                   
                    predictData = getPredictData("000028");
                    model = (new DataSource("000028")).getMiaoShu();
                }
            }
            if (but == But12)
            {
                if (Convert.ToDouble(comBoxTemp.SelectedItem) == 20)
                {
                   
                    predictData = getPredictData("000029");
                    model = (new DataSource("000029")).getMiaoShu();
                }
                else if (Convert.ToDouble(comBoxTemp.SelectedItem) == 25)
                {
                
                    predictData = getPredictData("000030");
                    model = (new DataSource("000030")).getMiaoShu();
                }
                else if (Convert.ToDouble(comBoxTemp.SelectedItem) == 27.5)
                {
             
                    predictData = getPredictData("000031");
                    model = (new DataSource("000031")).getMiaoShu();
                }
                else if (Convert.ToDouble(comBoxTemp.SelectedItem) == 30)
                {
                
                    predictData = getPredictData("000032");
                    model = (new DataSource("000032")).getMiaoShu();
                }
            }
            if (but == But13)
            {
                if (Convert.ToDouble(comBoxTemp.SelectedItem) == 20)
                {
               
                    predictData = getPredictData("000033");
                    model = (new DataSource("000033")).getMiaoShu();
                }
                else if (Convert.ToDouble(comBoxTemp.SelectedItem) == 25)
                {
                  
                    predictData = getPredictData("000034");
                    model = (new DataSource("000034")).getMiaoShu();
                }
                else if (Convert.ToDouble(comBoxTemp.SelectedItem) == 27.5)
                {
              
                    predictData = getPredictData("000035");
                    model = (new DataSource("000035")).getMiaoShu();
                }
                else if (Convert.ToDouble(comBoxTemp.SelectedItem) == 30)
                {
                 
                    predictData = getPredictData("000036");
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
           // water.Text = Convert.ToString(predictData[0].Water);
           // temp.Text = Convert.ToString(predictData[0].GrainTemp);
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

            numericXAxis.MinimumValue = 1;
            numericXAxis.MaximumValue = 13;

            categoryDateAxis.ItemsSource = predictData;

            numericYAxis.Interval = 0.2;


        }
        public void ButMap1(RadioButton but)
        {
            if (but == But11)
            {
                if (Convert.ToDouble(comBoxTemp.SelectedItem) == 20)
                {
                  

                    predictData = getPredictData("000013");
                    model = (new DataSource("000013")).getMiaoShu();


                }
                else if (Convert.ToDouble(comBoxTemp.SelectedItem) == 25)
                {
                  
                    predictData = getPredictData("000014");
                    model = (new DataSource("000014")).getMiaoShu();
                }
                else if (Convert.ToDouble(comBoxTemp.SelectedItem) == 27.5)
                {
                  
                    predictData = getPredictData("000015");
                    model = (new DataSource("000015")).getMiaoShu();
                }
                else if (Convert.ToDouble(comBoxTemp.SelectedItem) == 30)
                {
                   
                    predictData = getPredictData("000016");
                    model = (new DataSource("000016")).getMiaoShu();
                }
            }
            if (but == But12)
            {

                if (Convert.ToDouble(comBoxTemp.SelectedItem) == 20)
                {
                 
                    predictData = getPredictData("000017");
                    model = (new DataSource("000017")).getMiaoShu();


                }
                else if (Convert.ToDouble(comBoxTemp.SelectedItem) == 25)
                {
               
                    predictData = getPredictData("000018");
                    model = (new DataSource("000018")).getMiaoShu();
                }
                else if (Convert.ToDouble(comBoxTemp.SelectedItem) == 27.5)
                {
               
                    predictData = getPredictData("000019");
                    model = (new DataSource("000019")).getMiaoShu();
                }
                else if (Convert.ToDouble(comBoxTemp.SelectedItem) == 30)
                {
                  
                    predictData = getPredictData("000020");
                    model = (new DataSource("000020")).getMiaoShu();
                }
            }
            if (but == But13)
            {

                if (Convert.ToDouble(comBoxTemp.SelectedItem) == 20)
                {
                
                    predictData = getPredictData("000021");
                    model = (new DataSource("000021")).getMiaoShu();


                }
                else if (Convert.ToDouble(comBoxTemp.SelectedItem) == 25)
                {
                  
                    predictData = getPredictData("000022");
                    model = (new DataSource("000022")).getMiaoShu();
                }
                else if (Convert.ToDouble(comBoxTemp.SelectedItem) == 27.5)
                {

                    predictData = getPredictData("000023");
                    model = (new DataSource("000023")).getMiaoShu();
                }
                else if (Convert.ToDouble(comBoxTemp.SelectedItem) == 30)
                {
               
                    predictData = getPredictData("000024");
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
           // textName.Text = predictData[0].yLable;
           // water.Text = Convert.ToString(predictData[0].Water);
           // temp.Text = Convert.ToString(predictData[0].GrainTemp);
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

            numericXAxis.MinimumValue = 1;
            numericXAxis.MaximumValue = 13;       

        }

        public void ButMap2(RadioButton but)
        {
            if (but == But11)
            {
                if (Convert.ToDouble(comBoxTemp.SelectedItem) == 20)
                {
                   

                    predictData = getPredictData("000001");
                    model = (new DataSource("000001")).getMiaoShu();


                }
                else if (Convert.ToDouble(comBoxTemp.SelectedItem) == 25)
                {
                   
                    predictData = getPredictData("000002");
                    model = (new DataSource("000002")).getMiaoShu();
                }
                else if (Convert.ToDouble(comBoxTemp.SelectedItem) == 27.5)
                {
                  
                    predictData = getPredictData("000003");
                    model = (new DataSource("000003")).getMiaoShu();
                }
                else if (Convert.ToDouble(comBoxTemp.SelectedItem) == 30)
                {
          
                    predictData = getPredictData("000004");
                    model = (new DataSource("000004")).getMiaoShu();
                }
            }
            if (but == But12)
            {

                if (Convert.ToDouble(comBoxTemp.SelectedItem) == 20)
                {
       

                    predictData = getPredictData("000005");
                    model = (new DataSource("000005")).getMiaoShu();


                }
                else if (Convert.ToDouble(comBoxTemp.SelectedItem) == 25)
                {
                    
                    predictData = getPredictData("000006");
                    model = (new DataSource("000006")).getMiaoShu();
                }
                else if (Convert.ToDouble(comBoxTemp.SelectedItem) == 27.5)
                {
              
                    predictData = getPredictData("000007");
                    model = (new DataSource("000007")).getMiaoShu();
                }
                else if (Convert.ToDouble(comBoxTemp.SelectedItem) == 30)
                {
               
                    predictData = getPredictData("000008");
                    model = (new DataSource("000008")).getMiaoShu();
                }
            }
            if (but == But13)
            {

                if (Convert.ToDouble(comBoxTemp.SelectedItem) == 20)
                {

                    predictData = getPredictData("000009");
                    model = (new DataSource("000009")).getMiaoShu();


                }
                else if (Convert.ToDouble(comBoxTemp.SelectedItem) == 25)
                {
                    predictData = getPredictData("000010");
                    model = (new DataSource("000010")).getMiaoShu();
                }
                else if (Convert.ToDouble(comBoxTemp.SelectedItem) == 27.5)
                {
                    predictData = getPredictData("000011");
                    model = (new DataSource("000011")).getMiaoShu();
                }
                else if (Convert.ToDouble(comBoxTemp.SelectedItem) == 30)
                {
                    predictData = getPredictData("000012");
                    model = (new DataSource("000012")).getMiaoShu();
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
            //textName.Text = predictData[0].yLable;
            //water.Text = Convert.ToString(predictData[0].Water);
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


            categoryDateAxis.ItemsSource = predictData;

            numericXAxis.MinimumValue = 1;
            numericXAxis.MaximumValue = 13;
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
            if (wheateZhiLiangTeXingHeader.type == 1)
            {
                ButMap(but);
            }
            else if (wheateZhiLiangTeXingHeader.type == 2)
            {
                ButMap1(but);
            }
            else if (wheateZhiLiangTeXingHeader.type == 3)
            {
                ButMap2(but);
            }
            else
            {
                MessageBox.Show("初始化失败!!");
            }
        }


        SplineSeries colPredict = new SplineSeries();
 
        List<DataValue> predictData = new List<DataValue>();
   
        private void Grid_Loaded(object sender, RoutedEventArgs e)
        {
            labelY.Content = "不\n完\n善\n度\n(\n%\n)";
            numericYAxis.MinimumValue = 2;
            numericYAxis.MaximumValue = 4;
            numericYAxis.Interval = 0.2;
            text.Content = "不完善度";
            //initDate(But11);
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

        private void comBoxTemp_load(object sender, RoutedEventArgs e)
        {
            List<double> temp = new List<double>();
            temp.Add(20);
            temp.Add(25);
            temp.Add(27.5);
            temp.Add(30);
            comBoxTemp.ItemsSource = temp;
        }

        private void comBoxTemp_Change(object sender, EventArgs e)
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
