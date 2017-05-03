using System.Windows;
using System.Windows.Controls;
using CornPeatsTeXingDataMember;
using Infragistics.Controls.Charts;
using System.Windows.Media;
using System.Windows.Data;
using System;
using CornPeatsTeXingBarChart.Select;
namespace CornPeatsTeXingBarChart.series
{
    public partial class MediaValueOverlays2 : Infragistics.Samples.Framework.SampleContainer
    {
        public MediaValueOverlays2()
        {
            InitializeComponent();

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

        DataSource Data;
        private void Button_Click(object sender, RoutedEventArgs e)
        {
            if (checkTemp1.IsChecked == false && checkTemp2.IsChecked == false)
            {
                return;
            }
            Button but = sender as Button;
            if (but == but0)
            {
                if (checkTemp1.IsChecked == true)
                {
                    Data = new DataSource("000043");
                }
                else if (checkTemp2.IsChecked == true)
                {
                    Data = new DataSource("000047");
                }
            }
            if (but == but2)
            {
                if (checkTemp1.IsChecked == true)
                {
                    Data = new DataSource("000044");
                }
                else if (checkTemp2.IsChecked == true)
                {
                    Data = new DataSource("000048");
                }
            }
            if (but == but5)
            {
                if (checkTemp1.IsChecked == true)
                {
                    Data = new DataSource("000045");
                }
                else if (checkTemp2.IsChecked == true)
                {
                    Data = new DataSource("000049");
                }

            }
            if (but == but10)
            {
                if (checkTemp1.IsChecked == true)
                {
                    Data = new DataSource("000046");
                }
                else if (checkTemp2.IsChecked == true)
                {
                    Data = new DataSource("000050");
                }

            }

            col.ItemsSource = Data;
            col.Visibility = Visibility.Visible;
            textName.Text = Data[0].yLable;
            num.Content = Data[0].PeatsMiDu;
            temp.Content = Data[0].InTemp;
            labTitle.Content = "时间与玉米象对小麦容重影响最值图";
            categoryXAxis.ItemsSource = Data;
            HighestValueOverlay.ItemsSource = Data;
            LowestValueOverlay.ItemsSource = Data;
            MeanValueOverlay.ItemsSource = Data;
        }

        private void check_Checked(object sender, RoutedEventArgs e)
        {
            CheckBox check = sender as CheckBox;
            if (check == checkTemp1)
            {
                checkTemp2.IsEnabled = false;

            }
            if (check == checkTemp2)
            {
                checkTemp1.IsEnabled = false;
            }
        }
        private void check_Unchecked(object sender, RoutedEventArgs e)
        {
            if (checkTemp1.IsChecked == false && checkTemp2.IsChecked == false)
            {
                checkTemp1.IsEnabled = true;
                checkTemp2.IsEnabled = true;
            }
        }


       
            

    

        public void Click(object sender)
        {

        }

        private void SampleContainer_Loaded(object sender, RoutedEventArgs e)
        {
        }

        private void DataChart_Loaded(object sender, RoutedEventArgs e)
        {
        }


    }
}
