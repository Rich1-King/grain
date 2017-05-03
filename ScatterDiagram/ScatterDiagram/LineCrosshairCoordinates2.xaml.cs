using System;
using System.Collections.ObjectModel;
using System.Linq;
using System.Windows;
using Infragistics.Controls.Charts;
using System.Windows.Input;
using DataMember;
using System.Windows.Shapes;
using System.Windows.Controls;
using wheateWindow;
using ConvertData;

namespace ScatterDiagram
{

    public partial class LineCrosshairCoordinates2 : Infragistics.Samples.Framework.SampleContainer
    {

        DataSource Axis;
        DataSource yData;
        XiaoMaiDisplayModel model;
        DataSource y1Data;
        XiaoMaiDisplayModel model1;
        DataSource y2Data;
        XiaoMaiDisplayModel model2;
        DataSource y3Data;
        XiaoMaiDisplayModel model3;
        ConvertStringToRichTextBox convertToBox = new ConvertStringToRichTextBox();

        public LineCrosshairCoordinates2()
        {
            InitializeComponent();

            try
            {
                Axis = new DataSource("000051");
                yData = new DataSource("000051");
                model = yData.getMiaoShu();
                y1Data = new DataSource("000052");
                model1 = y1Data.getMiaoShu();
                y2Data = new DataSource("000053");
                model2 = y2Data.getMiaoShu();
                y3Data = new DataSource("000054");
                model3 = y3Data.getMiaoShu();
            }
            catch (Exception e)
            {
                MessageBox.Show(e.Message);
            }

            if (SelectData.getCount() == 0)
            {
             
                this.CategoryChart.Series[1].Visibility = Visibility.Hidden;
                this.CategoryChart.Series[2].Visibility = Visibility.Hidden;
            }
            else
            {
            }

        }
        //折线图定位
        private void OnCategoryChartMouseMove(object sender, MouseEventArgs e)
        {
            DataSource data = new DataSource();
            var series = this.CategoryChart.Series.FirstOrDefault();

            if (series == null) return;

            var position = e.GetPosition(series);

            // calculate crosshair coordinates on CategoryDateTimeXAxis 
            if (((XamDataChart)series.SeriesViewer).Axes.OfType<CategoryXAxis>().Any())
            {
                var xAxis = ((XamDataChart)series.SeriesViewer).Axes.OfType<CategoryXAxis>().First();
                var yAxis = ((XamDataChart)series.SeriesViewer).Axes.OfType<NumericYAxis>().First();

                var viewport = new Rect(0, 0, xAxis.ActualWidth, yAxis.ActualHeight);
                var window = series.SeriesViewer.WindowRect;

                bool isInverted = xAxis.IsInverted;
                ScalerParams param = new ScalerParams(window, viewport, isInverted);
                var unscaledX = xAxis.GetUnscaledValue(position.X, param);

                isInverted = yAxis.IsInverted;
                param = new ScalerParams(window, viewport, isInverted);
                var unscaledY = yAxis.GetUnscaledValue(position.Y, param);

                //DateTime xDate = new DateTime((long)unscaledX);
                //DateTime xDate = new DateTime((int)unscaledX, 1, 1);

                this.CategoryXCoordinateTextBlock.Text = String.Format("{0:0.00}", unscaledX);
                this.CategoryYCoordinateTextBlock.Text = String.Format("{0:0.00}", unscaledY);

                //foreach (DataValue d in data)
                //{
                //    if (textH.Text==Convert.ToString(d.GrainTemp)||textLow.Text==Convert.ToString(d.GrainTemp)||textTC.Text==Convert.ToString(d.GrainTemp)||textY.Text==Convert.ToString(d.GrainTemp))
                //    {
                //        inTempY.Text = d.InTemp;

                //        inTempLow.Text = d.InTemp;

                //        inTempHigh.Text = d.InTemp;

                //        inTempTC.Text = d.InTemp;

                //    }
                //}

                //if (this.CategoryXCoordinateTextBlock.Text == "2015/05/01")
                //{
                //    Ellipse ell = new Ellipse();
                //    //ell.

                //}

            }
        }


        private void Grid_Loaded(object sender, RoutedEventArgs e)
        {
            categoryXAxis.ItemsSource = Axis;
            colCorn.ItemsSource = y1Data;
            colRice.ItemsSource = y2Data;
            colGrain.ItemsSource = yData;
            colTCC.ItemsSource = y3Data;
            labTitle.Content = "当初始虫口密度为2头/kg时粮温不同的储粮害虫米象种群数量情况";
            wheatePeatsZongQunHeader.miaoShu.Document = convertToBox.convertStringToFlowDocument(model2.chartMiaoShu);
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
                }

                if (colGrain != null && colGrain.Visibility == Visibility.Visible)
                {
                    colGrain.Visibility = Visibility.Hidden;
                }
                if (colRice != null && colRice.Visibility == Visibility.Visible)
                {
                    colRice.Visibility = Visibility.Hidden;
                }
                if (colTCC != null && colTCC.Visibility == Visibility.Visible)
                {
                    colTCC.Visibility = Visibility.Hidden;
                }

                labTitle.Content = "当初始虫口密度为2头/kg时粮温不同的储粮害虫谷蠹种群数量情况";
                wheatePeatsZongQunHeader.miaoShu.Document = convertToBox.convertStringToFlowDocument(model1.chartMiaoShu);
            }

