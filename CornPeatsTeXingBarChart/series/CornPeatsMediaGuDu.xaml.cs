using CornPeatsTeXingDataMember;
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
using System.Windows.Navigation;
using System.Windows.Shapes;
using wheateWindow;
using ConvertData;

namespace CornPeatsTeXingBarChart.series
{
    /// <summary>
    /// CornPeatsMediaGuDu.xaml 的交互逻辑
    /// </summary>
    public partial class CornPeatsMediaGuDu : Page
    {
        public CornPeatsMediaGuDu()
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
            but4.IsChecked = false;
            but6.IsChecked = false;
            but10.IsChecked = false;
            but.IsChecked = true;
            if (but == but4)
            {
                Data = new DataSource("000037");
            }
            if (but == but6)
            {
                Data = new DataSource("000038");
            }
            if (but == but10)
            {
                Data = new DataSource("000039");
            }


            col.ItemsSource = Data;
            col.Visibility = Visibility.Visible;
            //textName.Text = Data[0].yLable;
            // num.Content = Data[0].PeatsMiDu;
            temp.Text = Data[0].InTemp;
            labTitle.Content = "小麦感染谷蠹后虫蚀粒率的变化情况";
            categoryXAxis.ItemsSource = Data;
            HighestValueOverlay.ItemsSource = Data;
            LowestValueOverlay.ItemsSource = Data;
            MeanValueOverlay.ItemsSource = Data;
            model = Data.getMiaoShu();
            wheateHaiChongDuiXiaoMaiYingXiang.miaoShu.Document = convertToBox.convertStringToFlowDocument(model.chartMiaoShu);
        }

        private void DataChart_Loaded(object sender, RoutedEventArgs e)
        {
            Data = new DataSource("000037");
            col.ItemsSource = Data;
            col.Visibility = Visibility.Visible;
            //textName.Text = Data[0].yLable;
            // num.Content = Data[0].PeatsMiDu;
            temp.Text = Data[0].InTemp;
            labTitle.Content = "小麦感染谷蠹后虫蚀粒率的变化情况";
            categoryXAxis.ItemsSource = Data;
            HighestValueOverlay.ItemsSource = Data;
            LowestValueOverlay.ItemsSource = Data;
            MeanValueOverlay.ItemsSource = Data;
            model = Data.getMiaoShu();
            wheateHaiChongDuiXiaoMaiYingXiang.miaoShu.Document = convertToBox.convertStringToFlowDocument(model.chartMiaoShu);
        }

        private void display_Loaded(object sender, RoutedEventArgs e)
        {
            Frame frame = new Frame();
            frame.Source = new Uri("pack://application:,,,/BiaoShiPage;component/ZuiZhiBiaoShiPage.xaml");

            if (display.Children.Count > 0)
            {
                display.Children.Clear();
            }
            display.Children.Add(frame);
        }
          
    }
}
