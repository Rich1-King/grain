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
using YuMiWindow;
using DataBaseControl;
using Infragistics.Controls.Charts;
using DataModel;
using System.Windows.Threading;
using XAndYAxis;
using System.Windows.Media.Animation;
using System.Collections;
using Infragistics.Samples.Shared.Converters;
using ConvertData;

namespace YuMiChart
{
    /// <summary>
    /// SelectPage.xaml 的交互逻辑
    /// </summary>
    public partial class SelectPage : Page
    {
    
        public SelectPage()
        {
            InitializeComponent();
            dataChart = ChartDisplay.xamDataChart;
            dataSource = new DataSource();
        }
        private XamDataChart dataChart;
        private InitData data;
        private DataSource dataSource;
        private XAxis xAxis;
        private YAxis yAxis;
        private List<YuMiTeXingDataModel> models;
        private TitleModel title;
      
        private void Grid_Load(object sender, RoutedEventArgs e)
        {
            biaoShi_Loaded();
            if (dataChart.Series.Count > 0)
            {
                dataChart.Series.Clear();
            }
            data = new InitData();
            data.comLabelText = "品种:";
            List<string> comStr = new List<string>();
            comStr.Add("郑单958(山东)");
            comStr.Add("郑单958(河北)");
            if (YuMiMainPage.xType != 1)
            {
                comStr.Add("银河七(吉林)");
                comStr.Add("先玉335(吉林)");
                comStr.Add("恒宇619(吉林)");
            }
            data.comTexts = comStr;
            

            if(YuMiMainPage.yType == 1)
            {
                data.radioCheck1Text = "国际法";
                data.radioCheck2Text = "美标法";
               
                     switch (YuMiTeXingaCanShuPage.type)
                     {
                         case 1:
                             if (YuMiMainPage.xType == 1)
                             {
                                 models = dataSource.getYuMiTeXingData("000001");
                                 setTitle("玉米特性参数坐标轴描述表", "000001");          
                             }
                             else if (YuMiMainPage.xType == 2)
                             {
                                 models = dataSource.getYuMiTeXingData("000005");
                                 setTitle("玉米特性参数坐标轴描述表", "000005");     
                                
                             }
                             else if (YuMiMainPage.xType == 3)
                             {
                                 models = dataSource.getYuMiTeXingData("000009");
                                 setTitle("玉米特性参数坐标轴描述表", "000009");     
                               
                             }
                            else
                            {
                                MessageBox.Show("没有信息");
                                break;
                            }
                             setAxes(models);
                             InitBarChart(models);
                             InitLineBar(models, "low");
                             InitLineBar(models, "high");
                             InitLineBar(models, "media");  
                            break;
                         case 2:
                            if (YuMiMainPage.xType == 1)
                             {
                                 models = dataSource.getYuMiTeXingData("000001");
                                 setTitle("玉米特性参数坐标轴描述表", "000001");
                             }
                            else if (YuMiMainPage.xType == 2)
                             {
                                 models = dataSource.getYuMiTeXingData("000005");
                                 setTitle("玉米特性参数坐标轴描述表", "000005");     
                                
                             }
                            else if (YuMiMainPage.xType == 3)
                             {
                                 models = dataSource.getYuMiTeXingData("000009");
                                 setTitle("玉米特性参数坐标轴描述表", "000009");      
                             }
                             else
                             {
                                 MessageBox.Show("没有信息");
                                 break;
                             }
                               setAddToSpeedAxes(models);
                               InitAddToSpeedSpline(models);
                               break;
                         case 3:
                               if (YuMiMainPage.xType == 1)
                             {
                                  models = dataSource.getYuMiTeXingData("000001");
                                  setTitle("玉米特性参数坐标轴描述表", "000001");
                                
                             }
                               else if (YuMiMainPage.xType == 2)
                             {
                                 models = dataSource.getYuMiTeXingData("000005");
                                 setTitle("玉米特性参数坐标轴描述表", "000005");     
                             }
                               else if (YuMiMainPage.xType == 3)
                             {
                                 models = dataSource.getYuMiTeXingData("000009");
                                 setTitle("玉米特性参数坐标轴描述表", "000009");     
                            }
                             else
                             {
                                 MessageBox.Show("没有信息");
                                 break;
                             }
                              setAxes(models);
                              InitSpline(models);
                              break;
                         case 4:
                              if (YuMiMainPage.xType == 1)
                             {
                                  models = dataSource.getYuMiTeXingData("000001");
                                  setTitle("玉米特性参数坐标轴描述表", "000001");
                                 
                             }
                              else if (YuMiMainPage.xType == 2)
                             {
                                 models = dataSource.getYuMiTeXingData("000005");
                                 setTitle("玉米特性参数坐标轴描述表", "000005");     
                             }
                              else if (YuMiMainPage.xType == 3)
                             {
                                 models = dataSource.getYuMiTeXingData("000009");
                                 setTitle("玉米特性参数坐标轴描述表", "000009");     
                             }
                             else 
                             {
                                 MessageBox.Show("没有信息");
                                 break;
                             }
                              setAxes(models);
                              InitSpline(models);
                            break;
                         case 5:
                            if (YuMiMainPage.xType == 1)
                             {
                                 models = dataSource.getYuMiTeXingData("000001");
                                 setTitle("玉米特性参数坐标轴描述表", "000001");
                               
                             }
                            else if (YuMiMainPage.xType == 2)
                             {
                                 models = dataSource.getYuMiTeXingData("000005");
                                 setTitle("玉米特性参数坐标轴描述表", "000005");     
                             }
                            else if (YuMiMainPage.xType == 3)
                             {
                                 models = dataSource.getYuMiTeXingData("000009");
                                 setTitle("玉米特性参数坐标轴描述表", "000009");     
                            }
                              else
                              {
                                  MessageBox.Show("没有信息");
                                  break;
                              }
                               setAxes(models);
                               InitBarChart(models);
                            break;
                         case 6:
                            if (YuMiMainPage.xType == 1)
                             {
                                 models = dataSource.getYuMiTeXingData("000001");
                                 setTitle("玉米特性参数坐标轴描述表", "000001");
                               
                             }
                            else if (YuMiMainPage.xType == 2)
                             {
                                 models = dataSource.getYuMiTeXingData("000005");
                                 setTitle("玉米特性参数坐标轴描述表", "000005");     
                             }
                            else if (YuMiMainPage.xType == 3)
                             {
                                 models = dataSource.getYuMiTeXingData("000009");
                                 setTitle("玉米特性参数坐标轴描述表", "000009");     
                            }
                             else
                             {
                                 MessageBox.Show("没有信息");
                                 break;
                             }
                               setAxes(models);
                               InitLine(models);
                               break;
                         case 7:
                               if (YuMiMainPage.xType == 1)
                             {
                                 models = dataSource.getYuMiTeXingData("000001");
                                 setTitle("玉米特性参数坐标轴描述表", "000001");  
                             }
                               else if (YuMiMainPage.xType == 2)
                             {
                                 models = dataSource.getYuMiTeXingData("000005");
                                 setTitle("玉米特性参数坐标轴描述表", "000005");     
                             }
                               else if (YuMiMainPage.xType == 3)
                             {
                                 models = dataSource.getYuMiTeXingData("000009");
                                 setTitle("玉米特性参数坐标轴描述表", "000009");     
                             }
                             else
                             {
                                 MessageBox.Show("没有信息");
                                 break;
                             }
                              InitDongTai(models);  
                              break;
                         case 8:
                              if (YuMiMainPage.xType == 1)
                             {
                                 models = dataSource.getYuMiTeXingData("000001");
                                 setTitle("玉米特性参数坐标轴描述表", "000001");
                               
                             }
                              else if (YuMiMainPage.xType == 2)
                             {
                                 models = dataSource.getYuMiTeXingData("000005");
                                 setTitle("玉米特性参数坐标轴描述表", "000005");     
                             }
                              else if (YuMiMainPage.xType == 3)
                             {
                                 models = dataSource.getYuMiTeXingData("000009");
                                 setTitle("玉米特性参数坐标轴描述表", "000009");     
                            }
                            else
                            {
                                MessageBox.Show("没有信息");
                                break;
                            }
                               setBubbleAxes(models);
                               InitBubble(models);
                               break;
                         default:
                            MessageBox.Show("没有数据显示");
                            break;
                    }
            }
            else if (YuMiMainPage.yType == 2)
            {
                  data.radioCheck1Text = "趋势线法";
                  data.radioCheck2Text = "两点法";

                  switch (YuMiTeXingaCanShuPage.type)
                  {
                      case 1:
                          if (YuMiMainPage.xType == 1)
                          {
                              models = dataSource.getYuMiTeXingData("000003");
                              setTitle("玉米特性参数坐标轴描述表", "000003");     
                          }
                          else if (YuMiMainPage.xType == 2)
                          {
                              models = dataSource.getYuMiTeXingData("000007");
                              setTitle("玉米特性参数坐标轴描述表", "000007");     
                          }
                          else if (YuMiMainPage.xType == 3)
                          {
                              models = dataSource.getYuMiTeXingData("000011");
                              setTitle("玉米特性参数坐标轴描述表", "000011");     
                             
                          }
                          else
                          {
                              MessageBox.Show("没有信息");
                              break;
                          }
                          setAxes(models);
                          InitBarChart(models);
                          InitLineBar(models, "low");
                          InitLineBar(models, "high");
                          InitLineBar(models, "media");
                          break;
                      case 2:
                          if (YuMiMainPage.xType == 1)
                          {
                              models = dataSource.getYuMiTeXingData("000003");
                              setTitle("玉米特性参数坐标轴描述表", "000003");
                          }
                          else if (YuMiMainPage.xType == 2)
                          {
                              models = dataSource.getYuMiTeXingData("000007");
                              setTitle("玉米特性参数坐标轴描述表", "000007");
                          }
                          else if (YuMiMainPage.xType == 3)
                          {
                              models = dataSource.getYuMiTeXingData("000011");
                              setTitle("玉米特性参数坐标轴描述表", "000011");

                          }
                          else
                          {
                              MessageBox.Show("没有信息");
                              break;
                          }
                          setAddToSpeedAxes(models);
                          InitAddToSpeedSpline(models);
                          break;
                      case 3:
                          if (YuMiMainPage.xType == 1)
                          {
                              models = dataSource.getYuMiTeXingData("000003");
                              setTitle("玉米特性参数坐标轴描述表", "000003");
                          }
                          else if (YuMiMainPage.xType == 2)
                          {
                              models = dataSource.getYuMiTeXingData("000007");
                              setTitle("玉米特性参数坐标轴描述表", "000007");
                          }
                          else if (YuMiMainPage.xType == 3)
                          {
                              models = dataSource.getYuMiTeXingData("000011");
                              setTitle("玉米特性参数坐标轴描述表", "000011");

                          }
                          else
                          {
                              MessageBox.Show("没有信息");
                              break;
                          }
                          setAxes(models);
                          InitSpline(models);
                          break;
                      case 4:
                          if (YuMiMainPage.xType == 1)
                          {
                              models = dataSource.getYuMiTeXingData("000003");
                              setTitle("玉米特性参数坐标轴描述表", "000003");
                          }
                          else if (YuMiMainPage.xType == 2)
                          {
                              models = dataSource.getYuMiTeXingData("000007");
                              setTitle("玉米特性参数坐标轴描述表", "000007");
                          }
                          else if (YuMiMainPage.xType == 3)
                          {
                              models = dataSource.getYuMiTeXingData("000011");
                              setTitle("玉米特性参数坐标轴描述表", "000011");

                          }
                          else
                          {
                              MessageBox.Show("没有信息");
                              break;
                          }
                          setAxes(models);
                          InitSpline(models);
                          break;
                      case 5:
                          if (YuMiMainPage.xType == 1)
                          {
                              models = dataSource.getYuMiTeXingData("000003");
                              setTitle("玉米特性参数坐标轴描述表", "000003");
                          }
                          else if (YuMiMainPage.xType == 2)
                          {
                              models = dataSource.getYuMiTeXingData("000007");
                              setTitle("玉米特性参数坐标轴描述表", "000007");
                          }
                          else if (YuMiMainPage.xType == 3)
                          {
                              models = dataSource.getYuMiTeXingData("000011");
                              setTitle("玉米特性参数坐标轴描述表", "000011");

                          }
                          else
                          {
                              MessageBox.Show("没有信息");
                              break;
                          }
                          setAxes(models);
                          InitBarChart(models);
                          break;
                      case 6:
                          if (YuMiMainPage.xType == 1)
                          {
                              models = dataSource.getYuMiTeXingData("000003");
                              setTitle("玉米特性参数坐标轴描述表", "000003");
                          }
                          else if (YuMiMainPage.xType == 2)
                          {
                              models = dataSource.getYuMiTeXingData("000007");
                              setTitle("玉米特性参数坐标轴描述表", "000007");
                          }
                          else if (YuMiMainPage.xType == 3)
                          {
                              models = dataSource.getYuMiTeXingData("000011");
                              setTitle("玉米特性参数坐标轴描述表", "000011");

                          }
                          else
                          {
                              MessageBox.Show("没有信息");
                              break;
                          }
                          setAxes(models);
                          InitLine(models);
                          break;
                      case 7:
                          if (YuMiMainPage.xType == 1)
                          {
                              models = dataSource.getYuMiTeXingData("000003");
                              setTitle("玉米特性参数坐标轴描述表", "000003");
                          }
                          else if (YuMiMainPage.xType == 2)
                          {
                              models = dataSource.getYuMiTeXingData("000007");
                              setTitle("玉米特性参数坐标轴描述表", "000007");
                          }
                          else if (YuMiMainPage.xType == 3)
                          {
                              models = dataSource.getYuMiTeXingData("000011");
                              setTitle("玉米特性参数坐标轴描述表", "000011");

                          }
                          else
                          {
                              MessageBox.Show("没有信息");
                              break;
                          }
                          InitDongTai(models);
                    
                          break;
                      case 8:
                          if (YuMiMainPage.xType == 1)
                          {
                              models = dataSource.getYuMiTeXingData("000003");
                              setTitle("玉米特性参数坐标轴描述表", "000003");
                          }
                          else if (YuMiMainPage.xType == 2)
                          {
                              models = dataSource.getYuMiTeXingData("000007");
                              setTitle("玉米特性参数坐标轴描述表", "000007");
                          }
                          else if (YuMiMainPage.xType == 3)
                          {
                              models = dataSource.getYuMiTeXingData("000011");
                              setTitle("玉米特性参数坐标轴描述表", "000011");
                          }
                          else
                          {
                              MessageBox.Show("没有信息");
                              break;
                          }
                          setBubbleAxes(models);
                          InitBubble(models);
                          break;
                      default:
                          MessageBox.Show("没有数据显示");
                          break;
                    }  
 
            }
            InitPage(data);
         
        }
        private bool flag = true;
        private void selcted_Changde(object sender, RoutedEventArgs e)
        {
            if (flag)
            {
                flag = false;
                return;
            }
            Panduan();
        }