            if (but == butRice)
            {
                if (colCorn != null && colCorn.Visibility == Visibility.Visible)
                {
                    colCorn.Visibility = Visibility.Hidden;
                }

                if (colGrain != null && colGrain.Visibility == Visibility.Visible)
                {
                    colGrain.Visibility = Visibility.Hidden;
                }
                if (colRice != null && colRice.Visibility == Visibility.Hidden)
                {
                    colRice.Visibility = Visibility.Visible;
                }
                if (colTCC != null && colTCC.Visibility == Visibility.Visible)
                {
                    colTCC.Visibility = Visibility.Hidden;
                }

                labTitle.Content = "当初始虫口密度为2头/kg时粮温不同的储粮害虫米象种群数量情况";
                wheatePeatsZongQunHeader.miaoShu.Document = convertToBox.convertStringToFlowDocument(model2.chartMiaoShu);
            }
            if (but == butGrain)
            {
                if (colCorn != null && colCorn.Visibility == Visibility.Visible)
                {
                    colCorn.Visibility = Visibility.Hidden;
                }

                if (colGrain != null && colGrain.Visibility == Visibility.Hidden)
                {
                    colGrain.Visibility = Visibility.Visible;
                }
                if (colRice != null && colRice.Visibility == Visibility.Visible)
                {
                    colRice.Visibility = Visibility.Hidden;
                }
                if (colTCC != null && colTCC.Visibility == Visibility.Visible)
                {
                    colTCC.Visibility = Visibility.Hidden;
                }

                labTitle.Content = "当初始虫口密度为2头/kg时粮温不同的储粮害虫玉米象种群数量情况";
                wheatePeatsZongQunHeader.miaoShu.Document = convertToBox.convertStringToFlowDocument(model.chartMiaoShu);
            }
            if (but == butTcc)
            {
                if (colCorn != null && colCorn.Visibility == Visibility.Visible)
                {
                    colCorn.Visibility = Visibility.Hidden;
                }

                if (colGrain != null && colGrain.Visibility == Visibility.Visible)
                {
                    colGrain.Visibility = Visibility.Hidden;
                }
                if (colRice != null && colRice.Visibility == Visibility.Visible)
                {
                    colRice.Visibility = Visibility.Hidden;
                }
                if (colTCC != null && colTCC.Visibility == Visibility.Hidden)
                {
                    colTCC.Visibility = Visibility.Visible;
                }

                labTitle.Content = "当初始虫口密度为2头/kg时粮温不同的储粮害虫赤拟谷盗种群数量情况";
                wheatePeatsZongQunHeader.miaoShu.Document = convertToBox.convertStringToFlowDocument(model3.chartMiaoShu);
            }


        }

        private void display_Load(object sender, RoutedEventArgs e)
        {
            //Frame frame = new Frame();
            //frame.Source = new Uri("pack://application:,,,/ScatterDiagram;component/Title/Title3.xaml");
            //if (display.Children.Count > 0)
            //{
            //    display.Children.Clear();
            //}
            //display.Children.Add(frame);
        }
        //散点图定位
        //private void OnScatterChartMouseMove(object sender, MouseEventArgs e)
        //{
        //    var series = this.ScatterChart.Series.FirstOrDefault();
        //    if (series == null) return;

        //    var position = e.GetPosition(series);

        //    // calculate crosshair coordinates on NumericXAxis 
        //    if (((XamDataChart)series.SeriesViewer).Axes.OfType<CategoryDateTimeXAxis>().Any())
        //    {
        //        var xAxis = ((XamDataChart)series.SeriesViewer).Axes.OfType<CategoryDateTimeXAxis>().First();
        //        var yAxis = ((XamDataChart)series.SeriesViewer).Axes.OfType<NumericYAxis>().First();

        //        var viewport = new Rect(0, 0, xAxis.ActualWidth, yAxis.ActualHeight);
        //        var window = series.SeriesViewer.WindowRect;

        //        bool isInverted = xAxis.IsInverted;
        //        ScalerParams param = new ScalerParams(window, viewport, isInverted);
        //        var unscaledX = xAxis.GetUnscaledValue(position.X, param);

        //        isInverted = yAxis.IsInverted;
        //        param = new ScalerParams(window, viewport, isInverted);
        //        var unscaledY = yAxis.GetUnscaledValue(position.Y, param);
        //        DateTime xDate = new DateTime((long)unscaledX);
        //        this.ScatterXCoordinateTextBlock.Text = String.Format("{0:T}", xDate);
        //        this.ScatterYCoordinateTextBlock.Text = String.Format("{0:0.00}", unscaledY);
        //    }

        //}

    }

    //public class DataCollection : ObservableCollection<DataPoint>
    //{

    //    public DataCollection()
    //    {
    //        this.Generate();


    //    }

    //    private void Generate()
    //    {
    //        this.Clear();

    //        foreach (DataPoint datapoint in SelectData.getData())
    //        {
    //            this.Add(datapoint);
    //        }

    //    }
    //}

    //public class DataPoint
    //{
    //    public string Label { get; set; }
    //    public double Value { get; set; }
    //    public int Index { get; set; }
    //    public DateTime Date { get; set; }
    //    public double low { set; get; }
    //    public double hight { set; get; }
    //}
}

