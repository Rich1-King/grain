using DaoGuWindow;
using DataBaseControl;
using DataModel;
using Infragistics.Controls.Charts;
using Infragistics.Samples.Shared.Converters;
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
using XAndYAxis;
using ConvertData;

namespace DaoGuChart
{
    /// <summary>
    /// SelectZhiLiangCanShuPage.xaml 的交互逻辑
    /// </summary>
    public partial class SelectZhiLiangCanShuPage : Page
    {
        public SelectZhiLiangCanShuPage()
        {
            InitializeComponent();
            dataChart = DaoGuDisplay.xamDataChart;
            dataSource = new DataSource();
        }

        private XamDataChart dataChart;
        private InitData data;
        private DataSource dataSource;
        private XAxis xAxis;
        private YAxis yAxis;
        private TitleModel title;
        private List<DaoGuZhiLiangTeXingModel> models;
        private List<DaoGuZhiLiangTeXingModel> predictModels;
        private void Grid_Load(object sender, RoutedEventArgs e)
        {
            biaoShi_Loaded();
            data = new InitData();
            data.comLabelText = "水分:";
            List<string> shuiFenTexts = new List<string>();
            shuiFenTexts.Add("13.5%");
            shuiFenTexts.Add("14.5%");
            shuiFenTexts.Add("15.5%");
            shuiFenTexts.Add("16.5%");  
            data.comTexts = shuiFenTexts;
            data.radioCheck1Text = "温度15℃";
            data.radioCheck2Text = "20℃";
            data.radioCheck3Text = "25℃";
            data.radioCheck4Text = "30℃";
            InitPage(data);
            if (dataChart.Series.Count > 0)
            {
                dataChart.Series.Clear();
            }
            switch (DaoGuMainPage.yType)
            {
                case 2:
                    setTitle("稻谷质量特性参数坐标轴描述表", "000065");
                    models = dataSource.getDaoGuZhiLiangTeXingData("000065");
                    break;
                   
                case 3:
                    setTitle("稻谷质量特性参数坐标轴描述表", "000081");
                    models = dataSource.getDaoGuZhiLiangTeXingData("000081");
                    break;

                  
                case 4:
                     setTitle("稻谷质量特性参数坐标轴描述表", "000097");
                    models = dataSource.getDaoGuZhiLiangTeXingData("000097");
                    break;
                  
                case 5:
                     setTitle("稻谷质量特性参数坐标轴描述表", "000049");
                    models = dataSource.getDaoGuZhiLiangTeXingData("000049");
                    break;
                
                default:
                    MessageBox.Show("加载出错!!!");
                    return;
            }

            
            switch (DaoGuTeXingCanShuPage.type)
            {
                case 1:
                    setAxes(models);
                    InitBarChart(models);
                    InitLineBar(models, "low");
                    InitLineBar(models, "high");
                    InitLineBar(models, "media");
                    break;
                case 2:
                    setAddToSpeedAxes(models);
                    InitAddToSpeedSpline(models);
                    break;
                case 3:
                    setAxes(models);
                    InitSpline(models,MarkerType.None);
                    break;
                case 4:
                    setAxes(models);
                    InitSpline(models,MarkerType.None);
                    break;
                case 5:
                    setAxes(models);
                    InitBarChart(models);
                    break;
                case 6:
                    setAxes(models);
                    InitLine(models);
                    break;
                case 7:
                    InitDongTai(models);
                    break;
                case 8:
                    setBubbleAxes(models);
                    InitBubble(models);
                    break;
                case 9:
                    dayGrid.Visibility = Visibility.Visible;
                    initPredictDay();
                    //predictModels = dataSource.getPredictDataAfterTime(models,); 
                    break;
                case 10:
                    dateGrid.Visibility = Visibility.Visible;
                    break;
                case 11:
                    predictPanDuan();
                    break;
                case 12:
                    dayGrid.Visibility = Visibility.Visible;
                    initPredictDay();
                    break;
                default:
                    MessageBox.Show("没有数据");
                    break;
            }
           
        }

