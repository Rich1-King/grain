
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

namespace BarChart.series
{
    /// <summary>
    /// ValueOverlays1.xaml 的交互逻辑
    /// </summary>
    public partial class ValueOverlays1 : Infragistics.Samples.Framework.SampleContainer
    {
        DataSource Axis;
        DataSource yData;
        DataSource y1Data;
        DataSource y2Data;
        DataSource y3Data;
       public ValueOverlays1()
        {
            InitializeComponent();

            try
            {
                Axis = new DataSource("000051");
                yData = new DataSource("000051");
                y1Data = new DataSource("000052");
                y2Data = new DataSource("000053");
                y3Data = new DataSource("000054");
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

        SplineSeries[] tt1 = new SplineSeries[4];
        //DataSource Axis = new DataSource("000001");
        //DataSource yData = new DataSource("000001");
        //DataSource y1Data = new DataSource("000002");
        //DataSource y2Data = new DataSource("000003");
        //DataSource y3Data = new DataSource("000004");
     
        private void SampleContainer_Loaded(object sender, RoutedEventArgs e)
        {
            categoryXAxis.ItemsSource = Axis;
            colCorn.ItemsSource = y1Data;
            colRice.ItemsSource = y2Data;
            colGrain.ItemsSource = yData;
            colTCC.ItemsSource = y3Data;
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
                //MeanValueOverlay.ItemsSource = y1Data;
                //LowestValueOverlay.ItemsSource = y1Data;
                //HighestValueOverlay.ItemsSource = y1Data;

                labTitle.Content = "谷蠹--时间与粮温直方图";

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
                //MeanValueOverlay.ItemsSource = y2Data;
                //LowestValueOverlay.ItemsSource = y2Data;
                //HighestValueOverlay.ItemsSource = y2Data;
                labTitle.Content = "米象--时间与粮温直方图";

            }
            if (but == butGrain)
            {
                if (colCorn != null && colCorn.Visibility == Visibility.Visible)
                {
                    colCorn.Visibility = Visibility.Hidden;
                }

                if (colGrain != null && colGrain.Visibility == Visibility.Hidden)
                {
                    this.colGrain.Visibility = Visibility.Visible;
                }
                if (colRice != null && colRice.Visibility == Visibility.Visible)
                {
                    colRice.Visibility = Visibility.Hidden;
                }
                if (colTCC != null && colTCC.Visibility == Visibility.Visible)
                {
                    colTCC.Visibility = Visibility.Hidden;
                }
                //MeanValueOverlay.ItemsSource = yData;
                //LowestValueOverlay.ItemsSource = yData;

                //HighestValueOverlay.ItemsSource = yData;

                labTitle.Content = "玉米象--时间与粮温直方图";

            }
            if (but == butTcc)
            {
                if (colCorn != null && colCorn.Visibility == Visibility.Visible)
                {
                    colCorn.Visibility = Visibility.Hidden;
                }

                if (colGrain != null && colGrain.Visibility == Visibility.Visible)
                {
                    this.colGrain.Visibility = Visibility.Hidden;
                }
                if (colRice != null && colRice.Visibility == Visibility.Visible)
                {
                    colRice.Visibility = Visibility.Hidden;
                }
                if (colTCC != null && colTCC.Visibility == Visibility.Hidden)
                {
                    colTCC.Visibility = Visibility.Visible;
                }
                //MeanValueOverlay.ItemsSource = y3Data;
                //LowestValueOverlay.ItemsSource = y3Data;
                //HighestValueOverlay.ItemsSource = y3Data;


                labTitle.Content = "赤拟谷盗--时间与粮温直方图";
            }

            //HighestValueOverlay.ValueMemberPath = "High";
            //MeanValueOverlay.ValueMemberPath = "Media";
            //LowestValueOverlay.ValueMemberPath = "Low";
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
