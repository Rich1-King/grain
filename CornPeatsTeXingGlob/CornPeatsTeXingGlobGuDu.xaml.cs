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
using CornPeatsTeXingDataMember;
using wheateWindow;
using ConvertData;

namespace CornPeatsTeXingGlob
{
    /// <summary>
    /// CornPeatsTeXingGlobGuDu.xaml 的交互逻辑
    /// </summary>
    public partial class CornPeatsTeXingGlobGuDu : Page
    {
        public CornPeatsTeXingGlobGuDu()
        {
            InitializeComponent();
        }
 
 
        CircleDataSource Data;
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
                Data = new CircleDataSource("000037");
                model = (new DataSource("000037")).getMiaoShu();            
            }
            if (but == but6)
            {
                Data = new CircleDataSource("000038");
                model = (new DataSource("000038")).getMiaoShu();  
            }
            if (but == but10)
            {
                Data = new CircleDataSource("000039");
                model = (new DataSource("000039")).getMiaoShu();  
            }
            col.ItemsSource = Data;
            col.Visibility = Visibility.Visible;
            temp.Text = Data[0].InTemp;
            labTitle.Content = "小麦感染谷蠹后虫蚀粒率的变化情况";
            categoryXAxis.ItemsSource = Data;
            wheateHaiChongDuiXiaoMaiYingXiang.miaoShu.Document = convertToBox.convertStringToFlowDocument(model.chartMiaoShu);
            
           
        }

        private void DataChart_Load(object sender, RoutedEventArgs e)
        {
            Data = new CircleDataSource("000037");
            col.ItemsSource = Data;
            col.Visibility = Visibility.Visible;
            temp.Text = Data[0].InTemp;
            labTitle.Content = "小麦感染谷蠹后虫蚀粒率的变化情况";
            categoryXAxis.ItemsSource = Data;
            model = (new DataSource("000037")).getMiaoShu();
            wheateHaiChongDuiXiaoMaiYingXiang.miaoShu.Document = convertToBox.convertStringToFlowDocument(model.chartMiaoShu);
        }
    }
}
