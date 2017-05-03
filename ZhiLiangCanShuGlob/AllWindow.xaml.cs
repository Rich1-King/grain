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
using ZhiLiangCanShuDataMember;
using wheateWindow;
using ConvertData;

namespace ZhiLiangCanShuGlob
{
    /// <summary>
    /// AllWindow.xaml 的交互逻辑
    /// </summary>
    public partial class AllWindow : Page
    {
        public AllWindow()
        {
            InitializeComponent();
        }
     
        #region Event Handlers

        private void OnMedianValueOverlayCheckBoxClick(object sender, RoutedEventArgs e)
        {
            CheckBox chb = sender as CheckBox;
            if (chb != null && chb.IsChecked != null)
                this.dataChart.Series["MedianValueOverlay"].Opacity = chb.IsChecked.Value ? 0.5 : 0;
        }
        private void OnMeanValueOverlayCheckBoxClick(object sender, RoutedEventArgs e)
        {
            CheckBox chb = sender as CheckBox;
            if (chb != null && chb.IsChecked != null)
                this.dataChart.Series["MeanValueOverlay"].Opacity = chb.IsChecked.Value ? 0.5 : 0;
        }
        private void OnVarianceValueOverlayCheckBoxClick(object sender, RoutedEventArgs e)
        {
            CheckBox chb = sender as CheckBox;
            if (chb != null && chb.IsChecked != null)
                this.dataChart.Series["VarianceValueOverlay"].Opacity = chb.IsChecked.Value ? 0.5 : 0;
        }
        private void OnHighestValueOverlayCheckBoxClick(object sender, RoutedEventArgs e)
        {
            CheckBox chb = sender as CheckBox;
            if (chb != null && chb.IsChecked != null)
                this.dataChart.Series["HighestValueOverlay"].Opacity = chb.IsChecked.Value ? 0.5 : 0;
        }
        private void OnLowestValueOverlayCheckBoxClick(object sender, RoutedEventArgs e)
        {
            CheckBox chb = sender as CheckBox;
            if (chb != null && chb.IsChecked != null)
                this.dataChart.Series["LowestValueOverlay"].Opacity = chb.IsChecked.Value ? 0.5 : 0;
        }
        private void OnFixedValueOverlayCheckBoxClick(object sender, RoutedEventArgs e)
        {
            CheckBox chb = sender as CheckBox;
            if (chb != null && chb.IsChecked != null)
                this.dataChart.Series["FixedValueOverlay"].Opacity = chb.IsChecked.Value ? 0.5 : 0;
        }
        private void OnEditableValueOverlayCheckBoxClick(object sender, RoutedEventArgs e)
        {
            CheckBox chb = sender as CheckBox;
            // this.DataChart.Series["tt"].Visibility = Visibility.Visible;
            if (chb != null && chb.IsChecked != null)
                this.dataChart.Series["EditableValueOverlay"].Opacity = chb.IsChecked.Value ? 0.5 : 0;
        }
        #endregion