        private void Panduan()
        {
            biaoShi_Loaded();
            if (dataChart.Series.Count > 0)
            {
                dataChart.Series.Clear();
            }
            if (YuMiMainPage.yType == 1)
            {
                switch (YuMiTeXingaCanShuPage.type)
                {
                    case 1:
                        if (YuMiMainPage.xType == 1)
                        {
                            switch (com.SelectedIndex)
                            {
                                case 0:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000001");
                                        setTitle("玉米特性参数坐标轴描述表", "000001");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000002");
                                        setTitle("玉米特性参数坐标轴描述表", "000002");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                case 1:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000013");
                                        setTitle("玉米特性参数坐标轴描述表", "000013");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000014");
                                        setTitle("玉米特性参数坐标轴描述表", "000014");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                case 2:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000025");
                                        setTitle("玉米特性参数坐标轴描述表", "000025");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000026");
                                        setTitle("玉米特性参数坐标轴描述表", "000026");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                case 3:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000037");
                                        setTitle("玉米特性参数坐标轴描述表", "000037");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000038");
                                        setTitle("玉米特性参数坐标轴描述表", "000038");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                case 4:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000049");
                                        setTitle("玉米特性参数坐标轴描述表", "000049");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000050");
                                        setTitle("玉米特性参数坐标轴描述表", "000050");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                default:
                                    break;
                            }
                        }
                        else if (YuMiMainPage.xType == 2)
                        {
                            switch (com.SelectedIndex)
                            {
                                case 0:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000005");
                                        setTitle("玉米特性参数坐标轴描述表", "000005");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000006");
                                        setTitle("玉米特性参数坐标轴描述表", "000006");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                case 1:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000017");
                                        setTitle("玉米特性参数坐标轴描述表", "000017");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000018");
                                        setTitle("玉米特性参数坐标轴描述表", "000018");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                case 2:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000029");
                                        setTitle("玉米特性参数坐标轴描述表", "000029");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000030");
                                        setTitle("玉米特性参数坐标轴描述表", "000030");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                case 3:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000041");
                                        setTitle("玉米特性参数坐标轴描述表", "000041");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000042");
                                        setTitle("玉米特性参数坐标轴描述表", "000042");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                case 4:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000053");
                                        setTitle("玉米特性参数坐标轴描述表", "000053");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000054");
                                        setTitle("玉米特性参数坐标轴描述表", "000054");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                default:
                                    break;
                            }
                        }
                        else if (YuMiMainPage.xType == 3)
                        {
                            switch (com.SelectedIndex)
                            {
                                case 0:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000009");
                                        setTitle("玉米特性参数坐标轴描述表", "000009");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000010");
                                        setTitle("玉米特性参数坐标轴描述表", "000010");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                case 1:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000021");
                                        setTitle("玉米特性参数坐标轴描述表", "000021");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000022");
                                        setTitle("玉米特性参数坐标轴描述表", "000022");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                case 2:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000033");
                                        setTitle("玉米特性参数坐标轴描述表", "000033");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000034");
                                        setTitle("玉米特性参数坐标轴描述表", "000034");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                case 3:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000045");
                                        setTitle("玉米特性参数坐标轴描述表", "000045");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000046");
                                        setTitle("玉米特性参数坐标轴描述表", "000046");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                case 4:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000057");
                                        setTitle("玉米特性参数坐标轴描述表", "000057");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000058");
                                        setTitle("玉米特性参数坐标轴描述表", "000058");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                default:
                                    break;
                            }
                        }
                        setAxes(models);
                        InitBarChart(models);
                        InitLineBar(models, "low");
                        InitLineBar(models, "high");
                        InitLineBar(models, "media");
                        break;
                    case 2:
                        if (YuMiMainPage.xType == 1)
                        {
                            switch (com.SelectedIndex)
                            {
                                case 0:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000001");
                                        setTitle("玉米特性参数坐标轴描述表", "000001");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000002");
                                        setTitle("玉米特性参数坐标轴描述表", "000002");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                case 1:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000013");
                                        setTitle("玉米特性参数坐标轴描述表", "000013");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000014");
                                        setTitle("玉米特性参数坐标轴描述表", "000014");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                case 2:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000025");
                                        setTitle("玉米特性参数坐标轴描述表", "000025");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000026");
                                        setTitle("玉米特性参数坐标轴描述表", "000026");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                case 3:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000037");
                                        setTitle("玉米特性参数坐标轴描述表", "000037");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000038");
                                        setTitle("玉米特性参数坐标轴描述表", "000038");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                case 4:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000049");
                                        setTitle("玉米特性参数坐标轴描述表", "000049");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000050");
                                        setTitle("玉米特性参数坐标轴描述表", "000050");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                default:
                                    break;
                            }
                        }
                        else if (YuMiMainPage.xType == 2)
                        {
                            switch (com.SelectedIndex)
                            {
                                case 0:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000005");
                                        setTitle("玉米特性参数坐标轴描述表", "000005");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000006");
                                        setTitle("玉米特性参数坐标轴描述表", "000006");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                case 1:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000017");
                                        setTitle("玉米特性参数坐标轴描述表", "000017");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000018");
                                        setTitle("玉米特性参数坐标轴描述表", "000018");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                case 2:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000029");
                                        setTitle("玉米特性参数坐标轴描述表", "000029");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000030");
                                        setTitle("玉米特性参数坐标轴描述表", "000030");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                case 3:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000041");
                                        setTitle("玉米特性参数坐标轴描述表", "000041");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000042");
                                        setTitle("玉米特性参数坐标轴描述表", "000042");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                case 4:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000053");
                                        setTitle("玉米特性参数坐标轴描述表", "000053");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000054");
                                        setTitle("玉米特性参数坐标轴描述表", "000054");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                default:
                                    break;
                            }
                        }
                        else if (YuMiMainPage.xType == 3)
                        {
                            switch (com.SelectedIndex)
                            {
                                case 0:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000009");
                                        setTitle("玉米特性参数坐标轴描述表", "000009");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000010");
                                        setTitle("玉米特性参数坐标轴描述表", "000010");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                case 1:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000021");
                                        setTitle("玉米特性参数坐标轴描述表", "000021");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000022");
                                        setTitle("玉米特性参数坐标轴描述表", "000022");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                case 2:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000033");
                                        setTitle("玉米特性参数坐标轴描述表", "000033");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000034");
                                        setTitle("玉米特性参数坐标轴描述表", "000034");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                case 3:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000045");
                                        setTitle("玉米特性参数坐标轴描述表", "000045");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000046");
                                        setTitle("玉米特性参数坐标轴描述表", "000046");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                case 4:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000057");
                                        setTitle("玉米特性参数坐标轴描述表", "000057");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000058");
                                        setTitle("玉米特性参数坐标轴描述表", "000058");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                default:
                                    break;
                            }
                        }
                        setAddToSpeedAxes(models);
                        InitAddToSpeedSpline(models);
                        break;
                    case 3:
                        if (YuMiMainPage.xType == 1)
                        {
                            switch (com.SelectedIndex)
                            {
                                case 0:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000001");
                                        setTitle("玉米特性参数坐标轴描述表", "000001");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000002");
                                        setTitle("玉米特性参数坐标轴描述表", "000002");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                case 1:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000013");
                                        setTitle("玉米特性参数坐标轴描述表", "000013");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000014");
                                        setTitle("玉米特性参数坐标轴描述表", "000014");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                case 2:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000025");
                                        setTitle("玉米特性参数坐标轴描述表", "000025");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000026");
                                        setTitle("玉米特性参数坐标轴描述表", "000026");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                case 3:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000037");
                                        setTitle("玉米特性参数坐标轴描述表", "000037");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000038");
                                        setTitle("玉米特性参数坐标轴描述表", "000038");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                case 4:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000049");
                                        setTitle("玉米特性参数坐标轴描述表", "000049");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000050");
                                        setTitle("玉米特性参数坐标轴描述表", "000050");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                default:
                                    break;
                            }
                        }
                        else if (YuMiMainPage.xType == 2)
                        {
                            switch (com.SelectedIndex)
                            {
                                case 0:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000005");
                                        setTitle("玉米特性参数坐标轴描述表", "000005");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000006");
                                        setTitle("玉米特性参数坐标轴描述表", "000006");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                case 1:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000017");
                                        setTitle("玉米特性参数坐标轴描述表", "000017");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000018");
                                        setTitle("玉米特性参数坐标轴描述表", "000018");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                case 2:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000029");
                                        setTitle("玉米特性参数坐标轴描述表", "000029");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000030");
                                        setTitle("玉米特性参数坐标轴描述表", "000030");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                case 3:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000041");
                                        setTitle("玉米特性参数坐标轴描述表", "000041");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000042");
                                        setTitle("玉米特性参数坐标轴描述表", "000042");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                case 4:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000053");
                                        setTitle("玉米特性参数坐标轴描述表", "000053");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000054");
                                        setTitle("玉米特性参数坐标轴描述表", "000054");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                default:
                                    break;
                            }
                        }
                        else if (YuMiMainPage.xType == 3)
                        {
                            switch (com.SelectedIndex)
                            {
                                case 0:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000009");
                                        setTitle("玉米特性参数坐标轴描述表", "000009");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000010");
                                        setTitle("玉米特性参数坐标轴描述表", "000010");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                case 1:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000021");
                                        setTitle("玉米特性参数坐标轴描述表", "000021");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000022");
                                        setTitle("玉米特性参数坐标轴描述表", "000022");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                case 2:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000033");
                                        setTitle("玉米特性参数坐标轴描述表", "000033");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000034");
                                        setTitle("玉米特性参数坐标轴描述表", "000034");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                case 3:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000045");
                                        setTitle("玉米特性参数坐标轴描述表", "000045");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000046");
                                        setTitle("玉米特性参数坐标轴描述表", "000046");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                case 4:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000057");
                                        setTitle("玉米特性参数坐标轴描述表", "000057");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000058");
                                        setTitle("玉米特性参数坐标轴描述表", "000058");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                default:
                                    break;
                            }
                        }
                        setAxes(models);
                        InitSpline(models);
                        break;
                    case 4:
                        if (YuMiMainPage.xType == 1)
                        {
                            switch (com.SelectedIndex)
                            {
                                case 0:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000001");
                                        setTitle("玉米特性参数坐标轴描述表", "000001");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000002");
                                        setTitle("玉米特性参数坐标轴描述表", "000002");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                case 1:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000013");
                                        setTitle("玉米特性参数坐标轴描述表", "000013");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000014");
                                        setTitle("玉米特性参数坐标轴描述表", "000014");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                case 2:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000025");
                                        setTitle("玉米特性参数坐标轴描述表", "000025");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000026");
                                        setTitle("玉米特性参数坐标轴描述表", "000026");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                case 3:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000037");
                                        setTitle("玉米特性参数坐标轴描述表", "000037");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000038");
                                        setTitle("玉米特性参数坐标轴描述表", "000038");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                case 4:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000049");
                                        setTitle("玉米特性参数坐标轴描述表", "000049");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000050");
                                        setTitle("玉米特性参数坐标轴描述表", "000050");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                default:
                                    break;
                            }
                        }
                        else if (YuMiMainPage.xType == 2)
                        {
                            switch (com.SelectedIndex)
                            {
                                case 0:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000005");
                                        setTitle("玉米特性参数坐标轴描述表", "000005");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000006");
                                        setTitle("玉米特性参数坐标轴描述表", "000006");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                case 1:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000017");
                                        setTitle("玉米特性参数坐标轴描述表", "000017");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000018");
                                        setTitle("玉米特性参数坐标轴描述表", "000018");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                case 2:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000029");
                                        setTitle("玉米特性参数坐标轴描述表", "000029");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000030");
                                        setTitle("玉米特性参数坐标轴描述表", "000030");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                case 3:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000041");
                                        setTitle("玉米特性参数坐标轴描述表", "000041");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000042");
                                        setTitle("玉米特性参数坐标轴描述表", "000042");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                case 4:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000053");
                                        setTitle("玉米特性参数坐标轴描述表", "000053");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000054");
                                        setTitle("玉米特性参数坐标轴描述表", "000054");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                default:
                                    break;
                            }
                        }
                        else if (YuMiMainPage.xType == 3)
                        {
                            switch (com.SelectedIndex)
                            {
                                case 0:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000009");
                                        setTitle("玉米特性参数坐标轴描述表", "000009");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000010");
                                        setTitle("玉米特性参数坐标轴描述表", "000010");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                case 1:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000021");
                                        setTitle("玉米特性参数坐标轴描述表", "000021");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000022");
                                        setTitle("玉米特性参数坐标轴描述表", "000022");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                case 2:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000033");
                                        setTitle("玉米特性参数坐标轴描述表", "000033");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000034");
                                        setTitle("玉米特性参数坐标轴描述表", "000034");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                case 3:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000045");
                                        setTitle("玉米特性参数坐标轴描述表", "000045");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000046");
                                        setTitle("玉米特性参数坐标轴描述表", "000046");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                case 4:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000057");
                                        setTitle("玉米特性参数坐标轴描述表", "000057");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000058");
                                        setTitle("玉米特性参数坐标轴描述表", "000058");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                default:
                                    break;
                            }
                        }
                        setAxes(models);
                        InitSpline(models);
                        break;
                    case 5:
                         if (YuMiMainPage.xType == 1)
                        {
                            switch (com.SelectedIndex)
                            {
                                case 0:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000001");
                                        setTitle("玉米特性参数坐标轴描述表", "000001");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000002");
                                        setTitle("玉米特性参数坐标轴描述表", "000002");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                case 1:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000013");
                                        setTitle("玉米特性参数坐标轴描述表", "000013");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000014");
                                        setTitle("玉米特性参数坐标轴描述表", "000014");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                case 2:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000025");
                                        setTitle("玉米特性参数坐标轴描述表", "000025");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000026");
                                        setTitle("玉米特性参数坐标轴描述表", "000026");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                case 3:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000037");
                                        setTitle("玉米特性参数坐标轴描述表", "000037");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000038");
                                        setTitle("玉米特性参数坐标轴描述表", "000038");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                case 4:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000049");
                                        setTitle("玉米特性参数坐标轴描述表", "000049");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000050");
                                        setTitle("玉米特性参数坐标轴描述表", "000050");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                default:
                                    break;
                            }
                        }
                        else if (YuMiMainPage.xType == 2)
                        {
                            switch (com.SelectedIndex)
                            {
                                case 0:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000005");
                                        setTitle("玉米特性参数坐标轴描述表", "000005");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000006");
                                        setTitle("玉米特性参数坐标轴描述表", "000006");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                case 1:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000017");
                                        setTitle("玉米特性参数坐标轴描述表", "000017");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000018");
                                        setTitle("玉米特性参数坐标轴描述表", "000018");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                case 2:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000029");
                                        setTitle("玉米特性参数坐标轴描述表", "000029");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000030");
                                        setTitle("玉米特性参数坐标轴描述表", "000030");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                case 3:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000041");
                                        setTitle("玉米特性参数坐标轴描述表", "000041");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000042");
                                        setTitle("玉米特性参数坐标轴描述表", "000042");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                case 4:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000053");
                                        setTitle("玉米特性参数坐标轴描述表", "000053");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000054");
                                        setTitle("玉米特性参数坐标轴描述表", "000054");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                default:
                                    break;
                            }
                        }
                        else if (YuMiMainPage.xType == 3)
                        {
                            switch (com.SelectedIndex)
                            {
                                case 0:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000009");
                                        setTitle("玉米特性参数坐标轴描述表", "000009");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000010");
                                        setTitle("玉米特性参数坐标轴描述表", "000010");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                case 1:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000021");
                                        setTitle("玉米特性参数坐标轴描述表", "000021");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000022");
                                        setTitle("玉米特性参数坐标轴描述表", "000022");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                case 2:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000033");
                                        setTitle("玉米特性参数坐标轴描述表", "000033");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000034");
                                        setTitle("玉米特性参数坐标轴描述表", "000034");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                case 3:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000045");
                                        setTitle("玉米特性参数坐标轴描述表", "000045");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000046");
                                        setTitle("玉米特性参数坐标轴描述表", "000046");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                case 4:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000057");
                                        setTitle("玉米特性参数坐标轴描述表", "000057");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000058");
                                        setTitle("玉米特性参数坐标轴描述表", "000058");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                default:
                                    break;
                            }
                        }
                        setAxes(models);
                        InitBarChart(models);
                        break;
                    case 6:
                        if (YuMiMainPage.xType == 1)
                        {
                            switch (com.SelectedIndex)
                            {
                                case 0:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000001");
                                        setTitle("玉米特性参数坐标轴描述表", "000001");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000002");
                                        setTitle("玉米特性参数坐标轴描述表", "000002");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                case 1:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000013");
                                        setTitle("玉米特性参数坐标轴描述表", "000013");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000014");
                                        setTitle("玉米特性参数坐标轴描述表", "000014");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                case 2:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000025");
                                        setTitle("玉米特性参数坐标轴描述表", "000025");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000026");
                                        setTitle("玉米特性参数坐标轴描述表", "000026");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                case 3:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000037");
                                        setTitle("玉米特性参数坐标轴描述表", "000037");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000038");
                                        setTitle("玉米特性参数坐标轴描述表", "000038");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                case 4:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000049");
                                        setTitle("玉米特性参数坐标轴描述表", "000049");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000050");
                                        setTitle("玉米特性参数坐标轴描述表", "000050");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                default:
                                    break;
                            }
                        }
                        else if (YuMiMainPage.xType == 2)
                        {
                            switch (com.SelectedIndex)
                            {
                                case 0:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000005");
                                        setTitle("玉米特性参数坐标轴描述表", "000005");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000006");
                                        setTitle("玉米特性参数坐标轴描述表", "000006");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                case 1:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000017");
                                        setTitle("玉米特性参数坐标轴描述表", "000017");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000018");
                                        setTitle("玉米特性参数坐标轴描述表", "000018");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                case 2:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000029");
                                        setTitle("玉米特性参数坐标轴描述表", "000029");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000030");
                                        setTitle("玉米特性参数坐标轴描述表", "000030");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                case 3:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000041");
                                        setTitle("玉米特性参数坐标轴描述表", "000041");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000042");
                                        setTitle("玉米特性参数坐标轴描述表", "000042");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                case 4:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000053");
                                        setTitle("玉米特性参数坐标轴描述表", "000053");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000054");
                                        setTitle("玉米特性参数坐标轴描述表", "000054");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                default:
                                    break;
                            }
                        }
                        else if (YuMiMainPage.xType == 3)
                        {
                            switch (com.SelectedIndex)
                            {
                                case 0:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000009");
                                        setTitle("玉米特性参数坐标轴描述表", "000009");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000010");
                                        setTitle("玉米特性参数坐标轴描述表", "000010");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                case 1:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000021");
                                        setTitle("玉米特性参数坐标轴描述表", "000021");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000022");
                                        setTitle("玉米特性参数坐标轴描述表", "000022");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                case 2:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000033");
                                        setTitle("玉米特性参数坐标轴描述表", "000033");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000034");
                                        setTitle("玉米特性参数坐标轴描述表", "000034");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                case 3:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000045");
                                        setTitle("玉米特性参数坐标轴描述表", "000045");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000046");
                                        setTitle("玉米特性参数坐标轴描述表", "000046");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                case 4:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000057");
                                        setTitle("玉米特性参数坐标轴描述表", "000057");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000058");
                                        setTitle("玉米特性参数坐标轴描述表", "000058");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                default:
                                    break;
                            }
                        }
                        setAxes(models);
                        InitLine(models);
                        break;
                    case 7:
                        if (YuMiMainPage.xType == 1)
                        {
                            switch (com.SelectedIndex)
                            {
                                case 0:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000001");
                                        setTitle("玉米特性参数坐标轴描述表", "000001");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000002");
                                        setTitle("玉米特性参数坐标轴描述表", "000002");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                case 1:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000013");
                                        setTitle("玉米特性参数坐标轴描述表", "000013");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000014");
                                        setTitle("玉米特性参数坐标轴描述表", "000014");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                case 2:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000025");
                                        setTitle("玉米特性参数坐标轴描述表", "000025");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000026");
                                        setTitle("玉米特性参数坐标轴描述表", "000026");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                case 3:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000037");
                                        setTitle("玉米特性参数坐标轴描述表", "000037");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000038");
                                        setTitle("玉米特性参数坐标轴描述表", "000038");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                case 4:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000049");
                                        setTitle("玉米特性参数坐标轴描述表", "000049");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000050");
                                        setTitle("玉米特性参数坐标轴描述表", "000050");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                default:
                                    break;
                            }
                        }
                        else if (YuMiMainPage.xType == 2)
                        {
                            switch (com.SelectedIndex)
                            {
                                case 0:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000005");
                                        setTitle("玉米特性参数坐标轴描述表", "000005");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000006");
                                        setTitle("玉米特性参数坐标轴描述表", "000006");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                case 1:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000017");
                                        setTitle("玉米特性参数坐标轴描述表", "000017");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000018");
                                        setTitle("玉米特性参数坐标轴描述表", "000018");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                case 2:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000029");
                                        setTitle("玉米特性参数坐标轴描述表", "000029");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000030");
                                        setTitle("玉米特性参数坐标轴描述表", "000030");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                case 3:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000041");
                                        setTitle("玉米特性参数坐标轴描述表", "000041");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000042");
                                        setTitle("玉米特性参数坐标轴描述表", "000042");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                case 4:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000053");
                                        setTitle("玉米特性参数坐标轴描述表", "000053");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000054");
                                        setTitle("玉米特性参数坐标轴描述表", "000054");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                default:
                                    break;
                            }
                        }
                        else if (YuMiMainPage.xType == 3)
                        {
                            switch (com.SelectedIndex)
                            {
                                case 0:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000009");
                                        setTitle("玉米特性参数坐标轴描述表", "000009");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000010");
                                        setTitle("玉米特性参数坐标轴描述表", "000010");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                case 1:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000021");
                                        setTitle("玉米特性参数坐标轴描述表", "000021");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000022");
                                        setTitle("玉米特性参数坐标轴描述表", "000022");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                case 2:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000033");
                                        setTitle("玉米特性参数坐标轴描述表", "000033");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000034");
                                        setTitle("玉米特性参数坐标轴描述表", "000034");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                case 3:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000045");
                                        setTitle("玉米特性参数坐标轴描述表", "000045");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000046");
                                        setTitle("玉米特性参数坐标轴描述表", "000046");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                case 4:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000057");
                                        setTitle("玉米特性参数坐标轴描述表", "000057");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000058");
                                        setTitle("玉米特性参数坐标轴描述表", "000058");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                default:
                                    break;
                            }
                        }
                        InitDongTai(models);
                    
                        break;
                    case 8:
                        if (YuMiMainPage.xType == 1)
                        {
                            switch (com.SelectedIndex)
                            {
                                case 0:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000001");
                                        setTitle("玉米特性参数坐标轴描述表", "000001");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000002");
                                        setTitle("玉米特性参数坐标轴描述表", "000002");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                case 1:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000013");
                                        setTitle("玉米特性参数坐标轴描述表", "000013");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000014");
                                        setTitle("玉米特性参数坐标轴描述表", "000014");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                case 2:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000025");
                                        setTitle("玉米特性参数坐标轴描述表", "000025");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000026");
                                        setTitle("玉米特性参数坐标轴描述表", "000026");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                case 3:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000037");
                                        setTitle("玉米特性参数坐标轴描述表", "000037");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000038");
                                        setTitle("玉米特性参数坐标轴描述表", "000038");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                case 4:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000049");
                                        setTitle("玉米特性参数坐标轴描述表", "000049");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000050");
                                        setTitle("玉米特性参数坐标轴描述表", "000050");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                default:
                                    break;
                            }
                        }
                        else if (YuMiMainPage.xType == 2)
                        {
                            switch (com.SelectedIndex)
                            {
                                case 0:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000005");
                                        setTitle("玉米特性参数坐标轴描述表", "000005");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000006");
                                        setTitle("玉米特性参数坐标轴描述表", "000006");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                case 1:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000017");
                                        setTitle("玉米特性参数坐标轴描述表", "000017");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000018");
                                        setTitle("玉米特性参数坐标轴描述表", "000018");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                case 2:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000029");
                                        setTitle("玉米特性参数坐标轴描述表", "000029");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000030");
                                        setTitle("玉米特性参数坐标轴描述表", "000030");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                case 3:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000041");
                                        setTitle("玉米特性参数坐标轴描述表", "000041");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000042");
                                        setTitle("玉米特性参数坐标轴描述表", "000042");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                case 4:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000053");
                                        setTitle("玉米特性参数坐标轴描述表", "000053");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000054");
                                        setTitle("玉米特性参数坐标轴描述表", "000054");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                default:
                                    break;
                            }
                        }
                        else if (YuMiMainPage.xType == 3)
                        {
                            switch (com.SelectedIndex)
                            {
                                case 0:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000009");
                                        setTitle("玉米特性参数坐标轴描述表", "000009");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000010");
                                        setTitle("玉米特性参数坐标轴描述表", "000010");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                case 1:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000021");
                                        setTitle("玉米特性参数坐标轴描述表", "000021");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000022");
                                        setTitle("玉米特性参数坐标轴描述表", "000022");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                case 2:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000033");
                                        setTitle("玉米特性参数坐标轴描述表", "000033");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000034");
                                        setTitle("玉米特性参数坐标轴描述表", "000034");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                case 3:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000045");
                                        setTitle("玉米特性参数坐标轴描述表", "000045");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000046");
                                        setTitle("玉米特性参数坐标轴描述表", "000046");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                case 4:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000057");
                                        setTitle("玉米特性参数坐标轴描述表", "000057");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000058");
                                        setTitle("玉米特性参数坐标轴描述表", "000058");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                default:
                                    break;
                            }
                        }
                        setBubbleAxes(models);
                        InitBubble(models);
                        break;
                    default:
                        MessageBox.Show("没有数据显示");
                        break;
                }
            }
            else if (YuMiMainPage.yType == 2)
            {
                switch (YuMiTeXingaCanShuPage.type)
                {
                    case 1:
                        if (YuMiMainPage.xType == 1)
                        {
                            switch (com.SelectedIndex)
                            {
                                case 0:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000003");
                                        setTitle("玉米特性参数坐标轴描述表", "000003");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000004");
                                        setTitle("玉米特性参数坐标轴描述表", "000004");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                case 1:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000015");
                                        setTitle("玉米特性参数坐标轴描述表", "000015");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000016");
                                        setTitle("玉米特性参数坐标轴描述表", "000016");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                case 2:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000027");
                                        setTitle("玉米特性参数坐标轴描述表", "000027");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000028");
                                        setTitle("玉米特性参数坐标轴描述表", "000028");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                case 3:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000039");
                                        setTitle("玉米特性参数坐标轴描述表", "000039");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000040");
                                        setTitle("玉米特性参数坐标轴描述表", "000040");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                case 4:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000051");
                                        setTitle("玉米特性参数坐标轴描述表", "000051");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000052");
                                        setTitle("玉米特性参数坐标轴描述表", "000052");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                default:
                                    break;
                            }
                        }
                        else if (YuMiMainPage.xType == 2)
                        {
                            switch (com.SelectedIndex)
                            {
                                case 0:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000007");
                                        setTitle("玉米特性参数坐标轴描述表", "000007");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000008");
                                        setTitle("玉米特性参数坐标轴描述表", "000008");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                case 1:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000019");
                                        setTitle("玉米特性参数坐标轴描述表", "000019");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000020");
                                        setTitle("玉米特性参数坐标轴描述表", "000020");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                case 2:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000031");
                                        setTitle("玉米特性参数坐标轴描述表", "000031");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000032");
                                        setTitle("玉米特性参数坐标轴描述表", "000032");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                case 3:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000043");
                                        setTitle("玉米特性参数坐标轴描述表", "000043");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000044");
                                        setTitle("玉米特性参数坐标轴描述表", "000044");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                case 4:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000055");
                                        setTitle("玉米特性参数坐标轴描述表", "000055");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000056");
                                        setTitle("玉米特性参数坐标轴描述表", "000056");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                default:
                                    break;
                            }
                        }
                        else if (YuMiMainPage.xType == 3)
                        {
                            switch (com.SelectedIndex)
                            {
                                case 0:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000011");
                                        setTitle("玉米特性参数坐标轴描述表", "000011");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000012");
                                        setTitle("玉米特性参数坐标轴描述表", "000012");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                case 1:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000023");
                                        setTitle("玉米特性参数坐标轴描述表", "000023");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000024");
                                        setTitle("玉米特性参数坐标轴描述表", "000024");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                case 2:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000035");
                                        setTitle("玉米特性参数坐标轴描述表", "000035");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000036");
                                        setTitle("玉米特性参数坐标轴描述表", "000036");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                case 3:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000047");
                                        setTitle("玉米特性参数坐标轴描述表", "000047");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000048");
                                        setTitle("玉米特性参数坐标轴描述表", "000048");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                case 4:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000059");
                                        setTitle("玉米特性参数坐标轴描述表", "000059");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000060");
                                        setTitle("玉米特性参数坐标轴描述表", "000060");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                default:
                                    break;
                            }
                        }
                        setAxes(models);
                        InitBarChart(models);
                        InitLineBar(models, "low");
                        InitLineBar(models, "high");
                        InitLineBar(models, "media");
                        break;
                    case 2:
                        if (YuMiMainPage.xType == 1)
                        {
                            switch (com.SelectedIndex)
                            {
                                case 0:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000003");
                                        setTitle("玉米特性参数坐标轴描述表", "000003");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000004");
                                        setTitle("玉米特性参数坐标轴描述表", "000004");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                case 1:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000015");
                                        setTitle("玉米特性参数坐标轴描述表", "000015");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000016");
                                        setTitle("玉米特性参数坐标轴描述表", "000016");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                case 2:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000027");
                                        setTitle("玉米特性参数坐标轴描述表", "000027");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000028");
                                        setTitle("玉米特性参数坐标轴描述表", "000028");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                case 3:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000039");
                                        setTitle("玉米特性参数坐标轴描述表", "000039");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000040");
                                        setTitle("玉米特性参数坐标轴描述表", "000040");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                case 4:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000051");
                                        setTitle("玉米特性参数坐标轴描述表", "000051");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000052");
                                        setTitle("玉米特性参数坐标轴描述表", "000052");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                default:
                                    break;
                            }
                        }
                        else if (YuMiMainPage.xType == 2)
                        {
                            switch (com.SelectedIndex)
                            {
                                case 0:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000007");
                                        setTitle("玉米特性参数坐标轴描述表", "000007");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000008");
                                        setTitle("玉米特性参数坐标轴描述表", "000008");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                case 1:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000019");
                                        setTitle("玉米特性参数坐标轴描述表", "000019");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000020");
                                        setTitle("玉米特性参数坐标轴描述表", "000020");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                case 2:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000031");
                                        setTitle("玉米特性参数坐标轴描述表", "000031");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000032");
                                        setTitle("玉米特性参数坐标轴描述表", "000032");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                case 3:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000043");
                                        setTitle("玉米特性参数坐标轴描述表", "000043");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000044");
                                        setTitle("玉米特性参数坐标轴描述表", "000044");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                case 4:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000055");
                                        setTitle("玉米特性参数坐标轴描述表", "000055");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000056");
                                        setTitle("玉米特性参数坐标轴描述表", "000056");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                default:
                                    break;
                            }
                        }
                        else if (YuMiMainPage.xType == 3)
                        {
                            switch (com.SelectedIndex)
                            {
                                case 0:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000011");
                                        setTitle("玉米特性参数坐标轴描述表", "000011");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000012");
                                        setTitle("玉米特性参数坐标轴描述表", "000012");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                case 1:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000023");
                                        setTitle("玉米特性参数坐标轴描述表", "000023");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000024");
                                        setTitle("玉米特性参数坐标轴描述表", "000024");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                case 2:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000035");
                                        setTitle("玉米特性参数坐标轴描述表", "000035");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000036");
                                        setTitle("玉米特性参数坐标轴描述表", "000036");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                case 3:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000047");
                                        setTitle("玉米特性参数坐标轴描述表", "000047");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000048");
                                        setTitle("玉米特性参数坐标轴描述表", "000048");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                case 4:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000059");
                                        setTitle("玉米特性参数坐标轴描述表", "000059");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000060");
                                        setTitle("玉米特性参数坐标轴描述表", "000060");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                default:
                                    break;
                            }
                        }
                        setAddToSpeedAxes(models);
                        InitAddToSpeedSpline(models);
                        break;
                    case 3:
                        if (YuMiMainPage.xType == 1)
                        {
                            switch (com.SelectedIndex)
                            {
                                case 0:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000003");
                                        setTitle("玉米特性参数坐标轴描述表", "000003");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000004");
                                        setTitle("玉米特性参数坐标轴描述表", "000004");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                case 1:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000015");
                                        setTitle("玉米特性参数坐标轴描述表", "000015");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000016");
                                        setTitle("玉米特性参数坐标轴描述表", "000016");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                case 2:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000027");
                                        setTitle("玉米特性参数坐标轴描述表", "000027");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000028");
                                        setTitle("玉米特性参数坐标轴描述表", "000028");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                case 3:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000039");
                                        setTitle("玉米特性参数坐标轴描述表", "000039");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000040");
                                        setTitle("玉米特性参数坐标轴描述表", "000040");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                case 4:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000051");
                                        setTitle("玉米特性参数坐标轴描述表", "000051");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000052");
                                        setTitle("玉米特性参数坐标轴描述表", "000052");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                default:
                                    break;
                            }
                        }
                        else if (YuMiMainPage.xType == 2)
                        {
                            switch (com.SelectedIndex)
                            {
                                case 0:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000007");
                                        setTitle("玉米特性参数坐标轴描述表", "000007");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000008");
                                        setTitle("玉米特性参数坐标轴描述表", "000008");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                case 1:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000019");
                                        setTitle("玉米特性参数坐标轴描述表", "000019");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000020");
                                        setTitle("玉米特性参数坐标轴描述表", "000020");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                case 2:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000031");
                                        setTitle("玉米特性参数坐标轴描述表", "000031");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000032");
                                        setTitle("玉米特性参数坐标轴描述表", "000032");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                case 3:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000043");
                                        setTitle("玉米特性参数坐标轴描述表", "000043");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000044");
                                        setTitle("玉米特性参数坐标轴描述表", "000044");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                case 4:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000055");
                                        setTitle("玉米特性参数坐标轴描述表", "000055");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000056");
                                        setTitle("玉米特性参数坐标轴描述表", "000056");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                default:
                                    break;
                            }
                        }
                        else if (YuMiMainPage.xType == 3)
                        {
                            switch (com.SelectedIndex)
                            {
                                case 0:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000011");
                                        setTitle("玉米特性参数坐标轴描述表", "000011");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000012");
                                        setTitle("玉米特性参数坐标轴描述表", "000012");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                case 1:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000023");
                                        setTitle("玉米特性参数坐标轴描述表", "000023");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000024");
                                        setTitle("玉米特性参数坐标轴描述表", "000024");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                case 2:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000035");
                                        setTitle("玉米特性参数坐标轴描述表", "000035");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000036");
                                        setTitle("玉米特性参数坐标轴描述表", "000036");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                case 3:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000047");
                                        setTitle("玉米特性参数坐标轴描述表", "000047");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000048");
                                        setTitle("玉米特性参数坐标轴描述表", "000048");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                case 4:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000059");
                                        setTitle("玉米特性参数坐标轴描述表", "000059");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000060");
                                        setTitle("玉米特性参数坐标轴描述表", "000060");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                default:
                                    break;
                            }
                        }
                        setAxes(models);
                        InitSpline(models);
                        break;
                    case 4:
                        if (YuMiMainPage.xType == 1)
                        {
                            switch (com.SelectedIndex)
                            {
                                case 0:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000003");
                                        setTitle("玉米特性参数坐标轴描述表", "000003");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000004");
                                        setTitle("玉米特性参数坐标轴描述表", "000004");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                case 1:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000015");
                                        setTitle("玉米特性参数坐标轴描述表", "000015");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000016");
                                        setTitle("玉米特性参数坐标轴描述表", "000016");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                case 2:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000027");
                                        setTitle("玉米特性参数坐标轴描述表", "000027");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000028");
                                        setTitle("玉米特性参数坐标轴描述表", "000028");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                case 3:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000039");
                                        setTitle("玉米特性参数坐标轴描述表", "000039");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000040");
                                        setTitle("玉米特性参数坐标轴描述表", "000040");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                case 4:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000051");
                                        setTitle("玉米特性参数坐标轴描述表", "000051");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000052");
                                        setTitle("玉米特性参数坐标轴描述表", "000052");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                default:
                                    break;
                            }
                        }
                        else if (YuMiMainPage.xType == 2)
                        {
                            switch (com.SelectedIndex)
                            {
                                case 0:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000007");
                                        setTitle("玉米特性参数坐标轴描述表", "000007");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000008");
                                        setTitle("玉米特性参数坐标轴描述表", "000008");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                case 1:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000019");
                                        setTitle("玉米特性参数坐标轴描述表", "000019");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000020");
                                        setTitle("玉米特性参数坐标轴描述表", "000020");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                case 2:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000031");
                                        setTitle("玉米特性参数坐标轴描述表", "000031");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000032");
                                        setTitle("玉米特性参数坐标轴描述表", "000032");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                case 3:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000043");
                                        setTitle("玉米特性参数坐标轴描述表", "000043");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000044");
                                        setTitle("玉米特性参数坐标轴描述表", "000044");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                case 4:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000055");
                                        setTitle("玉米特性参数坐标轴描述表", "000055");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000056");
                                        setTitle("玉米特性参数坐标轴描述表", "000056");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                default:
                                    break;
                            }
                        }
                        else if (YuMiMainPage.xType == 3)
                        {
                            switch (com.SelectedIndex)
                            {
                                case 0:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000011");
                                        setTitle("玉米特性参数坐标轴描述表", "000011");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000012");
                                        setTitle("玉米特性参数坐标轴描述表", "000012");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                case 1:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000023");
                                        setTitle("玉米特性参数坐标轴描述表", "000023");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000024");
                                        setTitle("玉米特性参数坐标轴描述表", "000024");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                case 2:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000035");
                                        setTitle("玉米特性参数坐标轴描述表", "000035");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000036");
                                        setTitle("玉米特性参数坐标轴描述表", "000036");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                case 3:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000047");
                                        setTitle("玉米特性参数坐标轴描述表", "000047");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000048");
                                        setTitle("玉米特性参数坐标轴描述表", "000048");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                case 4:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000059");
                                        setTitle("玉米特性参数坐标轴描述表", "000059");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000060");
                                        setTitle("玉米特性参数坐标轴描述表", "000060");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                default:
                                    break;
                            }
                        }
                        setAxes(models);
                        InitSpline(models);
                        break;
                    case 5:
                        if (YuMiMainPage.xType == 1)
                        {
                            switch (com.SelectedIndex)
                            {
                                case 0:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000003");
                                        setTitle("玉米特性参数坐标轴描述表", "000003");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000004");
                                        setTitle("玉米特性参数坐标轴描述表", "000004");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                case 1:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000015");
                                        setTitle("玉米特性参数坐标轴描述表", "000015");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000016");
                                        setTitle("玉米特性参数坐标轴描述表", "000016");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                case 2:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000027");
                                        setTitle("玉米特性参数坐标轴描述表", "000027");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000028");
                                        setTitle("玉米特性参数坐标轴描述表", "000028");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                case 3:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000039");
                                        setTitle("玉米特性参数坐标轴描述表", "000039");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000040");
                                        setTitle("玉米特性参数坐标轴描述表", "000040");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                case 4:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000051");
                                        setTitle("玉米特性参数坐标轴描述表", "000051");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000052");
                                        setTitle("玉米特性参数坐标轴描述表", "000052");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                default:
                                    break;
                            }
                        }
                        else if (YuMiMainPage.xType == 2)
                        {
                            switch (com.SelectedIndex)
                            {
                                case 0:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000007");
                                        setTitle("玉米特性参数坐标轴描述表", "000007");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000008");
                                        setTitle("玉米特性参数坐标轴描述表", "000008");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                case 1:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000019");
                                        setTitle("玉米特性参数坐标轴描述表", "000019");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000020");
                                        setTitle("玉米特性参数坐标轴描述表", "000020");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                case 2:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000031");
                                        setTitle("玉米特性参数坐标轴描述表", "000031");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000032");
                                        setTitle("玉米特性参数坐标轴描述表", "000032");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                case 3:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000043");
                                        setTitle("玉米特性参数坐标轴描述表", "000043");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000044");
                                        setTitle("玉米特性参数坐标轴描述表", "000044");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                case 4:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000055");
                                        setTitle("玉米特性参数坐标轴描述表", "000055");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000056");
                                        setTitle("玉米特性参数坐标轴描述表", "000056");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                default:
                                    break;
                            }
                        }
                        else if (YuMiMainPage.xType == 3)
                        {
                            switch (com.SelectedIndex)
                            {
                                case 0:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000011");
                                        setTitle("玉米特性参数坐标轴描述表", "000011");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000012");
                                        setTitle("玉米特性参数坐标轴描述表", "000012");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                case 1:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000023");
                                        setTitle("玉米特性参数坐标轴描述表", "000023");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000024");
                                        setTitle("玉米特性参数坐标轴描述表", "000024");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                case 2:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000035");
                                        setTitle("玉米特性参数坐标轴描述表", "000035");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000036");
                                        setTitle("玉米特性参数坐标轴描述表", "000036");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                case 3:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000047");
                                        setTitle("玉米特性参数坐标轴描述表", "000047");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000048");
                                        setTitle("玉米特性参数坐标轴描述表", "000048");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                case 4:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000059");
                                        setTitle("玉米特性参数坐标轴描述表", "000059");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000060");
                                        setTitle("玉米特性参数坐标轴描述表", "000060");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                default:
                                    break;
                            }
                        }
                        setAxes(models);
                        InitBarChart(models);
                        break;
                    case 6:
                        if (YuMiMainPage.xType == 1)
                        {
                            switch (com.SelectedIndex)
                            {
                                case 0:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000003");
                                        setTitle("玉米特性参数坐标轴描述表", "000003");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000004");
                                        setTitle("玉米特性参数坐标轴描述表", "000004");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                case 1:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000015");
                                        setTitle("玉米特性参数坐标轴描述表", "000015");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000016");
                                        setTitle("玉米特性参数坐标轴描述表", "000016");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                case 2:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000027");
                                        setTitle("玉米特性参数坐标轴描述表", "000027");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000028");
                                        setTitle("玉米特性参数坐标轴描述表", "000028");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                case 3:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000039");
                                        setTitle("玉米特性参数坐标轴描述表", "000039");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000040");
                                        setTitle("玉米特性参数坐标轴描述表", "000040");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                case 4:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000051");
                                        setTitle("玉米特性参数坐标轴描述表", "000051");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000052");
                                        setTitle("玉米特性参数坐标轴描述表", "000052");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                default:
                                    break;
                            }
                        }
                        else if (YuMiMainPage.xType == 2)
                        {
                            switch (com.SelectedIndex)
                            {
                                case 0:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000007");
                                        setTitle("玉米特性参数坐标轴描述表", "000007");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000008");
                                        setTitle("玉米特性参数坐标轴描述表", "000008");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                case 1:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000019");
                                        setTitle("玉米特性参数坐标轴描述表", "000019");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000020");
                                        setTitle("玉米特性参数坐标轴描述表", "000020");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                case 2:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000031");
                                        setTitle("玉米特性参数坐标轴描述表", "000031");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000032");
                                        setTitle("玉米特性参数坐标轴描述表", "000032");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                case 3:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000043");
                                        setTitle("玉米特性参数坐标轴描述表", "000043");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000044");
                                        setTitle("玉米特性参数坐标轴描述表", "000044");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                case 4:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000055");
                                        setTitle("玉米特性参数坐标轴描述表", "000055");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000056");
                                        setTitle("玉米特性参数坐标轴描述表", "000056");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                default:
                                    break;
                            }
                        }
                        else if (YuMiMainPage.xType == 3)
                        {
                            switch (com.SelectedIndex)
                            {
                                case 0:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000011");
                                        setTitle("玉米特性参数坐标轴描述表", "000011");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000012");
                                        setTitle("玉米特性参数坐标轴描述表", "000012");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                case 1:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000023");
                                        setTitle("玉米特性参数坐标轴描述表", "000023");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000024");
                                        setTitle("玉米特性参数坐标轴描述表", "000024");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                case 2:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000035");
                                        setTitle("玉米特性参数坐标轴描述表", "000035");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000036");
                                        setTitle("玉米特性参数坐标轴描述表", "000036");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                case 3:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000047");
                                        setTitle("玉米特性参数坐标轴描述表", "000047");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000048");
                                        setTitle("玉米特性参数坐标轴描述表", "000048");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                case 4:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000059");
                                        setTitle("玉米特性参数坐标轴描述表", "000059");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000060");
                                        setTitle("玉米特性参数坐标轴描述表", "000060");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                default:
                                    break;
                            }
                        }
                        setAxes(models);
                        InitLine(models);
                        break;
                    case 7:
                        if (YuMiMainPage.xType == 1)
                        {
                            switch (com.SelectedIndex)
                            {
                                case 0:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000003");
                                        setTitle("玉米特性参数坐标轴描述表", "000003");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000004");
                                        setTitle("玉米特性参数坐标轴描述表", "000004");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                case 1:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000015");
                                        setTitle("玉米特性参数坐标轴描述表", "000015");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000016");
                                        setTitle("玉米特性参数坐标轴描述表", "000016");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                case 2:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000027");
                                        setTitle("玉米特性参数坐标轴描述表", "000027");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000028");
                                        setTitle("玉米特性参数坐标轴描述表", "000028");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                case 3:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000039");
                                        setTitle("玉米特性参数坐标轴描述表", "000039");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000040");
                                        setTitle("玉米特性参数坐标轴描述表", "000040");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                case 4:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000051");
                                        setTitle("玉米特性参数坐标轴描述表", "000051");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000052");
                                        setTitle("玉米特性参数坐标轴描述表", "000052");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                default:
                                    break;
                            }
                        }
                        else if (YuMiMainPage.xType == 2)
                        {
                            switch (com.SelectedIndex)
                            {
                                case 0:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000007");
                                        setTitle("玉米特性参数坐标轴描述表", "000007");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000008");
                                        setTitle("玉米特性参数坐标轴描述表", "000008");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                case 1:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000019");
                                        setTitle("玉米特性参数坐标轴描述表", "000019");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000020");
                                        setTitle("玉米特性参数坐标轴描述表", "000020");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                case 2:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000031");
                                        setTitle("玉米特性参数坐标轴描述表", "000031");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000032");
                                        setTitle("玉米特性参数坐标轴描述表", "000032");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                case 3:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000043");
                                        setTitle("玉米特性参数坐标轴描述表", "000043");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000044");
                                        setTitle("玉米特性参数坐标轴描述表", "000044");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                case 4:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000055");
                                        setTitle("玉米特性参数坐标轴描述表", "000055");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000056");
                                        setTitle("玉米特性参数坐标轴描述表", "000056");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                default:
                                    break;
                            }
                        }
                        else if (YuMiMainPage.xType == 3)
                        {
                            switch (com.SelectedIndex)
                            {
                                case 0:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000011");
                                        setTitle("玉米特性参数坐标轴描述表", "000011");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000012");
                                        setTitle("玉米特性参数坐标轴描述表", "000012");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                case 1:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000023");
                                        setTitle("玉米特性参数坐标轴描述表", "000023");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000024");
                                        setTitle("玉米特性参数坐标轴描述表", "000024");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                case 2:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000035");
                                        setTitle("玉米特性参数坐标轴描述表", "000035");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000036");
                                        setTitle("玉米特性参数坐标轴描述表", "000036");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                case 3:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000047");
                                        setTitle("玉米特性参数坐标轴描述表", "000047");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000048");
                                        setTitle("玉米特性参数坐标轴描述表", "000048");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                case 4:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000059");
                                        setTitle("玉米特性参数坐标轴描述表", "000059");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000060");
                                        setTitle("玉米特性参数坐标轴描述表", "000060");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                default:
                                    break;
                            }
                        }
                        InitDongTai(models);
                        //InitBubble(models);
                        break;
                    case 8:
                        if (YuMiMainPage.xType == 1)
                        {
                            switch (com.SelectedIndex)
                            {
                                case 0:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000003");
                                        setTitle("玉米特性参数坐标轴描述表", "000003");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000004");
                                        setTitle("玉米特性参数坐标轴描述表", "000004");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                case 1:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000015");
                                        setTitle("玉米特性参数坐标轴描述表", "000015");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000016");
                                        setTitle("玉米特性参数坐标轴描述表", "000016");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                case 2:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000027");
                                        setTitle("玉米特性参数坐标轴描述表", "000027");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000028");
                                        setTitle("玉米特性参数坐标轴描述表", "000028");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                case 3:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000039");
                                        setTitle("玉米特性参数坐标轴描述表", "000039");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000040");
                                        setTitle("玉米特性参数坐标轴描述表", "000040");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                case 4:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000051");
                                        setTitle("玉米特性参数坐标轴描述表", "000051");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000052");
                                        setTitle("玉米特性参数坐标轴描述表", "000052");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                default:
                                    break;
                            }
                        }
                        else if (YuMiMainPage.xType == 2)
                        {
                            switch (com.SelectedIndex)
                            {
                                case 0:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000007");
                                        setTitle("玉米特性参数坐标轴描述表", "000007");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000008");
                                        setTitle("玉米特性参数坐标轴描述表", "000008");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                case 1:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000019");
                                        setTitle("玉米特性参数坐标轴描述表", "000019");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000020");
                                        setTitle("玉米特性参数坐标轴描述表", "000020");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                case 2:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000031");
                                        setTitle("玉米特性参数坐标轴描述表", "000031");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000032");
                                        setTitle("玉米特性参数坐标轴描述表", "000032");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                case 3:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000043");
                                        setTitle("玉米特性参数坐标轴描述表", "000043");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000044");
                                        setTitle("玉米特性参数坐标轴描述表", "000044");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                case 4:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000055");
                                        setTitle("玉米特性参数坐标轴描述表", "000055");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000056");
                                        setTitle("玉米特性参数坐标轴描述表", "000056");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                default:
                                    break;
                            }
                        }
                        else if (YuMiMainPage.xType == 3)
                        {
                            switch (com.SelectedIndex)
                            {
                                case 0:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000011");
                                        setTitle("玉米特性参数坐标轴描述表", "000011");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000012");
                                        setTitle("玉米特性参数坐标轴描述表", "000012");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                case 1:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000023");
                                        setTitle("玉米特性参数坐标轴描述表", "000023");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000024");
                                        setTitle("玉米特性参数坐标轴描述表", "000024");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                case 2:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000035");
                                        setTitle("玉米特性参数坐标轴描述表", "000035");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000036");
                                        setTitle("玉米特性参数坐标轴描述表", "000036");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                case 3:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000047");
                                        setTitle("玉米特性参数坐标轴描述表", "000047");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000048");
                                        setTitle("玉米特性参数坐标轴描述表", "000048");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                case 4:
                                    if (check1.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000059");
                                        setTitle("玉米特性参数坐标轴描述表", "000059");
                                        break;
                                    }
                                    else if (check2.IsChecked == true)
                                    {
                                        models = dataSource.getYuMiTeXingData("000060");
                                        setTitle("玉米特性参数坐标轴描述表", "000060");
                                        break;
                                    }
                                    else
                                    {
                                        MessageBox.Show("条件选择不全");
                                        break;
                                    }
                                default:
                                    break;
                            }
                        }
                        setBubbleAxes(models);
                        InitBubble(models);
                        break;
                    default:
                        MessageBox.Show("没有数据显示");
                        break;
                }
            }
        }

