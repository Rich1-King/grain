using System.Windows;
using System.Windows.Controls;
using ZhiLiangCanShuDataMember;
using Infragistics.Controls.Charts;
using System.Windows.Media;
using System;
using System.Collections.Generic;
using wheateWindow;
using ConvertData;
namespace ZhiLiangCanShuBarChart.series
{
    public partial class ValueOverlays : Page
    {
        public ValueOverlays()
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
        XiaoMaiDisplayModel model;
        ConvertStringToRichTextBox convertToBox = new ConvertStringToRichTextBox();


        private void Button_Click(object sender, RoutedEventArgs e)
        {
            RadioButton but = sender as RadioButton;
            But11.IsChecked = false;
            But12.IsChecked = false;
            But13.IsChecked = false;
            but.IsChecked = true;
            if (but == But11)
            {
                if (Convert.ToDouble(comBoxTemp.SelectedItem) == 20)
                {
                    Data = new DataSource("000025");
                }
                else if (Convert.ToDouble(comBoxTemp.SelectedItem) == 25)
                {
                    Data = new DataSource("000026");
                }
                else if (Convert.ToDouble(comBoxTemp.SelectedItem) == 27.5)
                {
                    Data = new DataSource("000027");
                }
                else if (Convert.ToDouble(comBoxTemp.SelectedItem) == 30)
                {
                    Data = new DataSource("000028");
                }
            }
            if (but == But12)
            {
                if (Convert.ToDouble(comBoxTemp.SelectedItem) == 20)
                {
                    Data = new DataSource("000029");
                }
                else if (Convert.ToDouble(comBoxTemp.SelectedItem) == 25)
                {
                    Data = new DataSource("000030");
                }
                else if (Convert.ToDouble(comBoxTemp.SelectedItem) == 27.5)
                {
                    Data = new DataSource("000031");
                }
                else if (Convert.ToDouble(comBoxTemp.SelectedItem) == 30)
                {
                    Data = new DataSource("000032");
                }
            }
            if (but == But13)
            {
                if (Convert.ToDouble(comBoxTemp.SelectedItem) == 20)
                {
                    Data = new DataSource("000033");
                }
                else if (Convert.ToDouble(comBoxTemp.SelectedItem) == 25)
                {
                    Data = new DataSource("000034");
                }
                else if (Convert.ToDouble(comBoxTemp.SelectedItem) == 27.5)
                {
                    Data = new DataSource("000035");
                }
                else if (Convert.ToDouble(comBoxTemp.SelectedItem) == 30)
                {
                    Data = new DataSource("000036");
                }
            }
            model = Data.getMiaoShu();
            wheateZhiLiangTeXingHeader.miaoShu.Document = convertToBox.convertStringToFlowDocument(model.chartMiaoShu);
            col.ItemsSource = Data;
            col.Visibility = Visibility.Visible;
            //textName.Content = Data[0].yLable;
            //water.Content = Data[0].Water;
            //temp.Content = Data[0].GrainTemp;               
            labTitle.Content = "储藏过程中小麦不完善度的变化情况";
            categoryXAxis.ItemsSource = Data;
          

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
                if (Convert.ToDouble(comBoxTemp.SelectedItem) == 20)
                {
                    Data = new DataSource("000025");
                }
                else if (Convert.ToDouble(comBoxTemp.SelectedItem) == 25)
                {
                    Data = new DataSource("000026");
                }
                else if (Convert.ToDouble(comBoxTemp.SelectedItem) == 27.5)
                {
                    Data = new DataSource("000027");
                }
                else if (Convert.ToDouble(comBoxTemp.SelectedItem) == 30)
                {
                    Data = new DataSource("000028");
                }
            }
            if (But12.IsChecked == true)
            {
                if (Convert.ToDouble(comBoxTemp.SelectedItem) == 20)
                {
                    Data = new DataSource("000029");
                }
                else if (Convert.ToDouble(comBoxTemp.SelectedItem) == 25)
                {
                    Data = new DataSource("000030");
                }
                else if (Convert.ToDouble(comBoxTemp.SelectedItem) == 27.5)
                {
                    Data = new DataSource("000031");
                }
                else if (Convert.ToDouble(comBoxTemp.SelectedItem) == 30)
                {
                    Data = new DataSource("000032");
                }
            }
            if (But13.IsChecked == true)
            {
                if (Convert.ToDouble(comBoxTemp.SelectedItem) == 20)
                {
                    Data = new DataSource("000033");
                }
                else if (Convert.ToDouble(comBoxTemp.SelectedItem) == 25)
                {
                    Data = new DataSource("000034");
                }
                else if (Convert.ToDouble(comBoxTemp.SelectedItem) == 27.5)
                {
                    Data = new DataSource("000035");
                }
                else if (Convert.ToDouble(comBoxTemp.SelectedItem) == 30)
                {
                    Data = new DataSource("000036");
                }
            }
            model = Data.getMiaoShu();
            wheateZhiLiangTeXingHeader.miaoShu.Document = convertToBox.convertStringToFlowDocument(model.chartMiaoShu);
            col.ItemsSource = Data;
            col.Visibility = Visibility.Visible;
            //textName.Content = Data[0].yLable;
            //water.Content = Data[0].Water;
            //temp.Content = Data[0].GrainTemp;               
            labTitle.Content = "储藏过程中小麦不完善度的变化情况";
            categoryXAxis.ItemsSource = Data; 
        }

        private void Grid_load(object sender, RoutedEventArgs e)
        {
            Data = new DataSource("000025");
            model = Data.getMiaoShu();
            wheateZhiLiangTeXingHeader.miaoShu.Document = convertToBox.convertStringToFlowDocument(model.chartMiaoShu);
            col.ItemsSource = Data;
            col.Visibility = Visibility.Visible;
            //textName.Content = Data[0].yLable;
            //water.Content = Data[0].Water;
            //temp.Content = Data[0].GrainTemp;               
            labTitle.Content = "储藏过程中小麦不完善度的变化情况";
            categoryXAxis.ItemsSource = Data;
        }


    }
}

