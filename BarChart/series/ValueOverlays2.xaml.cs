
using DataMember;
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
using System.Windows.Shapes;
using wheateWindow;
using ConvertData;

namespace BarChart.series
{
    /// <summary>
    /// ValueOverlays2.xaml 的交互逻辑
    /// </summary>
    public partial class ValueOverlays2 : Infragistics.Samples.Framework.SampleContainer
    {

        DataSource Axis ;
        DataSource yData;
        XiaoMaiDisplayModel model;
        DataSource y1Data;
        XiaoMaiDisplayModel model1;
        DataSource y2Data;
        XiaoMaiDisplayModel model2;
        DataSource y3Data;
        XiaoMaiDisplayModel model3;
        ConvertStringToRichTextBox convertToBox = new ConvertStringToRichTextBox();
       public ValueOverlays2()
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
                throw e;
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

        SplineSeries[] tt1 = new SplineSeries[4];
        private void SampleContainer_Loaded(object sender, RoutedEventArgs e)
        {
            categoryXAxis.ItemsSource = Axis;
            col.ItemsSource = y2Data;
            labTitle.Content = "当初始虫口密度为2头/kg时粮温不同的储粮害虫米象种群数量情况";
            wheatePeatsZongQunHeader.miaoShu.Document =convertToBox.convertStringToFlowDocument(model2.chartMiaoShu);
           
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
                labTitle.Content = "当初始虫口密度为2头/kg时粮温不同的储粮害虫谷蠹种群数量情况";
                wheatePeatsZongQunHeader.miaoShu.Document = convertToBox.convertStringToFlowDocument(model1.chartMiaoShu);
                col.ItemsSource = y1Data;
            }
            if (but == butRice)
            {
                labTitle.Content = "当初始虫口密度为2头/kg时粮温不同的储粮害虫米象种群数量情况";
                wheatePeatsZongQunHeader.miaoShu.Document = convertToBox.convertStringToFlowDocument(model2.chartMiaoShu);
                col.ItemsSource = y2Data;
            }
            if (but == butGrain)
            {
               
                labTitle.Content = "当初始虫口密度为2头/kg时粮温不同的储粮害虫玉米象种群数量情况";
                wheatePeatsZongQunHeader.miaoShu.Document = convertToBox.convertStringToFlowDocument(model.chartMiaoShu);
                col.ItemsSource = yData;
            }
            if (but == butTcc)
            {
                labTitle.Content = "当初始虫口密度为2头/kg时粮温不同的储粮害虫赤拟谷盗种群数量情况";
                wheatePeatsZongQunHeader.miaoShu.Document = convertToBox.convertStringToFlowDocument(model3.chartMiaoShu);
                col.ItemsSource = y3Data;
            }
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