        private void Check_Click(object sender, RoutedEventArgs e)
        {
            RadioButton radio = sender as RadioButton;
            check1.IsChecked = false;
            check2.IsChecked = false;
            radio.IsChecked = true;
            Panduan();
        }

        ConvertStringToRichTextBox convertToBox = new ConvertStringToRichTextBox();
        private void setTitle(string tableName, string shiYanHao)
        {
            title = dataSource.getTitle(tableName, shiYanHao);
            
            if (YuMiTeXingaCanShuPage.type == 2)
            {
                ChartDisplay.title.Content = title.TitleSpeed;
                ChartDisplay.yText.Text = title.YLabelSpeed;
                ChartDisplay.jieShi.Document = convertToBox.convertStringToFlowDocument(title.chartSpeedMiaoShu);
            }
            else
            {
                ChartDisplay.title.Content = title.Title;
                ChartDisplay.yText.Text = title.YLabel;
                ChartDisplay.jieShi.Document = convertToBox.convertStringToFlowDocument(title.chartMiaoShu);
            }
            ChartDisplay.xText.Content = title.XLabel;
        }
        private  void InitPage(InitData data)
        {
            this.comLabel.Content = data.comLabelText;
            this.com.ItemsSource = data.comTexts;
            this.check1.Content = data.radioCheck1Text;
            this.check2.Content = data.radioCheck2Text;
        }
        private void InitBarChart(List<YuMiTeXingDataModel> models)
        {
            ColumnSeries col = new ColumnSeries();
            col.XAxis = (CategoryAxisBase)dataChart.Axes[0];
            col.YAxis = (NumericYAxis)dataChart.Axes[1];    
            col.ItemsSource = models;
            col.Visibility = Visibility.Visible;
            col.ValueMemberPath = "yData";
            if (YuMiTeXingaCanShuPage.type == 1)
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
          
            dataChart.Series.Add(col);
        }

