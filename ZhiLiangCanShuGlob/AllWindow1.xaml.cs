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
    public partial class AllWindow1 : Page
    {
        public AllWindow1()
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
                    Data = new CircleDataSource("000013");
                    model = (new DataSource("000013")).getMiaoShu();
                }
                else if (Convert.ToDouble(comBoxTemp.SelectedItem) == 25)
                {
                    Data = new CircleDataSource("000014");
                    model = (new DataSource("000014")).getMiaoShu();
                }
                else if (Convert.ToDouble(comBoxTemp.SelectedItem) == 27.5)
                {
                    Data = new CircleDataSource("000015");
                    model = (new DataSource("000015")).getMiaoShu();
                }
                else if (Convert.ToDouble(comBoxTemp.SelectedItem) == 30)
                {
                    Data = new CircleDataSource("000016");
                    model = (new DataSource("000016")).getMiaoShu();
                }
            }
            if (but == But12)
            {
                if (Convert.ToDouble(comBoxTemp.SelectedItem) == 20)
                {
                    Data = new CircleDataSource("000017");
                    model = (new DataSource("000017")).getMiaoShu();
                }
                else if (Convert.ToDouble(comBoxTemp.SelectedItem) == 25)
                {
                    Data = new CircleDataSource("000018");
                    model = (new DataSource("000018")).getMiaoShu();
                }
                else if (Convert.ToDouble(comBoxTemp.SelectedItem) == 27.5)
                {
                    Data = new CircleDataSource("000019");
                    model = (new DataSource("000019")).getMiaoShu();
                }
                else if (Convert.ToDouble(comBoxTemp.SelectedItem) == 30)
                {
                    Data = new CircleDataSource("000020");
                    model = (new DataSource("000020")).getMiaoShu();
                }
            }
            if (but == But13)
            {
                if (Convert.ToDouble(comBoxTemp.SelectedItem) == 20)
                {
                    Data = new CircleDataSource("000021");
                    model = (new DataSource("000021")).getMiaoShu();
                }
                else if (Convert.ToDouble(comBoxTemp.SelectedItem) == 25)
                {
                    Data = new CircleDataSource("000022");
                    model = (new DataSource("000022")).getMiaoShu();
                }
                else if (Convert.ToDouble(comBoxTemp.SelectedItem) == 27.5)
                {
                    Data = new CircleDataSource("000023");
                    model = (new DataSource("000023")).getMiaoShu();
                }
                else if (Convert.ToDouble(comBoxTemp.SelectedItem) == 30)
                {
                    Data = new CircleDataSource("000024");
                    model = (new DataSource("000024")).getMiaoShu();
                }
            }
            wheateZhiLiangTeXingHeader.miaoShu.Document = convertToBox.convertStringToFlowDocument(model.chartMiaoShu);
            col.ItemsSource = Data;
            col.Visibility = Visibility.Visible;
            //textName.Content = Data[0].yLable;
            // water.Content = Data[0].Water;
            // temp.Content = Data[0].GrainTemp;
            labTitle.Content = "储藏过程中小麦脂肪酸的变化情况";
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
                    Data = new CircleDataSource("000013");
                    model = (new DataSource("000013")).getMiaoShu();
                }
                else if (Convert.ToDouble(comBoxTemp.SelectedItem) == 25)
                {
                    Data = new CircleDataSource("000014");
                    model = (new DataSource("000014")).getMiaoShu();
                }
                else if (Convert.ToDouble(comBoxTemp.SelectedItem) == 27.5)
                {
                    Data = new CircleDataSource("000015");
                    model = (new DataSource("000015")).getMiaoShu();

                }
                else if (Convert.ToDouble(comBoxTemp.SelectedItem) == 30)
                {
                    Data = new CircleDataSource("000016");
                    model = (new DataSource("000016")).getMiaoShu();
                }
            }
            if (But12.IsChecked == true)
            {
                if (Convert.ToDouble(comBoxTemp.SelectedItem) == 20)
                {
                    Data = new CircleDataSource("000017");
                    model = (new DataSource("000017")).getMiaoShu();
                }
                else if (Convert.ToDouble(comBoxTemp.SelectedItem) == 25)
                {
                    Data = new CircleDataSource("000018");
                    model = (new DataSource("000018")).getMiaoShu();
                }
                else if (Convert.ToDouble(comBoxTemp.SelectedItem) == 27.5)
                {
                    Data = new CircleDataSource("000019");
                    model = (new DataSource("000019")).getMiaoShu();
                }
                else if (Convert.ToDouble(comBoxTemp.SelectedItem) == 30)
                {
                    Data = new CircleDataSource("000020");
                    model = (new DataSource("000020")).getMiaoShu();
                }
            }
            if (But13.IsChecked == true)
            {
                if (Convert.ToDouble(comBoxTemp.SelectedItem) == 20)
                {
                    Data = new CircleDataSource("000021");
                    model = (new DataSource("000021")).getMiaoShu();
                }
                else if (Convert.ToDouble(comBoxTemp.SelectedItem) == 25)
                {
                    Data = new CircleDataSource("000022");
                    model = (new DataSource("000022")).getMiaoShu();
                }
                else if (Convert.ToDouble(comBoxTemp.SelectedItem) == 27.5)
                {
                    Data = new CircleDataSource("000023");
                    model = (new DataSource("000023")).getMiaoShu();
                }
                else if (Convert.ToDouble(comBoxTemp.SelectedItem) == 30)
                {
                    Data = new CircleDataSource("000024");
                    model = (new DataSource("000024")).getMiaoShu();
                }
            }
            wheateZhiLiangTeXingHeader.miaoShu.Document = convertToBox.convertStringToFlowDocument(model.chartMiaoShu);
            col.ItemsSource = Data;
            col.Visibility = Visibility.Visible;
            //textName.Content = Data[0].yLable;
            //water.Content = Data[0].Water;
            //temp.Content = Data[0].GrainTemp;               
            labTitle.Content = "储藏过程中小麦脂肪酸的变化情况";
            categoryXAxis.ItemsSource = Data;
            //HighestValueOverlay.ItemsSource = Data;
            //LowestValueOverlay.ItemsSource = Data;
            //MeanValueOverlay.ItemsSource = Data;
        }

        private void Grid_Load(object sender, RoutedEventArgs e)
        {
            Data = new CircleDataSource("000013");
            model = (new DataSource("000013")).getMiaoShu();
            wheateZhiLiangTeXingHeader.miaoShu.Document = convertToBox.convertStringToFlowDocument(model.chartMiaoShu);
            col.ItemsSource = Data;
            col.Visibility = Visibility.Visible;
            //textName.Content = Data[0].yLable;
            //water.Content = Data[0].Water;
            //temp.Content = Data[0].GrainTemp;               
            labTitle.Content = "储藏过程中小麦脂肪酸的变化情况";
            categoryXAxis.ItemsSource = Data;
            //HighestValueOverlay.ItemsSource = Data;
            //LowestValueOverlay.ItemsSource = Data;
            //MeanValueOverlay.ItemsSource = Data;
        }





    }
}