        private bool flag = true;
        private void selcted_Changde(object sender, SelectionChangedEventArgs e)
        {
            if (flag == true)
            {
                flag = false;
                return;
            }
            panDuan();
        }
        private void Check_Click(object sender, RoutedEventArgs e)
        {
            RadioButton but = sender as RadioButton;
            check1.IsChecked = false;
            check2.IsChecked = false;
            check3.IsChecked = false;
            check4.IsChecked = false;
            but.IsChecked = true;
            panDuan();
        }
        private void panDuan()
        {
            biaoShi_Loaded();
            if (dataChart.Series.Count > 0)
            {
                dataChart.Series.Clear();
            }
            switch (DaoGuMainPage.yType)
            {
                case 2:
                    switch (com.SelectedIndex)
                    {
                        case 0:
                            if (check1.IsChecked == true)
                            {
                                setTitle("稻谷质量特性参数坐标轴描述表", "000065");
                                models = dataSource.getDaoGuZhiLiangTeXingData("000065");
                            }
                            else if (check2.IsChecked == true)
                            {
                                setTitle("稻谷质量特性参数坐标轴描述表", "000066");
                                models = dataSource.getDaoGuZhiLiangTeXingData("000066");
                            }
                            else if (check3.IsChecked == true)
                            {
                                setTitle("稻谷质量特性参数坐标轴描述表", "000067");
                                models = dataSource.getDaoGuZhiLiangTeXingData("000067");
                            }
                            else if (check4.IsChecked == true)
                            {
                                setTitle("稻谷质量特性参数坐标轴描述表", "000068");
                                models = dataSource.getDaoGuZhiLiangTeXingData("000068");
                            }
                            else
                            {
                                MessageBox.Show("获取数据失败!");
                                return;
                            }
                            break;
                        case 1:
                            if (check1.IsChecked == true)
                            {
                                setTitle("稻谷质量特性参数坐标轴描述表", "000069");
                                models = dataSource.getDaoGuZhiLiangTeXingData("000069");
                            }
                            else if (check2.IsChecked == true)
                            {
                                setTitle("稻谷质量特性参数坐标轴描述表", "000070");
                                models = dataSource.getDaoGuZhiLiangTeXingData("000070");
                            }
                            else if (check3.IsChecked == true)
                            {
                                setTitle("稻谷质量特性参数坐标轴描述表", "000071");
                                models = dataSource.getDaoGuZhiLiangTeXingData("000071");
                            }
                            else if (check4.IsChecked == true)
                            {
                                setTitle("稻谷质量特性参数坐标轴描述表", "000072");
                                models = dataSource.getDaoGuZhiLiangTeXingData("000072");
                            }
                            else
                            {
                                MessageBox.Show("获取数据失败!");
                                return;
                                //setTitle("稻谷质量特性参数坐标轴描述表", "000068");
                                //models = dataSource.getDaoGuZhiLiangTeXingData("000068");
                            }
                            break;
                        case 2:
                            if (check1.IsChecked == true)
                            {
                                setTitle("稻谷质量特性参数坐标轴描述表", "000073");
                                models = dataSource.getDaoGuZhiLiangTeXingData("000073");
                            }
                            else if (check2.IsChecked == true)
                            {
                                setTitle("稻谷质量特性参数坐标轴描述表", "000074");
                                models = dataSource.getDaoGuZhiLiangTeXingData("000074");
                            }
                            else if (check3.IsChecked == true)
                            {
                                setTitle("稻谷质量特性参数坐标轴描述表", "000075");
                                models = dataSource.getDaoGuZhiLiangTeXingData("000075");
                            }
                            else if (check4.IsChecked == true)
                            {
                                setTitle("稻谷质量特性参数坐标轴描述表", "000076");
                                models = dataSource.getDaoGuZhiLiangTeXingData("000076");
                            }
                            else
                            {
                                MessageBox.Show("获取数据失败!");
                                return;
                            }
                            break;
                        case 3:
                            if (check1.IsChecked == true)
                            {
                                setTitle("稻谷质量特性参数坐标轴描述表", "000077");
                                models = dataSource.getDaoGuZhiLiangTeXingData("000077");
                            }
                            else if (check2.IsChecked == true)
                            {
                                setTitle("稻谷质量特性参数坐标轴描述表", "000078");
                                models = dataSource.getDaoGuZhiLiangTeXingData("000078");
                            }
                            else if (check3.IsChecked == true)
                            {
                                setTitle("稻谷质量特性参数坐标轴描述表", "000079");
                                models = dataSource.getDaoGuZhiLiangTeXingData("000079");
                            }
                            else if (check4.IsChecked == true)
                            {
                                setTitle("稻谷质量特性参数坐标轴描述表", "000080");
                                models = dataSource.getDaoGuZhiLiangTeXingData("000080");
                            }
                            else
                            {
                                MessageBox.Show("获取数据失败!");
                                return;
                            }
                            break;
                        default:
                            break;
                    }
                    break;
                case 3:
                    switch (com.SelectedIndex)
                    {
                        case 0:
                            if (check1.IsChecked == true)
                            {
                                setTitle("稻谷质量特性参数坐标轴描述表", "000081");
                                models = dataSource.getDaoGuZhiLiangTeXingData("000081");
                                break;
                            }
                            else if (check2.IsChecked == true)
                            {
                                setTitle("稻谷质量特性参数坐标轴描述表", "000082");
                                models = dataSource.getDaoGuZhiLiangTeXingData("000082");
                                break;
                            }
                            else if (check3.IsChecked == true)
                            {
                                setTitle("稻谷质量特性参数坐标轴描述表", "000083");
                                models = dataSource.getDaoGuZhiLiangTeXingData("000083");
                                break;
                            }
                            else if (check4.IsChecked == true)
                            {
                                setTitle("稻谷质量特性参数坐标轴描述表", "000084");
                                models = dataSource.getDaoGuZhiLiangTeXingData("000084");
                                break;
                            }
                            else
                            {
                                MessageBox.Show("获取数据失败!");
                                return;
                            }
                       
                        case 1:
                            if (check1.IsChecked == true)
                            {
                                setTitle("稻谷质量特性参数坐标轴描述表", "000085");
                                models = dataSource.getDaoGuZhiLiangTeXingData("000085");
                                break;
                            }
                            else if (check2.IsChecked == true)
                            {
                                setTitle("稻谷质量特性参数坐标轴描述表", "000086");
                                models = dataSource.getDaoGuZhiLiangTeXingData("000086");
                                break;
                            }
                            else if (check3.IsChecked == true)
                            {
                                setTitle("稻谷质量特性参数坐标轴描述表", "000087");
                                models = dataSource.getDaoGuZhiLiangTeXingData("000087");
                                break;
                            }
                            else if (check4.IsChecked == true)
                            {
                                setTitle("稻谷质量特性参数坐标轴描述表", "000088");
                                models = dataSource.getDaoGuZhiLiangTeXingData("000088");
                                break;
                            }
                            else
                            {
                                MessageBox.Show("获取数据失败!");
                                return;
                            }
                          
                        case 2:
                            if (check1.IsChecked == true)
                            {
                                setTitle("稻谷质量特性参数坐标轴描述表", "000089");
                                models = dataSource.getDaoGuZhiLiangTeXingData("000089");
                                break;
                            }
                            else if (check2.IsChecked == true)
                            {
                                setTitle("稻谷质量特性参数坐标轴描述表", "000090");
                                models = dataSource.getDaoGuZhiLiangTeXingData("000090");
                                break;
                            }
                            else if (check3.IsChecked == true)
                            {
                                setTitle("稻谷质量特性参数坐标轴描述表", "000091");
                                models = dataSource.getDaoGuZhiLiangTeXingData("000091");
                                break;
                            }
                            else if (check4.IsChecked == true)
                            {
                                setTitle("稻谷质量特性参数坐标轴描述表", "000092");
                                models = dataSource.getDaoGuZhiLiangTeXingData("000092");
                                break;
                            }
                            else
                            {
                                MessageBox.Show("获取数据失败!");
                                return;
                            }
                       
                        case 3:
                            if (check1.IsChecked == true)
                            {
                                setTitle("稻谷质量特性参数坐标轴描述表", "000093");
                                models = dataSource.getDaoGuZhiLiangTeXingData("000093");
                                break;
                            }
                            else if (check2.IsChecked == true)
                            {
                                setTitle("稻谷质量特性参数坐标轴描述表", "000094");
                                models = dataSource.getDaoGuZhiLiangTeXingData("000094");
                                break;
                            }
                            else if (check3.IsChecked == true)
                            {
                                setTitle("稻谷质量特性参数坐标轴描述表", "000095");
                                models = dataSource.getDaoGuZhiLiangTeXingData("000095");
                                break;
                            }
                            else if (check4.IsChecked == true)
                            {
                                setTitle("稻谷质量特性参数坐标轴描述表", "000096");
                                models = dataSource.getDaoGuZhiLiangTeXingData("000096");
                                break;
                            }
                            else
                            {
                                MessageBox.Show("获取数据失败!");
                                return;
                            }
                           
                        default:
                            break;
                    }
                    break;
                case 4:
                  switch (com.SelectedIndex)
                    {
                        case 0:
                            if (check1.IsChecked == true)
                            {
                                setTitle("稻谷质量特性参数坐标轴描述表", "000097");
                                models = dataSource.getDaoGuZhiLiangTeXingData("000097");
                                break;
                            }
                            else if (check2.IsChecked == true)
                            {
                                setTitle("稻谷质量特性参数坐标轴描述表", "000098");
                                models = dataSource.getDaoGuZhiLiangTeXingData("000098");
                                break;
                            }
                            else if (check3.IsChecked == true)
                            {
                                setTitle("稻谷质量特性参数坐标轴描述表", "000099");
                                models = dataSource.getDaoGuZhiLiangTeXingData("000099");
                                break;
                            }
                            else if (check4.IsChecked == true)
                            {
                                setTitle("稻谷质量特性参数坐标轴描述表", "000100");
                                models = dataSource.getDaoGuZhiLiangTeXingData("000100");
                                break;
                            }
                            else
                            {
                                MessageBox.Show("获取数据失败!");
                                return;
                            }
                           
                        case 1:
                            if (check1.IsChecked == true)
                            {
                                setTitle("稻谷质量特性参数坐标轴描述表", "000101");
                                models = dataSource.getDaoGuZhiLiangTeXingData("000101");
                                break;
                            }
                            else if (check2.IsChecked == true)
                            {
                                setTitle("稻谷质量特性参数坐标轴描述表", "000102");
                                models = dataSource.getDaoGuZhiLiangTeXingData("000102");
                                break;
                            }
                            else if (check3.IsChecked == true)
                            {
                                setTitle("稻谷质量特性参数坐标轴描述表", "000103");
                                models = dataSource.getDaoGuZhiLiangTeXingData("000103");
                                break;
                            }
                            else if (check4.IsChecked == true)
                            {
                                setTitle("稻谷质量特性参数坐标轴描述表", "000104");
                                models = dataSource.getDaoGuZhiLiangTeXingData("000104");
                                break;
                            }
                            else
                            {
                                MessageBox.Show("获取数据失败!");
                                return;
                            }
                        
                        case 2:
                            if (check1.IsChecked == true)
                            {
                                setTitle("稻谷质量特性参数坐标轴描述表", "000105");
                                models = dataSource.getDaoGuZhiLiangTeXingData("000105");
                                break;
                            }
                            else if (check2.IsChecked == true)
                            {
                                setTitle("稻谷质量特性参数坐标轴描述表", "000106");
                                models = dataSource.getDaoGuZhiLiangTeXingData("000106");
                                break;
                            }
                            else if (check3.IsChecked == true)
                            {
                                setTitle("稻谷质量特性参数坐标轴描述表", "000107");
                                models = dataSource.getDaoGuZhiLiangTeXingData("000107");
                                break;
                            }
                            else if (check4.IsChecked == true)
                            {
                                setTitle("稻谷质量特性参数坐标轴描述表", "000108");
                                models = dataSource.getDaoGuZhiLiangTeXingData("000108");
                                break;
                            }
                            else
                            {
                                MessageBox.Show("获取数据失败!");
                                return;
                            }
                          
                        case 3:
                            if (check1.IsChecked == true)
                            {
                                setTitle("稻谷质量特性参数坐标轴描述表", "000109");
                                models = dataSource.getDaoGuZhiLiangTeXingData("000109");
                                break;
                            }
                            else if (check2.IsChecked == true)
                            {
                                setTitle("稻谷质量特性参数坐标轴描述表", "000110");
                                models = dataSource.getDaoGuZhiLiangTeXingData("000110");
                                break;
                            }
                            else if (check3.IsChecked == true)
                            {
                                setTitle("稻谷质量特性参数坐标轴描述表", "000111");
                                models = dataSource.getDaoGuZhiLiangTeXingData("000111");
                                break;
                            }
                            else if (check4.IsChecked == true)
                            {
                                setTitle("稻谷质量特性参数坐标轴描述表", "000112");
                                models = dataSource.getDaoGuZhiLiangTeXingData("000112");
                                break;
                            }
                            else
                            {
                                MessageBox.Show("获取数据失败!");
                                return;
                            }
                         
                        default:
                            break;
                    }
                    break;
                case 5:
                     switch (com.SelectedIndex)
                    {
                        case 0:
                            if (check1.IsChecked == true)
                            {
                                setTitle("稻谷质量特性参数坐标轴描述表", "000049");
                                models = dataSource.getDaoGuZhiLiangTeXingData("000049");
                                break;
                            }
                            else if (check2.IsChecked == true)
                            {
                                setTitle("稻谷质量特性参数坐标轴描述表", "000050");
                                models = dataSource.getDaoGuZhiLiangTeXingData("000050");
                                break;
                            }
                            else if (check3.IsChecked == true)
                            {
                                setTitle("稻谷质量特性参数坐标轴描述表", "000051");
                                models = dataSource.getDaoGuZhiLiangTeXingData("000051");
                                break;
                            }
                            else if (check4.IsChecked == true)
                            {
                                setTitle("稻谷质量特性参数坐标轴描述表", "000052");
                                models = dataSource.getDaoGuZhiLiangTeXingData("000052");
                                break;
                            }
                            else
                            {
                                MessageBox.Show("获取数据失败!");
                                return;
                            }
                         
                        case 1:
                            if (check1.IsChecked == true)
                            {
                                setTitle("稻谷质量特性参数坐标轴描述表", "000053");
                                models = dataSource.getDaoGuZhiLiangTeXingData("000053");
                                break;
                            }
                            else if (check2.IsChecked == true)
                            {
                                setTitle("稻谷质量特性参数坐标轴描述表", "000054");
                                models = dataSource.getDaoGuZhiLiangTeXingData("000054");
                                break;
                            }
                            else if (check3.IsChecked == true)
                            {
                                setTitle("稻谷质量特性参数坐标轴描述表", "000055");
                                models = dataSource.getDaoGuZhiLiangTeXingData("000055");
                                break;
                            }
                            else if (check4.IsChecked == true)
                            {
                                setTitle("稻谷质量特性参数坐标轴描述表", "000056");
                                models = dataSource.getDaoGuZhiLiangTeXingData("000056");
                                break;
                            }
                            else
                            {
                                MessageBox.Show("获取数据失败!");
                                return;
                            }
                           
                        case 2:
                            if (check1.IsChecked == true)
                            {
                                setTitle("稻谷质量特性参数坐标轴描述表", "000057");
                                models = dataSource.getDaoGuZhiLiangTeXingData("000057");
                                break;
                            }
                            else if (check2.IsChecked == true)
                            {
                                setTitle("稻谷质量特性参数坐标轴描述表", "000058");
                                models = dataSource.getDaoGuZhiLiangTeXingData("000058");
                                break;
                            }
                            else if (check3.IsChecked == true)
                            {
                                setTitle("稻谷质量特性参数坐标轴描述表", "000059");
                                models = dataSource.getDaoGuZhiLiangTeXingData("000059");
                                break;
                            }
                            else if (check4.IsChecked == true)
                            {
                                setTitle("稻谷质量特性参数坐标轴描述表", "000060");
                                models = dataSource.getDaoGuZhiLiangTeXingData("000060");
                                break;
                            }
                            else
                            {
                                MessageBox.Show("获取数据失败!");
                                return;
                            }
                          
                        case 3:
                            if (check1.IsChecked == true)
                            {
                                setTitle("稻谷质量特性参数坐标轴描述表", "000061");
                                models = dataSource.getDaoGuZhiLiangTeXingData("000061");
                                break;
                            }
                            else if (check2.IsChecked == true)
                            {
                                setTitle("稻谷质量特性参数坐标轴描述表", "000062");
                                models = dataSource.getDaoGuZhiLiangTeXingData("000062");
                                break;
                            }
                            else if (check3.IsChecked == true)
                            {
                                setTitle("稻谷质量特性参数坐标轴描述表", "000063");
                                models = dataSource.getDaoGuZhiLiangTeXingData("000063");
                                break;
                            }
                            else if (check4.IsChecked == true)
                            {
                                setTitle("稻谷质量特性参数坐标轴描述表", "000064");
                                models = dataSource.getDaoGuZhiLiangTeXingData("000064");
                                break;
                            }
                            else
                            {
                                MessageBox.Show("获取数据失败!");
                                return;
                            }
                           
                        default:
                            break;
                    }
                    break;
                default:
                    MessageBox.Show("加载出错!!!");
                    return;
            }
            switch (DaoGuTeXingCanShuPage.type)
            {
                case 1:
                    setAxes(models);
                    InitBarChart(models);
                    InitLineBar(models, "low");
                    InitLineBar(models, "high");
                    InitLineBar(models, "media");
                    break;
                case 2:
                    setAddToSpeedAxes(models);
                    InitAddToSpeedSpline(models);
                    break;
                case 3:
                    setAxes(models);
                    InitSpline(models,MarkerType.None);
                    break;
                case 4:
                    setAxes(models);
                    InitSpline(models,MarkerType.None);
                    break;
                case 5:
                    setAxes(models);
                    InitBarChart(models);
                    break;
                case 6:
                    setAxes(models);
                    InitLine(models);
                    break;
                case 7:
                    InitDongTai(models);
                    break;
                case 8:
                    setBubbleAxes(models);
                    InitBubble(models);
                    break;
                case 9:
                    dayGrid.Visibility = Visibility.Visible;
                    initPredictDay();
                    //predictModels = dataSource.getPredictDataAfterTime(models,); 
                    break;
                case 10:
                    dateGrid.Visibility = Visibility.Visible;
                    break;
                case 11:
                    predictPanDuan();
                    break;
                case 12:
                    dayGrid.Visibility = Visibility.Visible;
                    initPredictDay();
                    break;
                default:
                    MessageBox.Show("没有数据");
                    break;
            }
        }
        private void InitPage(InitData data)
        {
            this.comLab.Content = data.comLabelText;
            this.com.ItemsSource = data.comTexts;
            this.check1.Content = data.radioCheck1Text;
            this.check2.Content = data.radioCheck2Text;
            this.check3.Content = data.radioCheck3Text;
            this.check4.Content = data.radioCheck4Text;
        }
        ConvertStringToRichTextBox convertToBox = new ConvertStringToRichTextBox();
        private void setTitle(string tableName, string shiYanHao)
        {
            title = dataSource.getTitle(tableName, shiYanHao);
           
            if (DaoGuTeXingCanShuPage.type == 2)
            {
                DaoGuDisplay.title.Content = title.TitleSpeed;
                DaoGuDisplay.yText.Text = title.YLabelSpeed;
                DaoGuDisplay.jieShi.Document = convertToBox.convertStringToFlowDocument(title.chartSpeedMiaoShu);
            }
            else
            {
                DaoGuDisplay.title.Content = title.Title;
                DaoGuDisplay.yText.Text = title.YLabel;
                DaoGuDisplay.jieShi.Document = convertToBox.convertStringToFlowDocument(title.chartMiaoShu);
            }
            DaoGuDisplay.xText.Content = title.XLabel;
        }
        private void InitBarChart(List<DaoGuZhiLiangTeXingModel> models)
        {
            ColumnSeries col = new ColumnSeries();
            col.XAxis = (CategoryAxisBase)dataChart.Axes[0];
            col.YAxis = (NumericYAxis)dataChart.Axes[1];
            col.ItemsSource = models;
            col.Visibility = Visibility.Visible;
            col.ValueMemberPath = "yData";
            if (DaoGuTeXingCanShuPage.type == 1)
            {
                DataTemplate template = new DataTemplate();
                FrameworkElementFactory fef = new FrameworkElementFactory(typeof(Label));
                fef.SetBinding(Label.ContentProperty, new Binding() { Path = new PropertyPath("Item.yData") });
                fef.SetValue(Label.MarginProperty, new Thickness(0, 0, 0, 15));
                fef.SetValue(Label.ForegroundProperty, new SolidColorBrush(Colors.Green));
                fef.SetValue(Label.FontSizeProperty, Convert.ToDouble(14));
                fef.SetValue(Label.FontWeightProperty, FontWeight.FromOpenTypeWeight(700));

                template.VisualTree = fef;
                col.MarkerTemplate = template;
            }
            col.ToolTip = InitToolTip(models, col);
            //if (dataChart.Series.Count > 0)
            //{
            //    dataChart.Series.Clear();
            //}
            dataChart.Series.Add(col);
        }
        private void InitAddToSpeedSpline(List<DaoGuZhiLiangTeXingModel> models)
        {
            SplineSeries spline = new SplineSeries();
            spline.XAxis = (CategoryAxisBase)dataChart.Axes[0];

            spline.YAxis = (NumericYAxis)dataChart.Axes[1];

            spline.ItemsSource = models;
            spline.Visibility = Visibility.Visible;
            spline.ValueMemberPath = "addToSpeed";
            spline.MarkerType = MarkerType.None;
            spline.Thickness = 3;
            DataTemplate template = new DataTemplate();
            FrameworkElementFactory fef = new FrameworkElementFactory(typeof(Label));
            fef.SetBinding(Label.ContentProperty, new Binding() { Path = new PropertyPath("Item.addToSpeed"), Converter = new StringFormatConverter(), ConverterParameter = "0.00" });
            //fef.SetValue(Label.MarginProperty, new Thickness(0, 0, 0, 15));
            fef.SetValue(Label.ForegroundProperty, new SolidColorBrush(Colors.Green));
            fef.SetValue(Label.FontSizeProperty, Convert.ToDouble(14));
            fef.SetValue(Label.FontWeightProperty, FontWeight.FromOpenTypeWeight(700));
            template.VisualTree = fef;
            spline.MarkerTemplate = template;
            spline.ToolTip = InitSpeedToolTip(models, spline);
            //if (dataChart.Series.Count > 0)
            //{
            //    dataChart.Series.Clear();
            //}
            dataChart.Series.Add(spline);

        }
        private void InitSpline(List<DaoGuZhiLiangTeXingModel> models,MarkerType type)
        {
            SplineSeries spline = new SplineSeries();
            spline.XAxis = (CategoryAxisBase)dataChart.Axes[0];

            spline.YAxis = (NumericYAxis)dataChart.Axes[1];

            spline.ItemsSource = models;
            spline.Visibility = Visibility.Visible;
            spline.ValueMemberPath = "yData";
            spline.MarkerType = type;
            spline.Thickness = 3;
            if (DaoGuTeXingCanShuPage.type == 3)
            {
                DataTemplate template = new DataTemplate();
                FrameworkElementFactory fef = new FrameworkElementFactory(typeof(Label));
                fef.SetBinding(Label.ContentProperty, new Binding() { Path = new PropertyPath("Item.yData"), Converter = new StringFormatConverter(), ConverterParameter = "0.00" });
                //fef.SetValue(Label.MarginProperty, new Thickness(0, 0, 0, 15));
                fef.SetValue(Label.ForegroundProperty, new SolidColorBrush(Colors.Green));
                fef.SetValue(Label.FontSizeProperty, Convert.ToDouble(14));
                fef.SetValue(Label.FontWeightProperty, FontWeight.FromOpenTypeWeight(700));
                template.VisualTree = fef;
                spline.MarkerTemplate = template;
            }
            spline.ToolTip = InitToolTip(models, spline);
            //if (dataChart.Series.Count > 0)
            //{
            //    dataChart.Series.Clear();
            //}
            dataChart.Series.Add(spline);
        }
        private void InitLine(List<DaoGuZhiLiangTeXingModel> models)
        {
            LineSeries line = new LineSeries();
            line.XAxis = (CategoryAxisBase)dataChart.Axes[0];

            line.YAxis = (NumericYAxis)dataChart.Axes[1];

            line.ItemsSource = models;
            line.Visibility = Visibility.Visible;
            line.ValueMemberPath = "yData";
            line.MarkerType = MarkerType.None;
            line.Thickness = 3;
            line.ToolTip = InitToolTip(models, line);
            //if (dataChart.Series.Count > 0)
            //{
            //    dataChart.Series.Clear();
            //}
            dataChart.Series.Add(line);
        }
        private void InitBubble(List<DaoGuZhiLiangTeXingModel> models)
        {
            BubbleSeries bubble = new BubbleSeries();
            bubble.XAxis = (NumericXAxis)dataChart.Axes[0];

            bubble.YAxis = (NumericYAxis)dataChart.Axes[1];

            bubble.ItemsSource = models;
            bubble.Visibility = Visibility.Visible;
            bubble.XMemberPath = "xData";
            bubble.YMemberPath = "yData";
            bubble.RadiusMemberPath = "rData";
            bubble.ToolTip = InitToolTip(models, bubble);
            //if (dataChart.Series.Count > 0)
            //{
            //    dataChart.Series.Clear();
            //}
            dataChart.Series.Add(bubble);
        }
        public static List<Model> DongTaiModels;
        private void InitDongTai(List<DaoGuZhiLiangTeXingModel> models)
        {
            DongTaiModels = dataSource.convert(models);
            Frame frame = new Frame();
            frame.Source = new Uri("pack://application:,,,/DongTaiTu;component/DaoGuZhiLiangCanShu.xaml");
            if (DaoGuDisplay.mainGrid.Children.Count > 0)
            {
                DaoGuDisplay.mainGrid.Children.Clear();
            }
            DaoGuDisplay.mainGrid.Children.Add(frame);
        }
        private Grid InitToolTip(List<DaoGuZhiLiangTeXingModel> model, Series col)
        {
            Grid grid = new Grid();
            StackPanel verStack = new StackPanel();
            verStack.Orientation = Orientation.Vertical;
            StackPanel horStack = new StackPanel();
            horStack.Orientation = Orientation.Horizontal;
            StackPanel stackBlock = new StackPanel();
            TextBlock xBlock = new TextBlock();
            xBlock.SetBinding(TextBlock.TextProperty, new Binding() { Path = new PropertyPath("Item.xLabel") });
            TextBlock yBlock = new TextBlock();
            yBlock.SetBinding(TextBlock.TextProperty, new Binding() { Path = new PropertyPath("Item.canShuName") });
            stackBlock.Children.Add(xBlock);
            stackBlock.Children.Add(yBlock);
            StackPanel stackText = new StackPanel();
            TextBlock xText = new TextBlock();

            xText.SetBinding(TextBlock.TextProperty, new Binding() { Path = new PropertyPath("Item.xData") });
            TextBlock yText = new TextBlock();
            yText.SetBinding(TextBlock.TextProperty, new Binding() { Path = new PropertyPath("Item.yData") });
            stackText.Children.Add(xText);
            stackText.Children.Add(yText);

            horStack.Children.Add(stackBlock);
            horStack.Children.Add(stackText);
            verStack.Children.Add(horStack);
            grid.Children.Add(verStack);
            return grid;
        }
        private Grid InitSpeedToolTip(List<DaoGuZhiLiangTeXingModel> models, Series col)
        {
            Grid grid = new Grid();
            StackPanel verStack = new StackPanel();
            verStack.Orientation = Orientation.Vertical;
            StackPanel horStack = new StackPanel();
            horStack.Orientation = Orientation.Horizontal;
            StackPanel stackBlock = new StackPanel();
            TextBlock xBlock = new TextBlock();
            xBlock.SetBinding(TextBlock.TextProperty, new Binding() { Path = new PropertyPath("Item.xLabel") });
            //TextBlock yBlock = new TextBlock();
            //yBlock.SetBinding(TextBlock.TextProperty, new Binding() { Path = new PropertyPath("Item.canShuName") });
            TextBlock Block = new TextBlock();
            Block.Text = "变化速率:";
            stackBlock.Children.Add(xBlock);
            //stackBlock.Children.Add(yBlock);
            stackBlock.Children.Add(Block);
            StackPanel stackText = new StackPanel();
            TextBlock xText = new TextBlock();

            xText.SetBinding(TextBlock.TextProperty, new Binding() { Path = new PropertyPath("Item.xData") });
            //TextBlock yText = new TextBlock();
            //yText.SetBinding(TextBlock.TextProperty, new Binding() { Path = new PropertyPath("Item.yData") });
            TextBlock Text = new TextBlock();
            Text.SetBinding(TextBlock.TextProperty, new Binding() { Path = new PropertyPath("Item.addToSpeed") });
            stackText.Children.Add(xText);
            //stackText.Children.Add(yText);
            stackText.Children.Add(Text);

            horStack.Children.Add(stackBlock);
            horStack.Children.Add(stackText);
            verStack.Children.Add(horStack);
            grid.Children.Add(verStack);
            return grid;
        }
        private void InitLineBar(List<DaoGuZhiLiangTeXingModel> models, string str)
        {
            LineSeries line = new LineSeries();
            line.XAxis = (CategoryAxisBase)dataChart.Axes[0];
            line.YAxis = (NumericYAxis)dataChart.Axes[1];

            line.ItemsSource = models;
            line.Visibility = Visibility.Visible;

            line.Thickness = 10;
            line.Opacity = 0.7;
            line.ValueMemberPath = str;
            line.MarkerType = MarkerType.None;
            if (str == "high")
            {
                line.Brush = new SolidColorBrush(Colors.Red);
            }
            else if (str == "media")
            {
                line.Brush = new SolidColorBrush(Colors.Blue);
            }
            else
            {
                line.Brush = new SolidColorBrush(Colors.Black);
            }
            //DataTemplate template = new DataTemplate();
            //FrameworkElementFactory fef = new FrameworkElementFactory(typeof(TextBlock));
            //fef.SetValue(TextBlock.TextProperty, str);
            //template.VisualTree = fef;
            //line.MarkerTemplate = template;
            line.SetBinding(Series.ToolTipProperty, new Binding() { Path = new PropertyPath("Item." + str) });

            Grid grid = new Grid();
            StackPanel verStack = new StackPanel();
            verStack.Orientation = Orientation.Vertical;
            StackPanel horStack = new StackPanel();
            horStack.Orientation = Orientation.Horizontal;
            StackPanel stackBlock = new StackPanel();

            TextBlock Block = new TextBlock();
            Block.Text = str + ":";
            stackBlock.Children.Add(Block);
            StackPanel stackText = new StackPanel();
            TextBlock Text = new TextBlock();
            Text.SetBinding(TextBlock.TextProperty, new Binding() { Path = new PropertyPath("Item." + str) });
            stackText.Children.Add(Text);

            horStack.Children.Add(stackBlock);
            horStack.Children.Add(stackText);
            verStack.Children.Add(horStack);
            grid.Children.Add(verStack);
            line.ToolTip = grid;
            dataChart.Series.Add(line);
        }
        private void setAxes(List<DaoGuZhiLiangTeXingModel> models)
        {
            xAxis = new XAxis();
            yAxis = new YAxis();
            if (dataChart.Axes.Count > 0)
            {
                dataChart.Axes.Clear();
            }
            if (DaoGuTeXingCanShuPage.type == 11 || DaoGuTeXingCanShuPage.type == 12)
            {
                dataChart.Axes.Add(xAxis.initCategoryXAxis(dataSource.convert(models), 30));
            }
            else
            {
                dataChart.Axes.Add(xAxis.initCategoryXAxis(dataSource.convert(models), 1));
            }
            if (((models[0].high + models[0].low) / 10) < 0)
            {
                dataChart.Axes.Add(yAxis.initNumericYAxis(0, models[0].high + models[0].high / 10, models[0].high / 10));
            }
            else
            {
                dataChart.Axes.Add(yAxis.initNumericYAxis(models[0].low - (models[0].high + models[0].low) / 10, models[0].high + (models[0].high + models[0].low) / 10, (models[0].high + models[0].low) / 10));
            }
            dataChart.Axes.Add(xAxis.initNumericXAxis(Convert.ToDouble(models[0].xData), Convert.ToDouble(models[models.Count - 1].xData), 30));
            AxisLabelSettings labelSetting = new AxisLabelSettings();
            labelSetting.Visibility = Visibility.Hidden;
            dataChart.Axes[2].LabelSettings = labelSetting;
            dataChart.Axes[2].Visibility = System.Windows.Visibility.Hidden; 
            dataChart.Visibility = System.Windows.Visibility.Visible;
            dataChart.VerticalZoomable = true;
            dataChart.HorizontalZoomable = true;
            dataChart.VerticalZoombarVisibility = System.Windows.Visibility.Visible;
            dataChart.HorizontalZoombarVisibility = System.Windows.Visibility.Visible;

        }
        private void setBubbleAxes(List<DaoGuZhiLiangTeXingModel> models)
        {
            xAxis = new XAxis();
            yAxis = new YAxis();
            if (dataChart.Axes.Count > 0)
            {
                dataChart.Axes.Clear();
            }
            double min;
            double max;

            try
            {
                min = max = Convert.ToDouble(models[0].xData);
            }
            catch (Exception)
            {
                throw new Exception("数据格式不正确");
            }

            List<double> douXValues = new List<double>();
            try
            {
                foreach (DaoGuZhiLiangTeXingModel str in models)
                {
                    try
                    {
                        douXValues.Add(Convert.ToDouble(str.xData));
                    }
                    catch (Exception)
                    {
                        throw new Exception("数据格式不正确");
                    }
                }
            }
            catch (Exception e)
            {
                throw e;

            }
            foreach (double dou in douXValues)
            {
                if (max < dou)
                {
                    max = dou;
                }
                if (min > dou)
                {
                    min = dou;
                }
            }

            dataChart.Axes.Add(xAxis.initNumericXAxis(min, max, 30));
            if (((models[0].high - models[0].low) / 10) < 0)
            {
                dataChart.Axes.Add(yAxis.initNumericYAxis(0, models[0].high + models[0].high / 10, models[0].high / 10));
            }
            else
            {
                dataChart.Axes.Add(yAxis.initNumericYAxis(models[0].low - (models[0].high - models[0].low) / 10, models[0].high + (models[0].high - models[0].low) / 10, (models[0].high - models[0].low) / 10));
            }

            dataChart.Visibility = System.Windows.Visibility.Visible;
            dataChart.VerticalZoomable = true;
            dataChart.HorizontalZoomable = true;
            dataChart.VerticalZoombarVisibility = System.Windows.Visibility.Visible;
            dataChart.HorizontalZoombarVisibility = System.Windows.Visibility.Visible;
        }
        private void setAddToSpeedAxes(List<DaoGuZhiLiangTeXingModel> models)
        {
            xAxis = new XAxis();
            yAxis = new YAxis();
            if (dataChart.Axes.Count > 0)
            {
                dataChart.Axes.Clear();
            }
            dataChart.Axes.Add(xAxis.initCategoryXAxis(dataSource.convert(models),1));
            // dataChart.Axes.Add(xAxis.initNumericXAxis(10, 20, 3));
            dataChart.Axes.Add(yAxis.initNumericYAxis(models[0].addToSpeedLow - (models[0].addToSpeedHigh - models[0].addToSpeedLow) / 10, models[0].addToSpeedHigh + (models[0].addToSpeedHigh - models[0].addToSpeedLow) / 10, (models[0].addToSpeedHigh - models[0].addToSpeedLow) / 10));

            dataChart.Visibility = System.Windows.Visibility.Visible;
            dataChart.VerticalZoomable = true;
            dataChart.HorizontalZoomable = true;
            dataChart.VerticalZoombarVisibility = System.Windows.Visibility.Visible;
            dataChart.HorizontalZoombarVisibility = System.Windows.Visibility.Visible;
        }
        private void biaoShi_Loaded()
        {
            if (DaoGuTeXingCanShuPage.type == 1)
            {
                Frame frame = new Frame();
                frame.Source = new Uri("pack://application:,,,/BiaoShiPage;component/ZuiZhiBiaoShiPage.xaml");

                if (DaoGuDisplay.biaoShiGrid.Children.Count > 0)
                {
                    DaoGuDisplay.biaoShiGrid.Children.Clear();
                }
                DaoGuDisplay.biaoShiGrid.Children.Add(frame);
            }
        }
        public class InitData
        { 
            public string comLabelText;
            public List<string> comTexts;
            public string radioCheck1Text;
            public string radioCheck2Text;
            public string radioCheck3Text;
            public string radioCheck4Text;
        }
        private void predictPanDuan()
        {
            if (dataChart.Series.Count > 0)
            {
                dataChart.Series.Clear();
            }
            switch (DaoGuMainPage.yType)
            {
                case 2:
                    switch (com.SelectedIndex)
                    {
                        case 0:
                            if (check1.IsChecked == true)
                            {
                                setTitle("稻谷质量特性参数坐标轴描述表", "000065");
                                models = dataSource.getDaoGuZhiLiangTeXingData("000065");
                            }
                            else if (check2.IsChecked == true)
                            {
                                setTitle("稻谷质量特性参数坐标轴描述表", "000066");
                                models = dataSource.getDaoGuZhiLiangTeXingData("000066");
                            }
                            else if (check3.IsChecked == true)
                            {
                                setTitle("稻谷质量特性参数坐标轴描述表", "000067");
                                models = dataSource.getDaoGuZhiLiangTeXingData("000067");
                            }
                            else if (check4.IsChecked == true)
                            {
                                setTitle("稻谷质量特性参数坐标轴描述表", "000068");
                                models = dataSource.getDaoGuZhiLiangTeXingData("000068");
                            }
                            else
                            {
                                MessageBox.Show("获取数据失败!");
                                return;
                            }
                            break;
                        case 1:
                            if (check1.IsChecked == true)
                            {
                                setTitle("稻谷质量特性参数坐标轴描述表", "000069");
                                models = dataSource.getDaoGuZhiLiangTeXingData("000069");
                            }
                            else if (check2.IsChecked == true)
                            {
                                setTitle("稻谷质量特性参数坐标轴描述表", "000070");
                                models = dataSource.getDaoGuZhiLiangTeXingData("000070");
                            }
                            else if (check3.IsChecked == true)
                            {
                                setTitle("稻谷质量特性参数坐标轴描述表", "000071");
                                models = dataSource.getDaoGuZhiLiangTeXingData("000071");
                            }
                            else if (check4.IsChecked == true)
                            {
                                setTitle("稻谷质量特性参数坐标轴描述表", "000072");
                                models = dataSource.getDaoGuZhiLiangTeXingData("000072");
                            }
                            else
                            {
                                MessageBox.Show("获取数据失败!");
                                return;
                                //setTitle("稻谷质量特性参数坐标轴描述表", "000068");
                                //models = dataSource.getDaoGuZhiLiangTeXingData("000068");
                            }
                            break;
                        case 2:
                            if (check1.IsChecked == true)
                            {
                                setTitle("稻谷质量特性参数坐标轴描述表", "000073");
                                models = dataSource.getDaoGuZhiLiangTeXingData("000073");
                            }
                            else if (check2.IsChecked == true)
                            {
                                setTitle("稻谷质量特性参数坐标轴描述表", "000074");
                                models = dataSource.getDaoGuZhiLiangTeXingData("000074");
                            }
                            else if (check3.IsChecked == true)
                            {
                                setTitle("稻谷质量特性参数坐标轴描述表", "000075");
                                models = dataSource.getDaoGuZhiLiangTeXingData("000075");
                            }
                            else if (check4.IsChecked == true)
                            {
                                setTitle("稻谷质量特性参数坐标轴描述表", "000076");
                                models = dataSource.getDaoGuZhiLiangTeXingData("000076");
                            }
                            else
                            {
                                MessageBox.Show("获取数据失败!");
                                return;
                            }
                            break;
                        case 3:
                            if (check1.IsChecked == true)
                            {
                                setTitle("稻谷质量特性参数坐标轴描述表", "000077");
                                models = dataSource.getDaoGuZhiLiangTeXingData("000077");
                            }
                            else if (check2.IsChecked == true)
                            {
                                setTitle("稻谷质量特性参数坐标轴描述表", "000078");
                                models = dataSource.getDaoGuZhiLiangTeXingData("000078");
                            }
                            else if (check3.IsChecked == true)
                            {
                                setTitle("稻谷质量特性参数坐标轴描述表", "000079");
                                models = dataSource.getDaoGuZhiLiangTeXingData("000079");
                            }
                            else if (check4.IsChecked == true)
                            {
                                setTitle("稻谷质量特性参数坐标轴描述表", "000080");
                                models = dataSource.getDaoGuZhiLiangTeXingData("000080");
                            }
                            else
                            {
                                MessageBox.Show("获取数据失败!");
                                return;
                            }
                            break;
                        default:
                            break;
                    }
                    break;
                case 3:
                    switch (com.SelectedIndex)
                    {
                        case 0:
                            if (check1.IsChecked == true)
                            {
                                setTitle("稻谷质量特性参数坐标轴描述表", "000081");
                                models = dataSource.getDaoGuZhiLiangTeXingData("000081");
                                break;
                            }
                            else if (check2.IsChecked == true)
                            {
                                setTitle("稻谷质量特性参数坐标轴描述表", "000082");
                                models = dataSource.getDaoGuZhiLiangTeXingData("000082");
                                break;
                            }
                            else if (check3.IsChecked == true)
                            {
                                setTitle("稻谷质量特性参数坐标轴描述表", "000083");
                                models = dataSource.getDaoGuZhiLiangTeXingData("000083");
                                break;
                            }
                            else if (check4.IsChecked == true)
                            {
                                setTitle("稻谷质量特性参数坐标轴描述表", "000084");
                                models = dataSource.getDaoGuZhiLiangTeXingData("000084");
                                break;
                            }
                            else
                            {
                                MessageBox.Show("获取数据失败!");
                                return;
                            }

                        case 1:
                            if (check1.IsChecked == true)
                            {
                                setTitle("稻谷质量特性参数坐标轴描述表", "000085");
                                models = dataSource.getDaoGuZhiLiangTeXingData("000085");
                                break;
                            }
                            else if (check2.IsChecked == true)
                            {
                                setTitle("稻谷质量特性参数坐标轴描述表", "000086");
                                models = dataSource.getDaoGuZhiLiangTeXingData("000086");
                                break;
                            }
                            else if (check3.IsChecked == true)
                            {
                                setTitle("稻谷质量特性参数坐标轴描述表", "000087");
                                models = dataSource.getDaoGuZhiLiangTeXingData("000087");
                                break;
                            }
                            else if (check4.IsChecked == true)
                            {
                                setTitle("稻谷质量特性参数坐标轴描述表", "000088");
                                models = dataSource.getDaoGuZhiLiangTeXingData("000088");
                                break;
                            }
                            else
                            {
                                MessageBox.Show("获取数据失败!");
                                return;
                            }

                        case 2:
                            if (check1.IsChecked == true)
                            {
                                setTitle("稻谷质量特性参数坐标轴描述表", "000089");
                                models = dataSource.getDaoGuZhiLiangTeXingData("000089");
                                break;
                            }
                            else if (check2.IsChecked == true)
                            {
                                setTitle("稻谷质量特性参数坐标轴描述表", "000090");
                                models = dataSource.getDaoGuZhiLiangTeXingData("000090");
                                break;
                            }
                            else if (check3.IsChecked == true)
                            {
                                setTitle("稻谷质量特性参数坐标轴描述表", "000091");
                                models = dataSource.getDaoGuZhiLiangTeXingData("000091");
                                break;
                            }
                            else if (check4.IsChecked == true)
                            {
                                setTitle("稻谷质量特性参数坐标轴描述表", "000092");
                                models = dataSource.getDaoGuZhiLiangTeXingData("000092");
                                break;
                            }
                            else
                            {
                                MessageBox.Show("获取数据失败!");
                                return;
                            }

                        case 3:
                            if (check1.IsChecked == true)
                            {
                                setTitle("稻谷质量特性参数坐标轴描述表", "000093");
                                models = dataSource.getDaoGuZhiLiangTeXingData("000093");
                                break;
                            }
                            else if (check2.IsChecked == true)
                            {
                                setTitle("稻谷质量特性参数坐标轴描述表", "000094");
                                models = dataSource.getDaoGuZhiLiangTeXingData("000094");
                                break;
                            }
                            else if (check3.IsChecked == true)
                            {
                                setTitle("稻谷质量特性参数坐标轴描述表", "000095");
                                models = dataSource.getDaoGuZhiLiangTeXingData("000095");
                                break;
                            }
                            else if (check4.IsChecked == true)
                            {
                                setTitle("稻谷质量特性参数坐标轴描述表", "000096");
                                models = dataSource.getDaoGuZhiLiangTeXingData("000096");
                                break;
                            }
                            else
                            {
                                MessageBox.Show("获取数据失败!");
                                return;
                            }

                        default:
                            break;
                    }
                    break;
                case 4:
                    switch (com.SelectedIndex)
                    {
                        case 0:
                            if (check1.IsChecked == true)
                            {
                                setTitle("稻谷质量特性参数坐标轴描述表", "000097");
                                models = dataSource.getDaoGuZhiLiangTeXingData("000097");
                                break;
                            }
                            else if (check2.IsChecked == true)
                            {
                                setTitle("稻谷质量特性参数坐标轴描述表", "000098");
                                models = dataSource.getDaoGuZhiLiangTeXingData("000098");
                                break;
                            }
                            else if (check3.IsChecked == true)
                            {
                                setTitle("稻谷质量特性参数坐标轴描述表", "000099");
                                models = dataSource.getDaoGuZhiLiangTeXingData("000099");
                                break;
                            }
                            else if (check4.IsChecked == true)
                            {
                                setTitle("稻谷质量特性参数坐标轴描述表", "000100");
                                models = dataSource.getDaoGuZhiLiangTeXingData("000100");
                                break;
                            }
                            else
                            {
                                MessageBox.Show("获取数据失败!");
                                return;
                            }

                        case 1:
                            if (check1.IsChecked == true)
                            {
                                setTitle("稻谷质量特性参数坐标轴描述表", "000101");
                                models = dataSource.getDaoGuZhiLiangTeXingData("000101");
                                break;
                            }
                            else if (check2.IsChecked == true)
                            {
                                setTitle("稻谷质量特性参数坐标轴描述表", "000102");
                                models = dataSource.getDaoGuZhiLiangTeXingData("000102");
                                break;
                            }
                            else if (check3.IsChecked == true)
                            {
                                setTitle("稻谷质量特性参数坐标轴描述表", "000103");
                                models = dataSource.getDaoGuZhiLiangTeXingData("000103");
                                break;
                            }
                            else if (check4.IsChecked == true)
                            {
                                setTitle("稻谷质量特性参数坐标轴描述表", "000104");
                                models = dataSource.getDaoGuZhiLiangTeXingData("000104");
                                break;
                            }
                            else
                            {
                                MessageBox.Show("获取数据失败!");
                                return;
                            }

                        case 2:
                            if (check1.IsChecked == true)
                            {
                                setTitle("稻谷质量特性参数坐标轴描述表", "000105");
                                models = dataSource.getDaoGuZhiLiangTeXingData("000105");
                                break;
                            }
                            else if (check2.IsChecked == true)
                            {
                                setTitle("稻谷质量特性参数坐标轴描述表", "000106");
                                models = dataSource.getDaoGuZhiLiangTeXingData("000106");
                                break;
                            }
                            else if (check3.IsChecked == true)
                            {
                                setTitle("稻谷质量特性参数坐标轴描述表", "000107");
                                models = dataSource.getDaoGuZhiLiangTeXingData("000107");
                                break;
                            }
                            else if (check4.IsChecked == true)
                            {
                                setTitle("稻谷质量特性参数坐标轴描述表", "000108");
                                models = dataSource.getDaoGuZhiLiangTeXingData("000108");
                                break;
                            }
                            else
                            {
                                MessageBox.Show("获取数据失败!");
                                return;
                            }

                        case 3:
                            if (check1.IsChecked == true)
                            {
                                setTitle("稻谷质量特性参数坐标轴描述表", "000109");
                                models = dataSource.getDaoGuZhiLiangTeXingData("000109");
                                break;
                            }
                            else if (check2.IsChecked == true)
                            {
                                setTitle("稻谷质量特性参数坐标轴描述表", "000110");
                                models = dataSource.getDaoGuZhiLiangTeXingData("000110");
                                break;
                            }
                            else if (check3.IsChecked == true)
                            {
                                setTitle("稻谷质量特性参数坐标轴描述表", "000111");
                                models = dataSource.getDaoGuZhiLiangTeXingData("000111");
                                break;
                            }
                            else if (check4.IsChecked == true)
                            {
                                setTitle("稻谷质量特性参数坐标轴描述表", "000112");
                                models = dataSource.getDaoGuZhiLiangTeXingData("000112");
                                break;
                            }
                            else
                            {
                                MessageBox.Show("获取数据失败!");
                                return;
                            }

                        default:
                            break;
                    }
                    break;
                case 5:
                    switch (com.SelectedIndex)
                    {
                        case 0:
                            if (check1.IsChecked == true)
                            {
                                setTitle("稻谷质量特性参数坐标轴描述表", "000049");
                                models = dataSource.getDaoGuZhiLiangTeXingData("000049");
                                break;
                            }
                            else if (check2.IsChecked == true)
                            {
                                setTitle("稻谷质量特性参数坐标轴描述表", "000050");
                                models = dataSource.getDaoGuZhiLiangTeXingData("000050");
                                break;
                            }
                            else if (check3.IsChecked == true)
                            {
                                setTitle("稻谷质量特性参数坐标轴描述表", "000051");
                                models = dataSource.getDaoGuZhiLiangTeXingData("000051");
                                break;
                            }
                            else if (check4.IsChecked == true)
                            {
                                setTitle("稻谷质量特性参数坐标轴描述表", "000052");
                                models = dataSource.getDaoGuZhiLiangTeXingData("000052");
                                break;
                            }
                            else
                            {
                                MessageBox.Show("获取数据失败!");
                                return;
                            }

                        case 1:
                            if (check1.IsChecked == true)
                            {
                                setTitle("稻谷质量特性参数坐标轴描述表", "000053");
                                models = dataSource.getDaoGuZhiLiangTeXingData("000053");
                                break;
                            }
                            else if (check2.IsChecked == true)
                            {
                                setTitle("稻谷质量特性参数坐标轴描述表", "000054");
                                models = dataSource.getDaoGuZhiLiangTeXingData("000054");
                                break;
                            }
                            else if (check3.IsChecked == true)
                            {
                                setTitle("稻谷质量特性参数坐标轴描述表", "000055");
                                models = dataSource.getDaoGuZhiLiangTeXingData("000055");
                                break;
                            }
                            else if (check4.IsChecked == true)
                            {
                                setTitle("稻谷质量特性参数坐标轴描述表", "000056");
                                models = dataSource.getDaoGuZhiLiangTeXingData("000056");
                                break;
                            }
                            else
                            {
                                MessageBox.Show("获取数据失败!");
                                return;
                            }

                        case 2:
                            if (check1.IsChecked == true)
                            {
                                setTitle("稻谷质量特性参数坐标轴描述表", "000057");
                                models = dataSource.getDaoGuZhiLiangTeXingData("000057");
                                break;
                            }
                            else if (check2.IsChecked == true)
                            {
                                setTitle("稻谷质量特性参数坐标轴描述表", "000058");
                                models = dataSource.getDaoGuZhiLiangTeXingData("000058");
                                break;
                            }
                            else if (check3.IsChecked == true)
                            {
                                setTitle("稻谷质量特性参数坐标轴描述表", "000059");
                                models = dataSource.getDaoGuZhiLiangTeXingData("000059");
                                break;
                            }
                            else if (check4.IsChecked == true)
                            {
                                setTitle("稻谷质量特性参数坐标轴描述表", "000060");
                                models = dataSource.getDaoGuZhiLiangTeXingData("000060");
                                break;
                            }
                            else
                            {
                                MessageBox.Show("获取数据失败!");
                                return;
                            }

                        case 3:
                            if (check1.IsChecked == true)
                            {
                                setTitle("稻谷质量特性参数坐标轴描述表", "000061");
                                models = dataSource.getDaoGuZhiLiangTeXingData("000061");
                                break;
                            }
                            else if (check2.IsChecked == true)
                            {
                                setTitle("稻谷质量特性参数坐标轴描述表", "000062");
                                models = dataSource.getDaoGuZhiLiangTeXingData("000062");
                                break;
                            }
                            else if (check3.IsChecked == true)
                            {
                                setTitle("稻谷质量特性参数坐标轴描述表", "000063");
                                models = dataSource.getDaoGuZhiLiangTeXingData("000063");
                                break;
                            }
                            else if (check4.IsChecked == true)
                            {
                                setTitle("稻谷质量特性参数坐标轴描述表", "000064");
                                models = dataSource.getDaoGuZhiLiangTeXingData("000064");
                                break;
                            }
                            else
                            {
                                MessageBox.Show("获取数据失败!");
                                return;
                            }

                        default:
                            break;
                    }
                    break;
                default:
                    MessageBox.Show("加载出错!!!");
                    return;
            }

            switch (DaoGuTeXingCanShuPage.type)
            {
                case 9:
                    double timeClip = Convert.ToDouble(models[models.Count - 1].xData);
                    setAxes(models);
                    predictModels = dataSource.getPredictDataAfterTime(models, Convert.ToInt16(daySelect.SelectedItem), 30);
                   
                    InitSpline(predictModels, MarkerType.None);
                    initTimeBar(timeClip);
                    break;
                case 11:
                    models = dataSource.getAllData(models);
                    setAxes(models);
                    InitSpline(models, MarkerType.Circle);
                    predictModels = dataSource.getAllPredictData(models);
                    InitSpline(predictModels, MarkerType.None);
                    initMoveTimeBar(0);
                    break;
                case 12:
                    models = dataSource.getAllData(models);
                    setAxes(models);
                    InitSpline(models, MarkerType.Circle);
                    predictModels = dataSource.getLagPredictValue(models, Convert.ToInt16(daySelect.SelectedItem));
                    InitSpline(predictModels, MarkerType.None);

                    initTimeBar(Convert.ToDouble(daySelect.SelectedItem));
                    initMoveTimeBar(Convert.ToDouble(daySelect.SelectedItem));
                    break;
                default:
                    MessageBox.Show("没有数据");
                    break;
            }



        }
        private void day_Changed(object sender, EventArgs e)
        {
            predictPanDuan();
        }