        private void InitAddToSpeedSpline(List<YuMiTeXingDataModel> models)
        {
            SplineSeries spline = new SplineSeries();
            spline.XAxis = (CategoryAxisBase)dataChart.Axes[0];  
            
            spline.YAxis = (NumericYAxis)dataChart.Axes[1];
          
            spline.ItemsSource = models;
            spline.Visibility = Visibility.Visible;
            spline.ValueMemberPath = "addToSpeed";
            spline.MarkerType = MarkerType.None;

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
          
            dataChart.Series.Add(spline);

        }
        private void InitSpline(List<YuMiTeXingDataModel> models)
        {
            SplineSeries spline = new SplineSeries();
            spline.XAxis = (CategoryAxisBase)dataChart.Axes[0];

            spline.YAxis = (NumericYAxis)dataChart.Axes[1];

            spline.ItemsSource = models;
            spline.Visibility = Visibility.Visible;
            spline.ValueMemberPath = "yData";
            spline.MarkerType = MarkerType.None;
            if (YuMiTeXingaCanShuPage.type == 3)
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
          
            dataChart.Series.Add(spline);
        }
        private void InitLine(List<YuMiTeXingDataModel> models)
        {
            LineSeries line = new LineSeries();
            line.XAxis = (CategoryAxisBase)dataChart.Axes[0];

            line.YAxis = (NumericYAxis)dataChart.Axes[1];

            line.ItemsSource = models;
            line.Visibility = Visibility.Visible;
            line.ValueMemberPath = "yData";
            line.MarkerType = MarkerType.None;
            line.ToolTip = InitToolTip(models, line);
          
            dataChart.Series.Add(line);
        }
        private void InitBubble(List<YuMiTeXingDataModel> models)
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
          
