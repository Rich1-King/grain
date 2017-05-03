
using DataMember;
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
using wheateWindow;
using ConvertData;
namespace Glob
{
    /// <summary>
    /// AllWindow.xaml 的交互逻辑
    /// </summary>
    public partial class AllWindow : Infragistics.Samples.Framework.SampleContainer
    {

        CircleDataSource yData;
        CircleDataSource y1Data;
        CircleDataSource y2Data;
        CircleDataSource y3Data;
     
        XiaoMaiDisplayModel model;
        XiaoMaiDisplayModel model1;
        XiaoMaiDisplayModel model2;
        XiaoMaiDisplayModel model3;
        ConvertStringToRichTextBox convertToBox = new ConvertStringToRichTextBox();
        public AllWindow()
        {
            InitializeComponent();

            try
            {
                yData = new CircleDataSource("000051");
                model = (new DataSource("000051")).getMiaoShu();
                y1Data = new CircleDataSource("000052");
                model1 = (new DataSource("000052")).getMiaoShu();
                y2Data = new CircleDataSource("000053");
                model2 = (new DataSource("000053")).getMiaoShu();
                y3Data = new CircleDataSource("000054");
                model3 = (new DataSource("000054")).getMiaoShu();
            }
            catch (Exception e)
            {
                MessageBox.Show(e.Message);
            }
        }

     
   
        private void Grid_Loaded(object sender, RoutedEventArgs e)
        {     
 
        }
     
        private void LayoutRoot_Loaded(object sender, RoutedEventArgs e)
        {
            colGrain.ItemsSource = yData;
            colCorn.ItemsSource = y1Data;
            colRice.ItemsSource = y2Data;
            colTCC.ItemsSource = y3Data;
            wheatePeatsZongQunHeader.miaoShu.Document = convertToBox.convertStringToFlowDocument(model2.chartMiaoShu);
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
             
       
            RadioButton but = sender as RadioButton;
            butRice.IsChecked = false;
            butCorn.IsChecked = false;
            butGrain.IsChecked = false;
            butTcc.IsChecked = false;
            but.IsChecked = true;
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

                labTitle.Content = "常温条件下当初始虫口密度为2头/kg时不同储存时间的储粮害虫谷蠹种群数量情况";
                wheatePeatsZongQunHeader.miaoShu.Document = convertToBox.convertStringToFlowDocument(model1.chartMiaoShu);
                
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

                labTitle.Content = "常温条件下当初始虫口密度为2头/kg时不同储存时间的储粮害虫米象种群数量情况";
                wheatePeatsZongQunHeader.miaoShu.Document = convertToBox.convertStringToFlowDocument(model2.chartMiaoShu);
            }
            if (but == butGrain)
            {
                if (colCorn != null && colCorn.Visibility == Visibility.Visible)
                {
                    colCorn.Visibility = Visibility.Hidden;
                }

                if (colGrain != null && colGrain.Visibility == Visibility.Hidden)
                {
                    colGrain.Visibility = Visibility.Visible;
                }
                if (colRice != null && colRice.Visibility == Visibility.Visible)
                {
                    colRice.Visibility = Visibility.Hidden;
                }
                if (colTCC != null && colTCC.Visibility == Visibility.Visible)
                {
                    colTCC.Visibility = Visibility.Hidden;
                }

                labTitle.Content = "常温条件下当初始虫口密度为2头/kg时不同储存时间的储粮害虫玉米象种群数量情况";
                wheatePeatsZongQunHeader.miaoShu.Document = convertToBox.convertStringToFlowDocument(model.chartMiaoShu);
            
            }
            if (but == butTcc)
            {
                if (colCorn != null && colCorn.Visibility == Visibility.Visible)
                {
                    colCorn.Visibility = Visibility.Hidden;
                }

                if (colGrain != null && colGrain.Visibility == Visibility.Visible)
                {
                    colGrain.Visibility = Visibility.Hidden;
                }
                if (colRice != null && colRice.Visibility == Visibility.Visible)
                {
                    colRice.Visibility = Visibility.Hidden;
                }
                if (colTCC != null && colTCC.Visibility == Visibility.Hidden)
                {
                    colTCC.Visibility = Visibility.Visible;
                }

                labTitle.Content = "常温条件下当初始虫口密度为2头/kg时不同储存时间的储粮害虫赤拟谷盗种群数量情况";
                wheatePeatsZongQunHeader.miaoShu.Document = convertToBox.convertStringToFlowDocument(model3.chartMiaoShu);
            }
        
        }

        private void display_Load(object sender, RoutedEventArgs e)
        {
            //Frame frame = new Frame();
            //frame.Source = new Uri("pack://application:,,,/Glob;component/Title/Title1.xaml");

            //if (display.Children.Count > 0)
            //{
            //    display.Children.Clear();
            //}
            //display.Children.Add(frame);
        }
    }
}