        private void initPredictDay()
        {
            List<int> dayNum = new List<int>();
            for (int i = 0; i <= 300; i = i + 30)
            {
                dayNum.Add(i);
            }
            daySelect.ItemsSource = dayNum;
            daySelect.SelectedIndex = 0;
        }

        private void initTimeBar(double timeClip)
        {
            ValueOverlay timeLine = new ValueOverlay();
            timeLine.Axis = (NumericXAxis)dataChart.Axes[2];
            timeLine.Brush = new SolidColorBrush(Colors.Red);
            timeLine.Thickness = 10;
            timeLine.Opacity = 0.5;
            timeLine.Value = timeClip;
            TextBlock textBlock = new TextBlock();
            textBlock.Text = "预测时间轴";
            timeLine.ToolTip = textBlock;
            timeLine.Visibility = Visibility.Visible;
            dataChart.Series.Add(timeLine);

        }
        private void initMoveTimeBar(double timeClip)
        {
            ValueOverlay chaLine = new ValueOverlay();
            chaLine.Axis = (NumericXAxis)dataChart.Axes[2];
            chaLine.Brush = new SolidColorBrush(Colors.Blue);
            chaLine.Thickness = 10;
            chaLine.Opacity = 0.5;
            chaLine.Value = timeClip;

            chaLine.MouseEnter += chaLine_MouseEnter;
            chaLine.MouseMove += chaLine_MouseMove;
            Grid grid = new Grid();
            StackPanel stackVer = new StackPanel();
            StackPanel stackHor = new StackPanel();
            StackPanel stackName = new StackPanel();
            stackName.Margin = new Thickness(2);
            TextBlock blockName = new TextBlock();
            blockName.Text = "差值";
            stackName.Children.Add(blockName);
            StackPanel stackValue = new StackPanel();
            stackValue.Margin = new Thickness(2);
            TextBlock blockValue = new TextBlock();
            block = blockValue;
            stackValue.Children.Add(blockValue);
            stackHor.Children.Add(stackName);
            stackHor.Children.Add(stackValue);
            stackVer.Children.Add(stackHor);
            grid.Children.Add(stackVer);
            chaLine.ToolTip = grid;
            chaLine.Visibility = Visibility.Visible;
            dataChart.Series.Add(chaLine);
        }

