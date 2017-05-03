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
    public partial class MediaValueOverlays1 : Infragistics.Samples.Framework.SampleContainer
    {
        public MediaValueOverlays1()
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
            Button but = sender as Button;

            if (but == but4)
            {
                Data = new DataSource("000040");
            }
            if (but == but6)
            {
                Data = new DataSource("000041");
            }
            if (but == but10)
            {
                Data = new DataSource("000042");
            }

            col.ItemsSource = Data;
            col.Visibility = Visibility.Visible;
            textName.Text = Data[0].yLable;
            num.Text = Convert.ToString(Data[0].PeatsMiDu);
            temp.Content = Data[0].InTemp;
            labTitle.Content = "时间与米象对小麦虫蚀粒率最值图";
            categoryXAxis.ItemsSource = Data;
            HighestValueOverlay.ItemsSource = Data;
            LowestValueOverlay.ItemsSource = Data;
            MeanValueOverlay.ItemsSource = Data;
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
