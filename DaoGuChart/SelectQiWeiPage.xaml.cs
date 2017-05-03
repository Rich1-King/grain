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
    /// SelectQiWeiPage.xaml 的交互逻辑
    /// </summary>
    public partial class SelectQiWeiPage : Page
    {
        public SelectQiWeiPage()
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
        private List<DaoGuZhiLiangTeXingModel> models;
        private List<DaoGuZhiLiangTeXingModel> predictModels;
        private TitleModel title;

        private void Grid_Load(object sender, RoutedEventArgs e)
        {
            biaoShi_Loaded();
            data = new InitData();
            data.comLabelText = "气味类型:";
            List<string> comStr = new List<string>();
            comStr.Add("气味烷烃类");
            comStr.Add("气味醛酮类");
            comStr.Add("气味醇类");
            comStr.Add("气味酸酯类");
            comStr.Add("气味杂环类");
            data.comTexts = comStr;
            data.radioCheck1Text = "温度15℃";
            data.radioCheck2Text = "30℃";
            InitPage(data);


            if (dataChart.Series.Count > 0)
            {
                dataChart.Series.Clear();
            }

            setTitle("稻谷质量特性参数坐标轴描述表", "000113");
            models = dataSource.getDaoGuZhiLiangTeXingData("000113");

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
                    break;
                case 10:
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
            but.IsChecked = true;
            panDuan();
        }
        private void panDuan()
        {
            if (dataChart.Series.Count > 0)
            {
                dataChart.Series.Clear();
            }
            biaoShi_Loaded();

             switch (com.SelectedIndex)
               {
                   case 0:
                       if (check1.IsChecked == true)
                       {
                           setTitle("稻谷质量特性参数坐标轴描述表", "000113");
                           models = dataSource.getDaoGuZhiLiangTeXingData("000113");
                       }
                       else if (check2.IsChecked == true)
                       {
                           setTitle("稻谷质量特性参数坐标轴描述表", "000114");
                           models = dataSource.getDaoGuZhiLiangTeXingData("000114");
                       }
                         break;
                   case 1:
                       if (check1.IsChecked == true)
                       {
                           setTitle("稻谷质量特性参数坐标轴描述表", "000115");
                           models = dataSource.getDaoGuZhiLiangTeXingData("000115");
                       }
                       else if (check2.IsChecked == true)
                       {
                           setTitle("稻谷质量特性参数坐标轴描述表", "000116");
                           models = dataSource.getDaoGuZhiLiangTeXingData("000116");
                       }
                       break;
                   case 2:
                       if (check1.IsChecked == true)
                       {
                           setTitle("稻谷质量特性参数坐标轴描述表", "000117");
                           models = dataSource.getDaoGuZhiLiangTeXingData("000117");
                       }
                       else if (check2.IsChecked == true)
                       {
                           setTitle("稻谷质量特性参数坐标轴描述表", "000118");
                           models = dataSource.getDaoGuZhiLiangTeXingData("000118");
                       }
                        break;
                    case 3:
                       if (check1.IsChecked == true)
                       {
                           setTitle("稻谷质量特性参数坐标轴描述表", "000119");
                           models = dataSource.getDaoGuZhiLiangTeXingData("000119");
                       }
                       else if (check2.IsChecked == true)
                       {
                           setTitle("稻谷质量特性参数坐标轴描述表", "000120");
                           models = dataSource.getDaoGuZhiLiangTeXingData("000120");
                       }
                       break;
                 case 4:
                         if (check1.IsChecked == true)
                       {
                           setTitle("稻谷质量特性参数坐标轴描述表", "000121");
                           models = dataSource.getDaoGuZhiLiangTeXingData("000121");
                       }
                       else if (check2.IsChecked == true)
                       {
                           setTitle("稻谷质量特性参数坐标轴描述表", "000122");
                           models = dataSource.getDaoGuZhiLiangTeXingData("000122");
                       }
                       break;
                    default:
                       break;
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
                     break;
                 case 10:
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
            this.comLabel.Content = data.comLabelText;
            this.com.ItemsSource = data.comTexts;
            this.check1.Content = data.radioCheck1Text;
            this.check2.Content = data.radioCheck2Text;        
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
            TextBlock yText = new TextBlock();
            yText.SetBinding(TextBlock.TextProperty, new Binding() { Path = new PropertyPath("Item.addToSpeed"), Converter = new StringFormatConverter(), ConverterParameter = "0.00" });
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
            if ((models[0].low - (models[0].high - models[0].low) / 10) < 0)
            {
                dataChart.Axes.Add(yAxis.initNumericYAxis(0, models[0].high + models[0].high/10, models[0].high / 10));
            }
            else
            {
                dataChart.Axes.Add(yAxis.initNumericYAxis(models[0].low - (models[0].high  - models[0].low)/ 10, models[0].high + (models[0].high  - models[0].low)/ 10, (models[0].high  - models[0].low)/ 10));
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
            if ((models[0].low - (models[0].high - models[0].low) / 10) < 0)
            {
                dataChart.Axes.Add(yAxis.initNumericYAxis(0, models[0].high + models[0].high / 10, models[0].high / 10));
            }
            else
            {
                dataChart.Axes.Add(yAxis.initNumericYAxis(models[0].low - (models[0].high  - models[0].low)/ 10, models[0].high + (models[0].high  - models[0].low)/ 10, (models[0].high  - models[0].low)/ 10));
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
        }

        private void predictPanDuan()
        {
            if (dataChart.Series.Count > 0)
            {
                dataChart.Series.Clear();
            }
            switch (com.SelectedIndex)
            {
                case 0:
                    if (check1.IsChecked == true)
                    {
                        setTitle("稻谷质量特性参数坐标轴描述表", "000113");
                        models = dataSource.getDaoGuZhiLiangTeXingData("000113");
                    }
                    else if (check2.IsChecked == true)
                    {
                        setTitle("稻谷质量特性参数坐标轴描述表", "000114");
                        models = dataSource.getDaoGuZhiLiangTeXingData("000114");
                    }
                    break;
                case 1:
                    if (check1.IsChecked == true)
                    {
                        setTitle("稻谷质量特性参数坐标轴描述表", "000115");
                        models = dataSource.getDaoGuZhiLiangTeXingData("000115");
                    }
                    else if (check2.IsChecked == true)
                    {
                        setTitle("稻谷质量特性参数坐标轴描述表", "000116");
                        models = dataSource.getDaoGuZhiLiangTeXingData("000116");
                    }
                    break;
                case 2:
                    if (check1.IsChecked == true)
                    {
                        setTitle("稻谷质量特性参数坐标轴描述表", "000117");
                        models = dataSource.getDaoGuZhiLiangTeXingData("000117");
                    }
                    else if (check2.IsChecked == true)
                    {
                        setTitle("稻谷质量特性参数坐标轴描述表", "000118");
                        models = dataSource.getDaoGuZhiLiangTeXingData("000118");
                    }
                    break;
                case 3:
                    if (check1.IsChecked == true)
                    {
                        setTitle("稻谷质量特性参数坐标轴描述表", "000119");
                        models = dataSource.getDaoGuZhiLiangTeXingData("000119");
                    }
                    else if (check2.IsChecked == true)
                    {
                        setTitle("稻谷质量特性参数坐标轴描述表", "000120");
                        models = dataSource.getDaoGuZhiLiangTeXingData("000120");
                    }
                    break;
                case 4:
                    if (check1.IsChecked == true)
                    {
                        setTitle("稻谷质量特性参数坐标轴描述表", "000121");
                        models = dataSource.getDaoGuZhiLiangTeXingData("000121");
                    }
                    else if (check2.IsChecked == true)
                    {
                        setTitle("稻谷质量特性参数坐标轴描述表", "000122");
                        models = dataSource.getDaoGuZhiLiangTeXingData("000122");
                    }
                    break;
                default:
                    break;
            }

            switch (DaoGuTeXingCanShuPage.type)
            {
                case 9:
                    double timeClip = Convert.ToDouble(models[models.Count - 1].xData);
                    predictModels = dataSource.getPredictDataAfterTime(models, Convert.ToInt16(daySelect.SelectedItem), 30);
                    setAxes(predictModels);
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