        private TextBlock block;
        void chaLine_MouseMove(object sender, MouseEventArgs e)
        {
            ValueOverlay chaLine = sender as ValueOverlay;
            var series = dataChart.Series.FirstOrDefault();

            if (series == null) return;

            var position = e.GetPosition(series);

            if (((XamDataChart)series.SeriesViewer).Axes.OfType<NumericXAxis>().Any())
            {
                var xAxis = ((XamDataChart)series.SeriesViewer).Axes.OfType<NumericXAxis>().First();
                var yAxis = ((XamDataChart)series.SeriesViewer).Axes.OfType<NumericYAxis>().First();

                var viewport = new Rect(0, 0, xAxis.ActualWidth, yAxis.ActualHeight);
                var window = series.SeriesViewer.WindowRect;

                bool isInverted = xAxis.IsInverted;
                ScalerParams param = new ScalerParams(window, viewport, isInverted);
                var unscaledX = xAxis.GetUnscaledValue(position.X, param);
                foreach (DaoGuZhiLiangTeXingModel data in predictModels)
                {
                    Int16 x = Convert.ToInt16(data.xData);
                    if (Convert.ToInt16(unscaledX) == x)
                    {
                        block.Text = data.predictChaValue.ToString();
                    }
                }
                chaLine.Value = unscaledX;
            }
        }
        private void chaLine_MouseEnter(object sender, MouseEventArgs e)
        {
            ValueOverlay chaLine = sender as ValueOverlay;
            var series = dataChart.Series.FirstOrDefault();

            if (series == null) return;

            var position = e.GetPosition(series);

            if (((XamDataChart)series.SeriesViewer).Axes.OfType<NumericXAxis>().Any())
            {
                var xAxis = ((XamDataChart)series.SeriesViewer).Axes.OfType<NumericXAxis>().First();
                var yAxis = ((XamDataChart)series.SeriesViewer).Axes.OfType<NumericYAxis>().First();

                var viewport = new Rect(0, 0, xAxis.ActualWidth, yAxis.ActualHeight);
                var window = series.SeriesViewer.WindowRect;

                bool isInverted = xAxis.IsInverted;
                ScalerParams param = new ScalerParams(window, viewport, isInverted);
                var unscaledX = xAxis.GetUnscaledValue(position.X, param);

                foreach (DaoGuZhiLiangTeXingModel data in predictModels)
                {
                    Int16 x = Convert.ToInt16(data.xData);
                    if (Convert.ToInt16(unscaledX) == x)
                    {
                        block.Text = data.predictChaValue.ToString();
                    }
                }


                chaLine.Value = unscaledX;
            }
        }
    
    }
}