            dataChart.Series.Add(bubble);
        }

        public static List<Model> DongTaiModels;
        private void InitDongTai(List<YuMiTeXingDataModel> models)
        {
            DongTaiModels = dataSource.convert(models);
            Frame frame = new Frame();
            frame.Source = new Uri("pack://application:,,,/DongTaiTu;component/YuMiZhiLiangCanShu.xaml");
            if(ChartDisplay.mainGrid.Children.Count>0)
            {
                ChartDisplay.mainGrid.Children.Clear();
            }
            ChartDisplay.mainGrid.Children.Add(frame);
        }
        private Grid InitToolTip(List<YuMiTeXingDataModel> model, Series col)
        {
            Grid grid = new Grid();
            StackPanel verStack = new StackPanel();
            verStack.Orientation = Orientation.Vertical;
            StackPanel horStack = new StackPanel();
            horStack.Orientation = Orientation.Horizontal;
            StackPanel stackBlock = new StackPanel();
            TextBlock xBlock = new TextBlock();
            xBlock.SetBinding(TextBlock.TextProperty, new Binding() { Path = new PropertyPath("Item.xLabel")});
            TextBlock yBlock = new TextBlock();
            yBlock.SetBinding(TextBlock.TextProperty, new Binding() { Path = new PropertyPath("Item.canShuName") });
            stackBlock.Children.Add(xBlock);
            stackBlock.Children.Add(yBlock);
            StackPanel stackText = new StackPanel();
            TextBlock xText = new TextBlock();

            xText.SetBinding(TextBlock.TextProperty, new Binding() { Path = new PropertyPath("Item.xData")});
            TextBlock yText = new TextBlock();
            yText.SetBinding(TextBlock.TextProperty,new Binding(){Path = new PropertyPath("Item.yData")});
            stackText.Children.Add(xText);
            stackText.Children.Add(yText);

            horStack.Children.Add(stackBlock);
            horStack.Children.Add(stackText);
            verStack.Children.Add(horStack);
            grid.Children.Add(verStack);
            return grid;
        }
        private Grid InitSpeedToolTip(List<YuMiTeXingDataModel> models, Series col)
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
            TextBlock yText = new TextBlock();
            yText.SetBinding(TextBlock.TextProperty, new Binding() { Path = new PropertyPath("Item.addToSpeed") });
           // TextBlock Text = new TextBlock();
           // Text.SetBinding(TextBlock.TextProperty, new Binding() { Path = new PropertyPath("Item.addToSpeed") });
            stackText.Children.Add(xText);
            stackText.Children.Add(yText);
           // stackText.Children.Add(Text);

