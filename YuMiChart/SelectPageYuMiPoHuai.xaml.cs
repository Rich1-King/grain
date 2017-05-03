using ConvertData;
using DataBaseControl;
using DataModel;
using Infragistics.Controls.Charts;
using Infragistics.Samples.Shared.Converters;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
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
using YuMiWindow;

namespace YuMiChart
{
    /// <summary>
    /// SelectPageYuMiPoHuai.xaml 的交互逻辑
    /// </summary>
    public partial class SelectPageYuMiPoHuai : Page
    {
        public SelectPageYuMiPoHuai()
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
        private YuMiPoHuaiTitleModel title;
        private List<YuMiPoHuaiModel> models;
       // private List<YuMiPoHuaiModel> predictModels;

        private void Grid_Load(object sender, RoutedEventArgs e)
        {
            biaoShi_Loaded();
            data = new InitData();
            data.cengShuText = "实验层数：";
            data.cengShuListText.Add("第一层");
            data.cengShuListText.Add("第二层");
            data.cengShuListText.Add("第三层");

            data.jianCeDianText = "实验地点：";
            data.jianCeDianListText.Add("地点一");
            data.jianCeDianListText.Add("地点二");
            data.jianCeDianListText.Add("地点三");
            data.jianCeDianListText.Add("地点四");
            data.jianCeDianListText.Add("地点五");

            data.radioCheck1Text = "温度的变化情况";
            data.radioCheck2Text = "破坏率的变化情况";

            InitPage(data);
            title = dataSource.getYuMiPoHuaiTitle("玉米加热破坏实验坐标轴描述表", "000001");  
            setTitle(title,"tem");

            try
            {
                models = dataSource.getYuMiPoHuaiData("000001");
            }
            catch (Exception)
            {
                MessageBox.Show("获取数据失败!!");
                return;
            }
            if (dataChart.Series.Count > 0)
            {
                dataChart.Series.Clear();
            }
            switch (YuMiPoHuaiPage.type)
            {
                case 1:
                    setAxes(models,"tem");
                    InitBarChart(models,"tem");
                    InitLineBar(models, "temLow");
                    InitLineBar(models, "temHigh");
                    InitLineBar(models, "temMedia");
                    break;
                case 2:
                    setAddToSpeedAxes(models,"tem");
                    InitAddToSpeedSpline(models,"tem");
                    break;
                case 3:
                    setAxes(models,"tem");
                    InitSpline(models,"tem", MarkerType.None);
                    break;
                case 4:
                    setAxes(models,"tem");
                    InitSpline(models,"tem", MarkerType.None);
                    break;
                case 5:
                    setAxes(models,"tem");
                    InitBarChart(models,"tem");
                    break;
                case 6:
                    setAxes(models,"tem");
                    InitLine(models,"tem");
                    break;
                case 7:
                    InitDongTai(models,"tem");
                    break;
                case 8:
                    setBubbleAxes(models,"tem");
                    InitBubble(models,"tem");
                    break;
            }
        }



        private bool flagCengShu = true;
        private bool flagDiDianShu = true;

        private void cengShuCom_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            if (flagCengShu == true)
            {
                flagCengShu = false;
                return;
            }
            PanDuan();
        }