        CircleDataSource Data;
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
                    Data = new CircleDataSource("000025");
                    model = (new DataSource("000025")).getMiaoShu();
                }
                else if (Convert.ToDouble(comBoxTemp.SelectedItem) == 25)
                {
                    Data = new CircleDataSource("000026");
                    model = (new DataSource("000026")).getMiaoShu();
                }
                else if (Convert.ToDouble(comBoxTemp.SelectedItem) == 27.5)
                {
                    Data = new CircleDataSource("000027");
                    model = (new DataSource("000027")).getMiaoShu();
                }
                else if (Convert.ToDouble(comBoxTemp.SelectedItem) == 30)
                {
                    Data = new CircleDataSource("000028");
                    model = (new DataSource("000028")).getMiaoShu();
                }
            }
            if (but == But12)
            {
                if (Convert.ToDouble(comBoxTemp.SelectedItem) == 20)
                {
                    Data = new CircleDataSource("000029");
                    model = (new DataSource("000029")).getMiaoShu();
                }
                else if (Convert.ToDouble(comBoxTemp.SelectedItem) == 25)
                {
                    Data = new CircleDataSource("000030");
                    model = (new DataSource("000030")).getMiaoShu();
                }
                else if (Convert.ToDouble(comBoxTemp.SelectedItem) == 27.5)
                {
                    Data = new CircleDataSource("000031");
                    model = (new DataSource("000031")).getMiaoShu();
                }
                else if (Convert.ToDouble(comBoxTemp.SelectedItem) == 30)
                {
                    Data = new CircleDataSource("000032");
                    model = (new DataSource("000032")).getMiaoShu();
                }
            }
            if (but == But13)
            {
                if (Convert.ToDouble(comBoxTemp.SelectedItem) == 20)
                {
                    Data = new CircleDataSource("000033");
                    model = (new DataSource("000033")).getMiaoShu();
                }
                else if (Convert.ToDouble(comBoxTemp.SelectedItem) == 25)
                {
                    Data = new CircleDataSource("000034");
                    model = (new DataSource("000034")).getMiaoShu();
                }
                else if (Convert.ToDouble(comBoxTemp.SelectedItem) == 27.5)
                {
                    Data = new CircleDataSource("000035");
                    model = (new DataSource("000035")).getMiaoShu();
                }
                else if (Convert.ToDouble(comBoxTemp.SelectedItem) == 30)
                {
                    Data = new CircleDataSource("000036");
                    model = (new DataSource("000036")).getMiaoShu();
                }
            }
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
                    Data = new CircleDataSource("000025");
                    model = (new DataSource("000025")).getMiaoShu();
                }
                else if (Convert.ToDouble(comBoxTemp.SelectedItem) == 25)
                {
                    Data = new CircleDataSource("000026");
                    model = (new DataSource("000026")).getMiaoShu();
                }
                else if (Convert.ToDouble(comBoxTemp.SelectedItem) == 27.5)
                {
                    Data = new CircleDataSource("000027");
                    model = (new DataSource("000027")).getMiaoShu();
                }
                else if (Convert.ToDouble(comBoxTemp.SelectedItem) == 30)
                {
                    Data = new CircleDataSource("000028");
                    model = (new DataSource("000028")).getMiaoShu();
                }
            }
            if (But12.IsChecked == true)
            {
                if (Convert.ToDouble(comBoxTemp.SelectedItem) == 20)
                {
                    Data = new CircleDataSource("000029");
                    model = (new DataSource("000029")).getMiaoShu();
                }
                else if (Convert.ToDouble(comBoxTemp.SelectedItem) == 25)
                {
                    Data = new CircleDataSource("000030");
                    model = (new DataSource("000030")).getMiaoShu();
                }
                else if (Convert.ToDouble(comBoxTemp.SelectedItem) == 27.5)
                {
                    Data = new CircleDataSource("000031");
                    model = (new DataSource("000031")).getMiaoShu();
                }
                else if (Convert.ToDouble(comBoxTemp.SelectedItem) == 30)
                {
                    Data = new CircleDataSource("000032");
                    model = (new DataSource("000032")).getMiaoShu();
                }
            }
            if (But13.IsChecked == true)
            {
                if (Convert.ToDouble(comBoxTemp.SelectedItem) == 20)
                {
                    Data = new CircleDataSource("000033");
                    model = (new DataSource("000033")).getMiaoShu();
                }
                else if (Convert.ToDouble(comBoxTemp.SelectedItem) == 25)
                {
                    Data = new CircleDataSource("000034");
                    model = (new DataSource("000034")).getMiaoShu();
                }
                else if (Convert.ToDouble(comBoxTemp.SelectedItem) == 27.5)
                {
                    Data = new CircleDataSource("000035");
                    model = (new DataSource("000035")).getMiaoShu();
                }
                else if (Convert.ToDouble(comBoxTemp.SelectedItem) == 30)
                {
                    Data = new CircleDataSource("000036");
                    model = (new DataSource("000036")).getMiaoShu();
                }
            }
            wheateZhiLiangTeXingHeader.miaoShu.Document = convertToBox.convertStringToFlowDocument(model.chartMiaoShu);
            col.ItemsSource = Data;
            col.Visibility = Visibility.Visible;
            //textName.Content = Data[0].yLable;
            //water.Content = Data[0].Water;
            //temp.Content = Data[0].GrainTemp;               
            labTitle.Content = "储藏过程中小麦不完善度的变化情况";
            categoryXAxis.ItemsSource = Data;
        }

        private void Grid_Load(object sender, RoutedEventArgs e)
        {
            Data = new CircleDataSource("000025");
            model = (new DataSource("000025")).getMiaoShu();
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

