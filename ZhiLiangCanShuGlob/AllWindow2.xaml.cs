
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
    public partial class AllWindow2 : Page
    {
        public AllWindow2()
        {
            InitializeComponent();
        }
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
                    Data = new CircleDataSource("000001");
                    model = (new DataSource("000001")).getMiaoShu();
                }
                else if (Convert.ToDouble(comBoxTemp.SelectedItem) == 25)
                {
                    Data = new CircleDataSource("000002");
                    model = (new DataSource("000002")).getMiaoShu();
                }
                else if (Convert.ToDouble(comBoxTemp.SelectedItem) == 27.5)
                {
                    Data = new CircleDataSource("000003");
                    model = (new DataSource("000003")).getMiaoShu();
                }
                else if (Convert.ToDouble(comBoxTemp.SelectedItem) == 30)
                {
                    Data = new CircleDataSource("000004");
                    model = (new DataSource("000004")).getMiaoShu();
                }
            }
            if (but == But12)
            {
                if (Convert.ToDouble(comBoxTemp.SelectedItem) == 20)
                {
                    Data = new CircleDataSource("000005");
                    model = (new DataSource("000005")).getMiaoShu();
                }
                else if (Convert.ToDouble(comBoxTemp.SelectedItem) == 25)
                {
                    Data = new CircleDataSource("000006");
                    model = (new DataSource("000006")).getMiaoShu();
                }
                else if (Convert.ToDouble(comBoxTemp.SelectedItem) == 27.5)
                {
                    Data = new CircleDataSource("000007");
                    model = (new DataSource("000007")).getMiaoShu();
                }
                else if (Convert.ToDouble(comBoxTemp.SelectedItem) == 30)
                {
                    Data = new CircleDataSource("000008");
                    model = (new DataSource("000008")).getMiaoShu();
                }
            }
            if (but == But13)
            {
                if (Convert.ToDouble(comBoxTemp.SelectedItem) == 20)
                {
                    Data = new CircleDataSource("000009");
                    model = (new DataSource("000009")).getMiaoShu();
                }
                else if (Convert.ToDouble(comBoxTemp.SelectedItem) == 25)
                {
                    Data = new CircleDataSource("000010");
                    model = (new DataSource("0000010")).getMiaoShu();
                }
                else if (Convert.ToDouble(comBoxTemp.SelectedItem) == 27.5)
                {
                    Data = new CircleDataSource("000011");
                    model = (new DataSource("000011")).getMiaoShu();
                }
                else if (Convert.ToDouble(comBoxTemp.SelectedItem) == 30)
                {
                    Data = new CircleDataSource("000012");
                    model = (new DataSource("000012")).getMiaoShu();
                }
            }

            wheateZhiLiangTeXingHeader.miaoShu.Document = convertToBox.convertStringToFlowDocument(model.chartMiaoShu);
            col.ItemsSource = Data;
            col.Visibility = Visibility.Visible;
            // textName.Content = Data[0].yLable;
            // water.Content = Data[0].Water;
            // temp.Content = Data[0].GrainTemp;
            labTitle.Content = "储藏过程中小麦面筋吸水率的变化情况";
            categoryXAxis.ItemsSource = Data;
            //HighestValueOverlay.ItemsSource = Data;
            //LowestValueOverlay.ItemsSource = Data;
            //MeanValueOverlay.ItemsSource = Data;

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
                    Data = new CircleDataSource("000001");
                    model = (new DataSource("000001")).getMiaoShu();
                }
                else if (Convert.ToDouble(comBoxTemp.SelectedItem) == 25)
                {
                    Data = new CircleDataSource("000002");
                    model = (new DataSource("000002")).getMiaoShu();
                }
                else if (Convert.ToDouble(comBoxTemp.SelectedItem) == 27.5)
                {
                    Data = new CircleDataSource("000003");
                    model = (new DataSource("000003")).getMiaoShu();
                }
                else if (Convert.ToDouble(comBoxTemp.SelectedItem) == 30)
                {
                    Data = new CircleDataSource("000004");
                    model = (new DataSource("000004")).getMiaoShu();
                }
            }
            if (But12.IsChecked == true)
            {
                if (Convert.ToDouble(comBoxTemp.SelectedItem) == 20)
                {
                    Data = new CircleDataSource("000005");
                    model = (new DataSource("000005")).getMiaoShu();
                }
                else if (Convert.ToDouble(comBoxTemp.SelectedItem) == 25)
                {
                    Data = new CircleDataSource("000006");
                    model = (new DataSource("000006")).getMiaoShu();
                }
                else if (Convert.ToDouble(comBoxTemp.SelectedItem) == 27.5)
                {
                    Data = new CircleDataSource("000007");
                    model = (new DataSource("000007")).getMiaoShu();
                }
                else if (Convert.ToDouble(comBoxTemp.SelectedItem) == 30)
                {
                    Data = new CircleDataSource("000008");
                    model = (new DataSource("000008")).getMiaoShu();
                }
            }
            if (But13.IsChecked == true)
            {
                if (Convert.ToDouble(comBoxTemp.SelectedItem) == 20)
                {
                    Data = new CircleDataSource("000009");
                    model = (new DataSource("000009")).getMiaoShu();
                }
                else if (Convert.ToDouble(comBoxTemp.SelectedItem) == 25)
                {
                    Data = new CircleDataSource("000010");
                    model = (new DataSource("000010")).getMiaoShu();
                }
                else if (Convert.ToDouble(comBoxTemp.SelectedItem) == 27.5)
                {
                    Data = new CircleDataSource("000011");
                    model = (new DataSource("000011")).getMiaoShu();
                }
                else if (Convert.ToDouble(comBoxTemp.SelectedItem) == 30)
                {
                    Data = new CircleDataSource("000012");
                    model = (new DataSource("000012")).getMiaoShu();
                }
            }
            wheateZhiLiangTeXingHeader.miaoShu.Document = convertToBox.convertStringToFlowDocument(model.chartMiaoShu);
            col.ItemsSource = Data;
            col.Visibility = Visibility.Visible;
            //textName.Content = Data[0].yLable;
            //water.Content = Data[0].Water;
            //temp.Content = Data[0].GrainTemp;
            labTitle.Content = "储藏过程中小麦面筋吸水率的变化情况";
            categoryXAxis.ItemsSource = Data;
            //HighestValueOverlay.ItemsSource = Data;
            //LowestValueOverlay.ItemsSource = Data;
            //MeanValueOverlay.ItemsSource = Data;
        }


        private void Grid_Loaded(object sender, RoutedEventArgs e)
        {
            Data = new CircleDataSource("000001");
            model = (new DataSource("000001")).getMiaoShu();
            wheateZhiLiangTeXingHeader.miaoShu.Document = convertToBox.convertStringToFlowDocument(model.chartMiaoShu);
            col.ItemsSource = Data;
            col.Visibility = Visibility.Visible;
            //textName.Content = Data[0].yLable;
            //water.Content = Data[0].Water;
            // temp.Content = Data[0].GrainTemp;
            labTitle.Content = "储藏过程中小麦面筋吸水率的变化情况";
            categoryXAxis.ItemsSource = Data;
            //HighestValueOverlay.ItemsSource = Data;
            //LowestValueOverlay.ItemsSource = Data;
            //MeanValueOverlay.ItemsSource = Data;
        }

    }
}