        private void jianCeDianCom_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            if (flagDiDianShu == true)
            {
                flagDiDianShu = false;
                return;
            }
            PanDuan();
        }

        private void Radio_Click(object sender, RoutedEventArgs e)
        {
            RadioButton radio = sender as RadioButton;
            tempCheck.IsChecked = false;
            poHuaiLvCheck.IsChecked = false;
            radio.IsChecked = true;
            PanDuan();
        } 
        private void PanDuan()
        {
            biaoShi_Loaded();
            if (dataChart.Series.Count > 0)
            {
                dataChart.Series.Clear();
            }

                    switch (cengShuCom.SelectedIndex)
                    {
                        case 0:
                            switch (jianCeDianCom.SelectedIndex)
                            {
                                case 0:
                                    title = dataSource.getYuMiPoHuaiTitle("玉米加热破坏实验坐标轴描述表", "000001");            
                                    models = dataSource.getYuMiPoHuaiData("000001");
                                 
                                    break;
                                case 1:
                                        title = dataSource.getYuMiPoHuaiTitle("玉米加热破坏实验坐标轴描述表", "000002");    
                                        models = dataSource.getYuMiPoHuaiData("000002");
                                    break;
                                case 2:
                                        title = dataSource.getYuMiPoHuaiTitle("玉米加热破坏实验坐标轴描述表", "000003");    
                                        models = dataSource.getYuMiPoHuaiData("000003");
                                    break;
                                case 3:
                                    title = dataSource.getYuMiPoHuaiTitle("玉米加热破坏实验坐标轴描述表", "000004");    
                                        models = dataSource.getYuMiPoHuaiData("000004");
                                    break;
                                case 4:
                                    title = dataSource.getYuMiPoHuaiTitle("玉米加热破坏实验坐标轴描述表", "000005");    
                                        models = dataSource.getYuMiPoHuaiData("000005");
                                    break;
                            }
                            break;
                        case 1:
                             switch (jianCeDianCom.SelectedIndex)
                            {
                                case 0:

                                    title = dataSource.getYuMiPoHuaiTitle("玉米加热破坏实验坐标轴描述表", "000006");    
                                        models = dataSource.getYuMiPoHuaiData("000006");
                                 
                                    break;
                                case 1:
                                    title = dataSource.getYuMiPoHuaiTitle("玉米加热破坏实验坐标轴描述表", "000007");    
                                        models = dataSource.getYuMiPoHuaiData("000007");
                                    break;
                                case 2:
                                    title = dataSource.getYuMiPoHuaiTitle("玉米加热破坏实验坐标轴描述表", "000008");    
                                        models = dataSource.getYuMiPoHuaiData("000008");
                                    break;
                                case 3:
                                    title = dataSource.getYuMiPoHuaiTitle("玉米加热破坏实验坐标轴描述表", "000009");    
                                        models = dataSource.getYuMiPoHuaiData("000009");
                                    break;
                                case 4:
                                    title = dataSource.getYuMiPoHuaiTitle("玉米加热破坏实验坐标轴描述表", "000010");    
                                        models = dataSource.getYuMiPoHuaiData("000010");
                                    break;
                            }
                            break;
                        case 2:
                            switch (jianCeDianCom.SelectedIndex)
                            {
                                case 0:

                                    title = dataSource.getYuMiPoHuaiTitle("玉米加热破坏实验坐标轴描述表", "000011");    
                                    models = dataSource.getYuMiPoHuaiData("000011");

                                    break;
                                case 1:
                                    title = dataSource.getYuMiPoHuaiTitle("玉米加热破坏实验坐标轴描述表", "000012");    
                                    models = dataSource.getYuMiPoHuaiData("000012");
                                    break;
                                case 2:
                                    title = dataSource.getYuMiPoHuaiTitle("玉米加热破坏实验坐标轴描述表", "000013");    
                                    models = dataSource.getYuMiPoHuaiData("000013");
                                    break;
                                case 3:
                                    title = dataSource.getYuMiPoHuaiTitle("玉米加热破坏实验坐标轴描述表", "000014");    
                                    models = dataSource.getYuMiPoHuaiData("000014");
                                    break;
                                case 4:
                                    title = dataSource.getYuMiPoHuaiTitle("玉米加热破坏实验坐标轴描述表", "000015");    
                                    models = dataSource.getYuMiPoHuaiData("000015");
                                    break;
                            }
                            break;
                        default:
                            MessageBox.Show("没有数据");
                            return;
                    }

            
                    switch (YuMiPoHuaiPage.type)
                    { 
                        case 1:

                            if (tempCheck.IsChecked == true)
                            {
                                setAxes(models, "tem");
                                InitBarChart(models, "tem");
                                InitLineBar(models, "temLow");
                                InitLineBar(models, "temHigh");
                                InitLineBar(models, "temMedia");
                                setTitle(title, "tem");
                            }
                            else if (poHuaiLvCheck.IsChecked == true)
                            {
                                setAxes(models, "poHuaiLv");
                                InitBarChart(models, "poHuaiLv");
                                InitLineBar(models, "poHuaiLvLow");
                                InitLineBar(models, "poHuaiLvHigh");
                                InitLineBar(models, "poHuaiLvMedia");
                                setTitle(title, "poHuaiLv");
                            }

                            break;
                        case 2:
                            if (tempCheck.IsChecked == true)
                            {
                                setAddToSpeedAxes(models, "tem");
                                InitAddToSpeedSpline(models, "tem");
                                setTitle(title, "tem");
                            }
                            else if (poHuaiLvCheck.IsChecked == true)
                            {
                                setAddToSpeedAxes(models, "poHuaiLv");
                                InitAddToSpeedSpline(models, "poHuaiLv");
                                setTitle(title, "poHuaiLv");
                            }
                            break;
                        case 3:
                            if (tempCheck.IsChecked == true)
                            {
                                setAxes(models, "tem");
                                InitSpline(models, "tem", MarkerType.None);
                                setTitle(title, "tem");
                            }
                            else if (poHuaiLvCheck.IsChecked == true)
                            {
                                setAxes(models, "poHuaiLv");
                                InitSpline(models, "poHuaiLv", MarkerType.None);
                                setTitle(title, "poHuaiLv");
                            }
                            break;
                        case 4:
                            if (tempCheck.IsChecked == true)
                            {
                                setAxes(models, "tem");
                                InitSpline(models, "tem", MarkerType.None);
                                setTitle(title, "tem");
                            }
                            else if (poHuaiLvCheck.IsChecked == true)
                            {
                                setAxes(models, "poHuaiLv");
                                InitSpline(models, "poHuaiLv", MarkerType.None);
                                setTitle(title, "poHuaiLv");
                            }
                            break;
                        case 5:
                            if (tempCheck.IsChecked == true)
                            {
                                setAxes(models, "tem");
                                InitBarChart(models, "tem");
                                setTitle(title, "tem");
                            }
                            else if (poHuaiLvCheck.IsChecked == true)
                            {
                                setAxes(models, "poHuaiLv");
                                InitBarChart(models, "poHuaiLv");
                                setTitle(title, "poHuaiLv");
                            }
                            break;
                        case 6:
                            if (tempCheck.IsChecked == true)
                            {
                                setAxes(models, "tem");
                                InitLine(models, "tem");
                                setTitle(title, "tem");
                            }
                            else if (poHuaiLvCheck.IsChecked == true)
                            {
                                setAxes(models, "poHuaiLv");
                                InitLine(models, "poHuaiLv");
                                setTitle(title, "poHuaiLv");
                            }
                            break;
                        case 7:
                            if (tempCheck.IsChecked == true)
                            {
                                InitDongTai(models,"tem");
                                setTitle(title, "tem");
                            }
                            else if (poHuaiLvCheck.IsChecked == true)
                            {
                                InitDongTai(models,"poHuaiLv");
                                setTitle(title, "poHuaiLv");
                            }
                            break;
                        case 8:
                            if (tempCheck.IsChecked == true)
                            {
                                setBubbleAxes(models, "tem");
                                InitBubble(models,"tem");
                                setTitle(title, "tem");
                            }
                            else if (poHuaiLvCheck.IsChecked == true)
                            {
                                setBubbleAxes(models, "poHuaiLv");
                                InitBubble(models,"poHuaiLv");
                                setTitle(title, "poHuaiLv");
                            }
                            break;
                        default:
                            break;


                    }

            
        }
        ConvertStringToRichTextBox convertToBox = new ConvertStringToRichTextBox();
        private void setTitle(YuMiPoHuaiTitleModel title,String str)
        {

            String yLabel,xLabel,titleName,titleSpeedName,ySpeedLabel,miaoShu,miaoShuSpeed;
            Type type = typeof(YuMiPoHuaiTitleModel);
            PropertyInfo piY = type.GetProperty(str+"Label");
            yLabel = Convert.ToString(piY.GetValue(title, null));

            PropertyInfo piYSpeed = type.GetProperty(str + "LabelSpeed");
            ySpeedLabel = Convert.ToString(piYSpeed.GetValue(title, null));

            PropertyInfo piX = type.GetProperty("XLabel");
            xLabel = Convert.ToString(piX.GetValue(title, null));

            PropertyInfo piTitle = type.GetProperty(str+"Title");
            titleName = Convert.ToString(piTitle.GetValue(title, null));

            PropertyInfo piSpeedTitle = type.GetProperty(str+"TitleSpeed");
            titleSpeedName = Convert.ToString(piSpeedTitle.GetValue(title, null));

            PropertyInfo piMiaoShu = type.GetProperty(str+"ChartMiaoShu");
            miaoShu = Convert.ToString(piMiaoShu.GetValue(title, null));

            PropertyInfo piSpeedMiaoShu = type.GetProperty(str + "ChartSpeedMiaoShu");
            miaoShuSpeed = Convert.ToString(piSpeedMiaoShu.GetValue(title, null));

            if (YuMiPoHuaiPage.type == 2)
            {
                ChartDisplay.title.Content = titleSpeedName;
                ChartDisplay.yText.Text = ySpeedLabel;
                ChartDisplay.jieShi.Document = convertToBox.convertStringToFlowDocument(miaoShuSpeed);
            }
            else
            {
                ChartDisplay.title.Content = titleName;
                ChartDisplay.yText.Text = yLabel;
                ChartDisplay.jieShi.Document = convertToBox.convertStringToFlowDocument(miaoShu);
            }
            ChartDisplay.xText.Content = xLabel;
        }
        private void InitPage(InitData data)
        {
            this.cengShuLab.Content = data.cengShuText;
            this.cengShuCom.ItemsSource = data.cengShuListText;

            this.jianCeDianLab.Content = data.jianCeDianText;
            this.jianCeDianCom.ItemsSource = data.jianCeDianListText;

            this.tempCheck.Content = data.radioCheck1Text;
            this.poHuaiLvCheck.Content = data.radioCheck2Text;
            
        }
        private void InitBarChart(List<YuMiPoHuaiModel> models, String str)
        {
            ColumnSeries col = new ColumnSeries();
            col.XAxis = (CategoryAxisBase)dataChart.Axes[0];
            col.YAxis = (NumericYAxis)dataChart.Axes[1];
            col.ItemsSource = models;
            col.Visibility = Visibility.Visible;
            col.ValueMemberPath = str;
            if (YuMiPoHuaiPage.type == 1)
            {
                DataTemplate template = new DataTemplate();
                FrameworkElementFactory fef = new FrameworkElementFactory(typeof(TextBlock));
                fef.SetBinding(TextBlock.TextProperty, new Binding() { Path = new PropertyPath("Item."+str) });
                fef.SetValue(Label.MarginProperty, new Thickness(0, 0, 0, 15));
                fef.SetValue(Label.ForegroundProperty, new SolidColorBrush(Colors.Green));
                fef.SetValue(Label.FontSizeProperty, Convert.ToDouble(14));
                fef.SetValue(Label.FontWeightProperty, FontWeight.FromOpenTypeWeight(700));
                template.VisualTree = fef;
                col.MarkerTemplate = template;
            }
            col.ToolTip = InitToolTip(models, col,str);
            //if (dataChart.Series.Count > 0)
            //{
            //    dataChart.Series.Clear();
            //}
            dataChart.Series.Add(col);
        }

        private void InitAddToSpeedSpline(List<YuMiPoHuaiModel> models,String str)
        {
            SplineSeries spline = new SplineSeries();
            spline.XAxis = (CategoryAxisBase)dataChart.Axes[0];

            spline.YAxis = (NumericYAxis)dataChart.Axes[1];

            spline.ItemsSource = models;
            spline.Visibility = Visibility.Visible;
            spline.ValueMemberPath = str + "AddToSpeed";

            spline.MarkerType = MarkerType.None;
            spline.Thickness = 3;

            DataTemplate template = new DataTemplate();
            FrameworkElementFactory fef = new FrameworkElementFactory(typeof(Label));
            fef.SetBinding(Label.ContentProperty, new Binding() { Path = new PropertyPath("Item."+str+"AddToSpeed"), Converter = new StringFormatConverter(), ConverterParameter = "0.00" });
            //fef.SetValue(Label.MarginProperty, new Thickness(0, 0, 0, 15));
            fef.SetValue(Label.ForegroundProperty, new SolidColorBrush(Colors.Green));
            fef.SetValue(Label.FontSizeProperty, Convert.ToDouble(14));
            fef.SetValue(Label.FontWeightProperty, FontWeight.FromOpenTypeWeight(700));
            template.VisualTree = fef;
            spline.MarkerTemplate = template;

            spline.ToolTip = InitSpeedToolTip(models, spline,str);
            //if (dataChart.Series.Count > 0)
            //{
            //    dataChart.Series.Clear();
            //}
            dataChart.Series.Add(spline);

        }
        private void InitSpline(List<YuMiPoHuaiModel> models,String str, MarkerType type)
        {
            SplineSeries spline = new SplineSeries();
            spline.XAxis = (CategoryAxisBase)dataChart.Axes[0];

            spline.YAxis = (NumericYAxis)dataChart.Axes[1];

            spline.ItemsSource = models;
            spline.Visibility = Visibility.Visible;
            spline.ValueMemberPath = str;
            spline.Thickness = 3;
            spline.MarkerType = type;

            if (YuMiPoHuaiPage.type == 3)
            {
                DataTemplate template = new DataTemplate();
                FrameworkElementFactory fef = new FrameworkElementFactory(typeof(Label));
                fef.SetBinding(Label.ContentProperty, new Binding() { Path = new PropertyPath("Item."+str), Converter = new StringFormatConverter(), ConverterParameter = "0.00" });
                //fef.SetValue(Label.MarginProperty, new Thickness(0, 0, 0, 15));
                fef.SetValue(Label.ForegroundProperty, new SolidColorBrush(Colors.Green));
                fef.SetValue(Label.FontSizeProperty, Convert.ToDouble(14));
                fef.SetValue(Label.FontWeightProperty, FontWeight.FromOpenTypeWeight(700));
                template.VisualTree = fef;
                spline.MarkerTemplate = template;
            }

            spline.ToolTip = InitToolTip(models, spline,str);
            //if (dataChart.Series.Count > 0)
            //{
            //    dataChart.Series.Clear();
            //}
            dataChart.Series.Add(spline);
        }
        private void InitLine(List<YuMiPoHuaiModel> models,String str)
        {
            LineSeries line = new LineSeries();
            line.XAxis = (CategoryAxisBase)dataChart.Axes[0];

            line.YAxis = (NumericYAxis)dataChart.Axes[1];

            line.ItemsSource = models;
            line.Visibility = Visibility.Visible;
            line.ValueMemberPath = str;
            line.Thickness = 3;
            line.MarkerType = MarkerType.None;
            line.ToolTip = InitToolTip(models, line,str);
            //if (dataChart.Series.Count > 0)
            //{
            //    dataChart.Series.Clear();
            //}
            dataChart.Series.Add(line);
        }
        private void InitBubble(List<YuMiPoHuaiModel> models,String str)
        {
            BubbleSeries bubble = new BubbleSeries();
            bubble.XAxis = (NumericXAxis)dataChart.Axes[0];

            bubble.YAxis = (NumericYAxis)dataChart.Axes[1];

            bubble.ItemsSource = models;
            bubble.Visibility = Visibility.Visible;
            bubble.XMemberPath = "xData";
            bubble.YMemberPath = str;
            bubble.RadiusMemberPath = "rData";
            bubble.ToolTip = InitToolTip(models, bubble,str);
            //if (dataChart.Series.Count > 0)
            //{
            //    dataChart.Series.Clear();
            //}
            dataChart.Series.Add(bubble);
        }

        public static List<Model> DongTaiModels;
        private void InitDongTai(List<YuMiPoHuaiModel> models,string str)
        {
            if (str == "tem")
            {
                for (int i = 0;i<models.Count;i++)
                {
                    models[i].yData = models[i].tem;  
                }
            }
            else
            {
                for (int i = 0; i < models.Count; i++)
                {
                    models[i].yData = models[i].poHuaiLv;
                }
            }
            DongTaiModels = dataSource.convert(models);
            Frame frame = new Frame();
            frame.Source = new Uri("pack://application:,,,/DongTaiTu;component/YuMiJiaRePoHuai.xaml");
            if (ChartDisplay.mainGrid.Children.Count > 0)
            {
                ChartDisplay.mainGrid.Children.Clear();
            }
            ChartDisplay.mainGrid.Children.Add(frame);
        }
        private Grid InitToolTip(List<YuMiPoHuaiModel> model, Series col,string str)
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
            yBlock.SetBinding(TextBlock.TextProperty, new Binding() { Path = new PropertyPath("Item."+str+"Label") });
            stackBlock.Children.Add(xBlock);
            stackBlock.Children.Add(yBlock);
            StackPanel stackText = new StackPanel();
            TextBlock xText = new TextBlock();

            xText.SetBinding(TextBlock.TextProperty, new Binding() { Path = new PropertyPath("Item.xData") });
            TextBlock yText = new TextBlock();
            yText.SetBinding(TextBlock.TextProperty, new Binding() { Path = new PropertyPath("Item."+str) });
            stackText.Children.Add(xText);
            stackText.Children.Add(yText);

            horStack.Children.Add(stackBlock);
            horStack.Children.Add(stackText);
            verStack.Children.Add(horStack);
            grid.Children.Add(verStack);
            return grid;
        }
        private Grid InitSpeedToolTip(List<YuMiPoHuaiModel> models, Series col,string str)
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
            Text.SetBinding(TextBlock.TextProperty, new Binding() { Path = new PropertyPath("Item."+str+"AddToSpeed") });
            stackText.Children.Add(xText);
            //stackText.Children.Add(yText);
            stackText.Children.Add(Text);

            horStack.Children.Add(stackBlock);
            horStack.Children.Add(stackText);
            verStack.Children.Add(horStack);
            grid.Children.Add(verStack);
            return grid;
        }

        private void InitLineBar(List<YuMiPoHuaiModel> models, string str)
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
            if (str.IndexOf("High") > 0)
            {
                line.Brush = new SolidColorBrush(Colors.Red);
            }
            else if (str.IndexOf("Media") > 0)
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
        private void setAxes(List<YuMiPoHuaiModel> models,String str)
        {
            double yHigh,yLow;

            Type type = typeof(YuMiPoHuaiModel);
            PropertyInfo piLow = type.GetProperty(str+"Low");
            PropertyInfo piHigh = type.GetProperty(str+"High");

            yHigh = Convert.ToDouble(piHigh.GetValue(models[0],null));
            yLow = Convert.ToDouble(piLow.GetValue(models[0], null));

            xAxis = new XAxis();
            yAxis = new YAxis();
            if (dataChart.Axes.Count > 0)
            {
                dataChart.Axes.Clear();
            }
         
            dataChart.Axes.Add(xAxis.initCategoryXAxis(dataSource.convert(models), 1));
          
            dataChart.Axes.Add(yAxis.initNumericYAxis(yLow - (yHigh - yLow) / 10, yHigh + (yHigh - yLow) / 10, (yHigh - yLow) / 10));
            dataChart.Axes.Add(xAxis.initNumericXAxis(Convert.ToDouble(models[0].xData), Convert.ToDouble(models[models.Count - 1].xData), 32));
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

        private void setBubbleAxes(List<YuMiPoHuaiModel> models,String str)
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
                foreach (YuMiPoHuaiModel model in models)
                {
                    try
                    {
                        douXValues.Add(Convert.ToDouble(model.xData));
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

            dataChart.Axes.Add(xAxis.initNumericXAxis(min, max + 1, (max - min + 2) / 10));

            //Type type = typeof(YuMiPoHuaiModel);
            //PropertyInfo piLow = type.GetProperty(str + "Low");
            //PropertyInfo piHigh = type.GetProperty(str + "High");

            //yHigh = Convert.ToDouble(piHigh.GetValue(models[0], null));
            //yLow = Convert.ToDouble(piLow.GetValue(models[0], null));

            double low, high;
            Type type = typeof(YuMiPoHuaiModel);
            PropertyInfo piLow = type.GetProperty(str + "Low");
            PropertyInfo piHigh = type.GetProperty(str + "High");
            low = Convert.ToDouble(piLow.GetValue(models[0], null));
            high = Convert.ToDouble(piHigh.GetValue(models[0], null));

            dataChart.Axes.Add(yAxis.initNumericYAxis(low - (high - low) / 10, high + (high - low) / 10, (high - low) / 10));

            dataChart.Visibility = System.Windows.Visibility.Visible;
            dataChart.VerticalZoomable = true;
            dataChart.HorizontalZoomable = true;
            dataChart.VerticalZoombarVisibility = System.Windows.Visibility.Visible;
            dataChart.HorizontalZoombarVisibility = System.Windows.Visibility.Visible;
        }
        private void setAddToSpeedAxes(List<YuMiPoHuaiModel> models,String str)
        {
            double low, high;

            Type type = typeof(YuMiPoHuaiModel);
            PropertyInfo piLow = type.GetProperty(str + "AddToSpeedHigh");
            PropertyInfo piHigh = type.GetProperty(str + "AddToSpeedLow");

            high = Convert.ToDouble(piHigh.GetValue(models[0], null));
            low = Convert.ToDouble(piLow.GetValue(models[0], null));

            xAxis = new XAxis();
            yAxis = new YAxis();
            if (dataChart.Axes.Count > 0)
            {
                dataChart.Axes.Clear();
            }
            dataChart.Axes.Add(xAxis.initCategoryXAxis(dataSource.convert(models), 1));
            // dataChart.Axes.Add(xAxis.initNumericXAxis(10, 20, 3));
            dataChart.Axes.Add(yAxis.initNumericYAxis(low - (high - low) / 10, high + (high - low) / 10, (high - low) / 10));

            dataChart.Visibility = System.Windows.Visibility.Visible;
            dataChart.VerticalZoomable = true;
            dataChart.HorizontalZoomable = true;
            dataChart.VerticalZoombarVisibility = System.Windows.Visibility.Visible;
            dataChart.HorizontalZoombarVisibility = System.Windows.Visibility.Visible;
        }
        private void biaoShi_Loaded()
        {

            if (YuMiPoHuaiPage.type == 1)
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
            public string cengShuText;
            public List<string> cengShuListText = new List<string>();
            public string jianCeDianText;
            public List<string> jianCeDianListText = new List<string>();
            public string radioCheck1Text;
            public string radioCheck2Text;
        }

     
    }
}
