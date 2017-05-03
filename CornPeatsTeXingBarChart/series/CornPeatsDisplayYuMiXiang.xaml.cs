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
    /// CornPeatsDisplayYuMiXiang.xaml 的交互逻辑
    /// </summary>
    public partial class CornPeatsDisplayYuMiXiang : Page
    {
        public CornPeatsDisplayYuMiXiang()
        {
            InitializeComponent();
        }
        DataSource Data;
        XiaoMaiDisplayModel model;
        ConvertStringToRichTextBox convertToBox = new ConvertStringToRichTextBox();
        private void Button_Click(object sender, RoutedEventArgs e)
        {

            RadioButton but = sender as RadioButton;

            but0.IsChecked = false;
            but2.IsChecked = false;
            but5.IsChecked = false;
            but10.IsChecked = false;
            but.IsChecked = true;

            if (Convert.ToInt16(temp.SelectedItem) == 20)
            {
                if (but == but0)
                {
                    Data = new DataSource("000043");
                }
                else if (but == but2)
                {
                    Data = new DataSource("000044");
                }
                else if (but == but5)
                {
                    Data = new DataSource("000045");
                }
                else if (but == but10)
                {
                    Data = new DataSource("000046");
                }
                else
                {
                    MessageBox.Show("没有数据");
                    return;
                }

            }
            else if (Convert.ToInt16(temp.SelectedItem) == 25)
            {
                if (but == but0)
                {
                    Data = new DataSource("000047");
                }
                else if (but == but2)
                {
                    Data = new DataSource("000048");
                }
                else if (but == but5)
                {
                    Data = new DataSource("000049");
                }
                else if (but == but10)
                {
                    Data = new DataSource("000050");
                }
                else
                {
                    MessageBox.Show("没有数据");
                    return;
                }
            }
            else
            {
                MessageBox.Show("没有数据");
                return;
            }

            col.ItemsSource = Data;
            col.Visibility = Visibility.Visible;
            //textName.Text = Data[0].yLable;
            // num.Content = Data[0].PeatsMiDu;
            //temp.Text = Data[0].InTemp;
            labTitle.Content = "小麦感染玉米象后容重的变化情况";
            categoryXAxis.ItemsSource = Data;
            model = Data.getMiaoShu();
            wheateHaiChongDuiXiaoMaiYingXiang.miaoShu.Document = convertToBox.convertStringToFlowDocument(model.chartMiaoShu);
          
        }


        private void DataChart_Loaded(object sender, RoutedEventArgs e)
        {

        }
        private void temp_load(object sender, RoutedEventArgs e)
        {
            int[] tempValue = new int[2];
            tempValue[0] = 20;
            tempValue[1] = 25;
            temp.ItemsSource = tempValue;
        }

        private void temp_Changed(object sender, EventArgs e)
        {

            if (Convert.ToInt16(temp.SelectedItem) == 20)
            {
                if (but0.IsChecked == true)
                {
                    Data = new DataSource("000043");
                }
                else if (but2.IsChecked == true)
                {
                    Data = new DataSource("000044");
                }
                else if (but5.IsChecked == true)
                {
                    Data = new DataSource("000045");
                }
                else if (but10.IsChecked == true)
                {
                    Data = new DataSource("000046");
                }
                else
                {
                    MessageBox.Show("没有数据");
                    return;
                }

            }
            else if (Convert.ToInt16(temp.SelectedItem) == 25)
            {
                if (but0.IsChecked == true)
                {
                    Data = new DataSource("000047");
                }
                else if (but2.IsChecked == true)
                {
                    Data = new DataSource("000048");
                }
                else if (but5.IsChecked == true)
                {
                    Data = new DataSource("000049");
                }
                else if (but10.IsChecked == true)
                {
                    Data = new DataSource("000050");
                }
                else
                {
                    MessageBox.Show("没有数据");
                    return;
                }
            }
            else
            {
                MessageBox.Show("没有数据");
                return;
            }

            col.ItemsSource = Data;
            col.Visibility = Visibility.Visible;
            //textName.Text = Data[0].yLable;
            // num.Content = Data[0].PeatsMiDu;
            // temp.Text = Data[0].InTemp;
            labTitle.Content = "小麦感染玉米象后容重的变化情况";
            categoryXAxis.ItemsSource = Data;
            model = Data.getMiaoShu();
            wheateHaiChongDuiXiaoMaiYingXiang.miaoShu.Document = convertToBox.convertStringToFlowDocument(model.chartMiaoShu);
          
        }

    }
}