            horStack.Children.Add(stackBlock);
            horStack.Children.Add(stackText);
            verStack.Children.Add(horStack);
            grid.Children.Add(verStack);
            return grid;
        }

        private void InitLineBar(List<YuMiTeXingDataModel> models, string str)
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
            line.SetBinding(Series.ToolTipProperty, new Binding(){ Path = new PropertyPath("Item."+str)});

            Grid grid = new Grid();
            StackPanel verStack = new StackPanel();
            verStack.Orientation = Orientation.Vertical;
            StackPanel horStack = new StackPanel();
            horStack.Orientation = Orientation.Horizontal;
            StackPanel stackBlock = new StackPanel();
 
            TextBlock Block = new TextBlock();
            Block.Text = str+":";
            stackBlock.Children.Add(Block);
            StackPanel stackText = new StackPanel();  
            TextBlock Text = new TextBlock();
            Text.SetBinding(TextBlock.TextProperty, new Binding() { Path = new PropertyPath("Item."+str) });
            stackText.Children.Add(Text);

            horStack.Children.Add(stackBlock);
            horStack.Children.Add(stackText);
            verStack.Children.Add(horStack);
            grid.Children.Add(verStack);
            line.ToolTip = grid;  
            dataChart.Series.Add(line);
        }

    
        private void setAxes(List<YuMiTeXingDataModel> models)
        {         
            xAxis = new XAxis();
            yAxis = new YAxis();
            if (dataChart.Axes.Count > 0)
            {
                dataChart.Axes.Clear();
            }
            dataChart.Axes.Add(xAxis.initCategoryXAxis(dataSource.convert(models),1));
            dataChart.Axes.Add(yAxis.initNumericYAxis(models[0].low - (models[0].high - models[0].low) / 10, models[0].high + (models[0].high - models[0].low) / 10, (models[0].high - models[0].low) / 10));

            dataChart.Visibility = System.Windows.Visibility.Visible;
            dataChart.VerticalZoomable = true;
            dataChart.HorizontalZoomable = true;
            dataChart.VerticalZoombarVisibility = System.Windows.Visibility.Visible;
            dataChart.HorizontalZoombarVisibility = System.Windows.Visibility.Visible;

        }

        private void setBubbleAxes(List<YuMiTeXingDataModel> models)
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
                foreach (YuMiTeXingDataModel str in models)
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

            dataChart.Axes.Add(xAxis.initNumericXAxis(min-1,max+1,(max - min +2)/10));
            dataChart.Axes.Add(yAxis.initNumericYAxis(models[0].low - (models[0].high - models[0].low) / 10, models[0].high + (models[0].high - models[0].low) / 10, (models[0].high - models[0].low ) / 10));

            dataChart.Visibility = System.Windows.Visibility.Visible;
            dataChart.VerticalZoomable = true;
            dataChart.HorizontalZoomable = true;
            dataChart.VerticalZoombarVisibility = System.Windows.Visibility.Visible;
            dataChart.HorizontalZoombarVisibility = System.Windows.Visibility.Visible;
        }
        private void setAddToSpeedAxes(List<YuMiTeXingDataModel> models)
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
            if (YuMiTeXingaCanShuPage.type == 1)
            {
                Frame frame = new Frame();
                frame.Source = new Uri("pack://application:,,,/BiaoShiPage;component/ZuiZhiBiaoShiPage.xaml");

                if (ChartDisplay.biaoShiGrid.Children.Count > 0)
                {
                    ChartDisplay.biaoShiGrid.Children.Clear();
                }
                ChartDisplay.biaoShiGrid.Children.Add(frame);
            }
        }
        public class InitData
        {
            public string comLabelText;
            public List<string> comTexts;
            public string radioCheck1Text;
            public string radioCheck2Text;
        }

    
    }
}
