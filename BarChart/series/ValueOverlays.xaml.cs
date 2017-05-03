using System.Windows;
using System.Windows.Controls;
using DataMember;
using Infragistics.Controls.Charts;
using System.Windows.Media;
using System;
using wheateWindow;
using ConvertData;
namespace BarChart.series
{
    public partial class ValueOverlays : Infragistics.Samples.Framework.SampleContainer
    {

        DataSource Axis;
        DataSource yData;
        DataSource y1Data;
        DataSource y2Data;
        DataSource y3Data;
        XiaoMaiDisplayModel model;
        XiaoMaiDisplayModel model1;
        XiaoMaiDisplayModel model2;
        XiaoMaiDisplayModel model3;
        ConvertStringToRichTextBox convertToBox = new ConvertStringToRichTextBox();

        public ValueOverlays()
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

        }


        #region Event Handlers

        private void OnMedianValueOverlayCheckBoxClick(object sender, RoutedEventArgs e)
        {
            CheckBox chb = sender as CheckBox;
            if (chb != null && chb.IsChecked != null)
                this.DataChart.Series["MedianValueOverlay"].Opacity = chb.IsChecked.Value ? 0.5 : 0;
        }
        private void OnMeanValueOverlayCheckBoxClick(object sender, RoutedEventArgs e)
        {
            CheckBox chb = sender as CheckBox;
            if (chb != null && chb.IsChecked != null)
                this.DataChart.Series["MeanValueOverlay"].Opacity = chb.IsChecked.Value ? 0.5 : 0;
        }
        private void OnVarianceValueOverlayCheckBoxClick(object sender, RoutedEventArgs e)
        {
            CheckBox chb = sender as CheckBox;
            if (chb != null && chb.IsChecked != null)
                this.DataChart.Series["VarianceValueOverlay"].Opacity = chb.IsChecked.Value ? 0.5 : 0;
        }
        private void OnHighestValueOverlayCheckBoxClick(object sender, RoutedEventArgs e)
        {
            CheckBox chb = sender as CheckBox;
            if (chb != null && chb.IsChecked != null)
                this.DataChart.Series["HighestValueOverlay"].Opacity = chb.IsChecked.Value ? 0.5 : 0;
        }
        private void OnLowestValueOverlayCheckBoxClick(object sender, RoutedEventArgs e)
        {
            CheckBox chb = sender as CheckBox;
            if (chb != null && chb.IsChecked != null)
                this.DataChart.Series["LowestValueOverlay"].Opacity = chb.IsChecked.Value ? 0.5 : 0;
        }
        private void OnFixedValueOverlayCheckBoxClick(object sender, RoutedEventArgs e)
        {
            CheckBox chb = sender as CheckBox;
            if (chb != null && chb.IsChecked != null)
                this.DataChart.Series["FixedValueOverlay"].Opacity = chb.IsChecked.Value ? 0.5 : 0;
        }
        private void OnEditableValueOverlayCheckBoxClick(object sender, RoutedEventArgs e)
        {
            CheckBox chb = sender as CheckBox;
            // this.DataChart.Series["tt"].Visibility = Visibility.Visible;
            if (chb != null && chb.IsChecked != null)
                this.DataChart.Series["EditableValueOverlay"].Opacity = chb.IsChecked.Value ? 0.5 : 0;
        }
        #endregion
        private void LayoutRoot_Loaded(object sender, RoutedEventArgs e)
        {
            categoryXAxis.ItemsSource = Axis; 
            if (butCorn.IsChecked == true)
            {
                PanDuan(butCorn);
            }
            else if (butGrain.IsChecked == true)
            {
                PanDuan(butGrain);
            }
            else if (butRice.IsChecked == true)
            {
                PanDuan(butRice);
            }
            else if (butTcc.IsChecked == true)
            {
                PanDuan(butTcc);
            }
          
        }

        private void PanDuan(RadioButton but)
        {
            if (but == butCorn)
            {
               
                labTitle.Content = "常温条件下当初始虫口密度为2头/kg时不同储存时间的储粮害虫谷蠹种群数量情况";
                wheatePeatsZongQunHeader.miaoShu.Document = convertToBox.convertStringToFlowDocument(model1.chartMiaoShu);
                col.ItemsSource = y1Data;
            }
            if (but == butRice)
            {      
                labTitle.Content = "常温条件下当初始虫口密度为2头/kg时不同储存时间的储粮害虫米象种群数量情况";
                wheatePeatsZongQunHeader.miaoShu.Document = convertToBox.convertStringToFlowDocument(model2.chartMiaoShu);
                col.ItemsSource = y2Data;

            }
            if (but == butGrain)
            {
               
                labTitle.Content = "常温条件下当初始虫口密度为2头/kg时不同储存时间的储粮害虫玉米象种群数量情况";
                wheatePeatsZongQunHeader.miaoShu.Document = convertToBox.convertStringToFlowDocument(model.chartMiaoShu);
                col.ItemsSource = yData;

            }
            if (but == butTcc)
            {     
                labTitle.Content = "常温条件下当初始虫口密度为2头/kg时不同储存时间的储粮害虫赤拟谷盗种群数量情况";
                wheatePeatsZongQunHeader.miaoShu.Document = convertToBox.convertStringToFlowDocument(model3.chartMiaoShu);
                col.ItemsSource = y3Data;
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

            PanDuan(but);
        }

        private void display_Load(object sender, RoutedEventArgs e)
        {
            //Frame frame = new Frame();
            //frame.Source = new Uri("pack://application:,,,/BarChart;component/Title/Title1.xaml");

            //if (display.Children.Count > 0)
            //{
            //    display.Children.Clear();
            //}
            //display.Children.Add(frame);
        }
    }
}
