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
    /// SelectPageBaoZi.xaml 的交互逻辑
    /// </summary>
    public partial class SelectPageBaoZi : Page
    {
        public SelectPageBaoZi()
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
        private TitleModel title;
        private List<YuMiBaoZiModel> models;
        private List<YuMiBaoZiModel> predictModels;

        private void Grid_Load(object sender, RoutedEventArgs e)
        {
            biaoShi_Loaded();
            data = new InitData();
            data.comLabelText = "取样点:";
            List<string> comStr = new List<string>();
            comStr.Add("36");
            comStr.Add("66");
            data.comTexts = comStr;
            data.radioCheck1Text = "地点一";
            data.radioCheck2Text = "地点二";
            data.radioCheck3Text = "地点三";
            InitPage(data);
            setTitle("玉米孢子坐标轴描述表", "000001");
            try
            {
                models = dataSource.getYuMiBaoZiData("000001");
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
            switch (YuMiBaoZiPage.type)
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
                    InitSpline(models, MarkerType.None);
                    break;
                case 4:
                    setAxes(models);
                    InitSpline(models, MarkerType.None);
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
                    dateGrid.Visibility = Visibility.Visible;
                    break;
                case 11:
                    predictPanDuan();
                    break;
                case 12:
                    dayGrid.Visibility = Visibility.Visible;
                    initPredictDay();
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
            PanDuan();
        }
        private void Radio_Click(object sender, RoutedEventArgs e)
        {
            RadioButton radio = sender as RadioButton;
            check1.IsChecked = false;
            check2.IsChecked = false;
            check3.IsChecked = false;
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
            switch (YuMiBaoZiPage.type)
            {
                case 1:
                    switch (com.SelectedIndex)
                    {
                        case 0:
                            if (check1.IsChecked == true)
                            {
                                setTitle("玉米孢子坐标轴描述表", "000001");
                                models = dataSource.getYuMiBaoZiData("000001");
                            }
                            else if (check2.IsChecked == true)
                            {
                                setTitle("玉米孢子坐标轴描述表", "000002");
                                models = dataSource.getYuMiBaoZiData("000002");
                            }
                            else if (check3.IsChecked == true)
                            {
                                setTitle("玉米孢子坐标轴描述表", "000003");
                                models = dataSource.getYuMiBaoZiData("000003");
                            }
                            break;
                        case 1:
                            if (check1.IsChecked == true)
                            {
                                setTitle("玉米孢子坐标轴描述表", "000004");
                                models = dataSource.getYuMiBaoZiData("000004");
                            }
                            else if (check2.IsChecked == true)
                            {
                                setTitle("玉米孢子坐标轴描述表", "000005");
                                models = dataSource.getYuMiBaoZiData("000005");
                            }
                            else if (check3.IsChecked == true)
                            {
                                setTitle("玉米孢子坐标轴描述表", "000006");
                                models = dataSource.getYuMiBaoZiData("000006");
                            }
                            break;
                        default:
                            MessageBox.Show("没有数据!");
                            break;
                    }
                    setAxes(models);
                    InitBarChart(models);
                    InitLineBar(models, "low");
                    InitLineBar(models, "high");
                    InitLineBar(models, "media");
                    break;
                case 2:
                    switch (com.SelectedIndex)
                    {
                        case 0:
                            if (check1.IsChecked == true)
                            {
                                setTitle("玉米孢子坐标轴描述表", "000001");
                                models = dataSource.getYuMiBaoZiData("000001");
                            }
                            else if (check2.IsChecked == true)
                            {
                                setTitle("玉米孢子坐标轴描述表", "000002");
                                models = dataSource.getYuMiBaoZiData("000002");
                            }
                            else if (check3.IsChecked == true)
                            {
                                setTitle("玉米孢子坐标轴描述表", "000003");
                                models = dataSource.getYuMiBaoZiData("000003");
                            }
                            break;
                        case 1:
                            if (check1.IsChecked == true)
                            {
                                setTitle("玉米孢子坐标轴描述表", "000004");
                                models = dataSource.getYuMiBaoZiData("000004");
                            }
                            else if (check2.IsChecked == true)
                            {
                                setTitle("玉米孢子坐标轴描述表", "000005");
                                models = dataSource.getYuMiBaoZiData("000005");
                            }
                            else if (check3.IsChecked == true)
                            {
                                setTitle("玉米孢子坐标轴描述表", "000006");
                                models = dataSource.getYuMiBaoZiData("000006");
                            }
                            break;
                        default:
                            MessageBox.Show("没有数据!");
                            break;
                    }
                    setAddToSpeedAxes(models);
                    InitAddToSpeedSpline(models);
                    break;
                case 3:
                    switch (com.SelectedIndex)
                    {
                        case 0:
                            if (check1.IsChecked == true)
                            {
                                setTitle("玉米孢子坐标轴描述表", "000001");
                                models = dataSource.getYuMiBaoZiData("000001");
                            }
                            else if (check2.IsChecked == true)
                            {
                                setTitle("玉米孢子坐标轴描述表", "000002");
                                models = dataSource.getYuMiBaoZiData("000002");
                            }
                            else if (check3.IsChecked == true)
                            {
                                setTitle("玉米孢子坐标轴描述表", "000003");
                                models = dataSource.getYuMiBaoZiData("000003");
                            }
                            break;
                        case 1:
                            if (check1.IsChecked == true)
                            {
                                setTitle("玉米孢子坐标轴描述表", "000004");
                                models = dataSource.getYuMiBaoZiData("000004");
                            }
                            else if (check2.IsChecked == true)
                            {
                                setTitle("玉米孢子坐标轴描述表", "000005");
                                models = dataSource.getYuMiBaoZiData("000005");
                            }
                            else if (check3.IsChecked == true)
                            {
                                setTitle("玉米孢子坐标轴描述表", "000006");
                                models = dataSource.getYuMiBaoZiData("000006");
                            }
                            break;
                        default:
                            MessageBox.Show("没有数据!");
                            break;
                    }
                    setAxes(models);
                    InitSpline(models, MarkerType.None);
                    break;
                case 4:
                    switch (com.SelectedIndex)
                    {
                        case 0:
                            if (check1.IsChecked == true)
                            {
                                setTitle("玉米孢子坐标轴描述表", "000001");
                                models = dataSource.getYuMiBaoZiData("000001");
                            }
                            else if (check2.IsChecked == true)
                            {
                                setTitle("玉米孢子坐标轴描述表", "000002");
                                models = dataSource.getYuMiBaoZiData("000002");
                            }
                            else if (check3.IsChecked == true)
                            {
                                setTitle("玉米孢子坐标轴描述表", "000003");
                                models = dataSource.getYuMiBaoZiData("000003");
                            }
                            break;
                        case 1:
                            if (check1.IsChecked == true)
                            {
                                setTitle("玉米孢子坐标轴描述表", "000004");
                                models = dataSource.getYuMiBaoZiData("000004");
                            }
                            else if (check2.IsChecked == true)
                            {
                                setTitle("玉米孢子坐标轴描述表", "000005");
                                models = dataSource.getYuMiBaoZiData("000005");
                            }
                            else if (check3.IsChecked == true)
                            {
                                setTitle("玉米孢子坐标轴描述表", "000006");
                                models = dataSource.getYuMiBaoZiData("000006");
                            }
                            break;
                        default:
                            MessageBox.Show("没有数据!");
                            break;
                    }
                    setAxes(models);
                    InitSpline(models, MarkerType.None);
                    break;
                case 5:
                    switch (com.SelectedIndex)
                    {
                        case 0:
                            if (check1.IsChecked == true)
                            {
                                setTitle("玉米孢子坐标轴描述表", "000001");
                                models = dataSource.getYuMiBaoZiData("000001");
                            }
                            else if (check2.IsChecked == true)
                            {
                                setTitle("玉米孢子坐标轴描述表", "000002");
                                models = dataSource.getYuMiBaoZiData("000002");
                            }
                            else if (check3.IsChecked == true)
                            {
                                setTitle("玉米孢子坐标轴描述表", "000003");
                                models = dataSource.getYuMiBaoZiData("000003");
                            }
                            break;
                        case 1:
                            if (check1.IsChecked == true)
                            {
                                setTitle("玉米孢子坐标轴描述表", "000004");
                                models = dataSource.getYuMiBaoZiData("000004");
                            }
                            else if (check2.IsChecked == true)
                            {
                                setTitle("玉米孢子坐标轴描述表", "000005");
                                models = dataSource.getYuMiBaoZiData("000005");
                            }
                            else if (check3.IsChecked == true)
                            {
                                setTitle("玉米孢子坐标轴描述表", "000006");
                                models = dataSource.getYuMiBaoZiData("000006");
                            }
                            break;
                        default:
                            MessageBox.Show("没有数据!");
                            break;
                    }
                    setAxes(models);
                    InitBarChart(models);
                    break;
                case 6:
                    switch (com.SelectedIndex)
                    {
                        case 0:
                            if (check1.IsChecked == true)
                            {
                                setTitle("玉米孢子坐标轴描述表", "000001");
                                models = dataSource.getYuMiBaoZiData("000001");
                            }
                            else if (check2.IsChecked == true)
                            {
                                setTitle("玉米孢子坐标轴描述表", "000002");
                                models = dataSource.getYuMiBaoZiData("000002");
                            }
                            else if (check3.IsChecked == true)
                            {
                                setTitle("玉米孢子坐标轴描述表", "000003");
                                models = dataSource.getYuMiBaoZiData("000003");
                            }
                            break;
                        case 1:
                            if (check1.IsChecked == true)
                            {
                                setTitle("玉米孢子坐标轴描述表", "000004");
                                models = dataSource.getYuMiBaoZiData("000004");
                            }
                            else if (check2.IsChecked == true)
                            {
                                setTitle("玉米孢子坐标轴描述表", "000005");
                                models = dataSource.getYuMiBaoZiData("000005");
                            }
                            else if (check3.IsChecked == true)
                            {
                                setTitle("玉米孢子坐标轴描述表", "000006");
                                models = dataSource.getYuMiBaoZiData("000006");
                            }
                            break;
                        default:
                            MessageBox.Show("没有数据!");
                            break;
                    }
                    setAxes(models);
                    InitLine(models);
                    break;
                case 7:
                    switch (com.SelectedIndex)
                    {
                        case 0:
                            if (check1.IsChecked == true)
                            {
                                setTitle("玉米孢子坐标轴描述表", "000001");
                                models = dataSource.getYuMiBaoZiData("000001");
                            }
                            else if (check2.IsChecked == true)
                            {
                                setTitle("玉米孢子坐标轴描述表", "000002");
                                models = dataSource.getYuMiBaoZiData("000002");
                            }
                            else if (check3.IsChecked == true)
                            {
                                setTitle("玉米孢子坐标轴描述表", "000003");
                                models = dataSource.getYuMiBaoZiData("000003");
                            }
                            break;
                        case 1:
                            if (check1.IsChecked == true)
                            {
                                setTitle("玉米孢子坐标轴描述表", "000004");
                                models = dataSource.getYuMiBaoZiData("000004");
                            }
                            else if (check2.IsChecked == true)
                            {
                                setTitle("玉米孢子坐标轴描述表", "000005");
                                models = dataSource.getYuMiBaoZiData("000005");
                            }
                            else if (check3.IsChecked == true)
                            {
                                setTitle("玉米孢子坐标轴描述表", "000006");
                                models = dataSource.getYuMiBaoZiData("000006");
                            }
                            break;
                        default:
                            MessageBox.Show("没有数据!");
                            break;
                    }
                    InitDongTai(models);
                    break;
                case 8:
                    switch (com.SelectedIndex)
                    {
                        case 0:
                            if (check1.IsChecked == true)
                            {
                                setTitle("玉米孢子坐标轴描述表", "000001");
                                models = dataSource.getYuMiBaoZiData("000001");
                            }
                            else if (check2.IsChecked == true)
                            {
                                setTitle("玉米孢子坐标轴描述表", "000002");
                                models = dataSource.getYuMiBaoZiData("000002");
                            }
                            else if (check3.IsChecked == true)
                            {
                                setTitle("玉米孢子坐标轴描述表", "000003");
                                models = dataSource.getYuMiBaoZiData("000003");
                            }
                            break;
                        case 1:
                            if (check1.IsChecked == true)
                            {
                                setTitle("玉米孢子坐标轴描述表", "000004");
                                models = dataSource.getYuMiBaoZiData("000004");
                            }
                            else if (check2.IsChecked == true)
                            {
                                setTitle("玉米孢子坐标轴描述表", "000005");
                                models = dataSource.getYuMiBaoZiData("000005");
                            }
                            else if (check3.IsChecked == true)
                            {
                                setTitle("玉米孢子坐标轴描述表", "000006");
                                models = dataSource.getYuMiBaoZiData("000006");
                            }
                            break;
                        default:
                            MessageBox.Show("没有数据!");
                            break;
                    }
                    setBubbleAxes(models);
                    InitBubble(models);
                    break;
                case 9:
                    dayGrid.Visibility = Visibility.Visible;
                    initPredictDay();
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
        ConvertStringToRichTextBox convertToBox = new ConvertStringToRichTextBox();
        private void setTitle(string tableName, string shiYanHao)
        {
            title = dataSource.getTitle(tableName, shiYanHao);

            if (YuMiBaoZiPage.type == 2)
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
        private void InitPage(InitData data)
        {
            this.comLabel.Content = data.comLabelText;
            this.com.ItemsSource = data.comTexts;
            this.check1.Content = data.radioCheck1Text;
            this.check2.Content = data.radioCheck2Text;
            this.check3.Content = data.radioCheck3Text;
        }
        private void InitBarChart(List<YuMiBaoZiModel> models)
        {
            ColumnSeries col = new ColumnSeries();
            col.XAxis = (CategoryAxisBase)dataChart.Axes[0];
            col.YAxis = (NumericYAxis)dataChart.Axes[1];
            col.ItemsSource = models;
            col.Visibility = Visibility.Visible;
            col.ValueMemberPath = "yData";
            if (YuMiBaoZiPage.type == 1)
            {
                DataTemplate template = new DataTemplate();
                FrameworkElementFactory fef = new FrameworkElementFactory(typeof(TextBlock));
                fef.SetBinding(TextBlock.TextProperty, new Binding() { Path = new PropertyPath("Item.yData") });
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

        private void InitAddToSpeedSpline(List<YuMiBaoZiModel> models)
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
        private void InitSpline(List<YuMiBaoZiModel> models,MarkerType type)
        {
            SplineSeries spline = new SplineSeries();
            spline.XAxis = (CategoryAxisBase)dataChart.Axes[0];

            spline.YAxis = (NumericYAxis)dataChart.Axes[1];

            spline.ItemsSource = models;
            spline.Visibility = Visibility.Visible;
            spline.ValueMemberPath = "yData";
            spline.Thickness = 3;
            spline.MarkerType = type;
            if (YuMiBaoZiPage.type == 3)
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
        private void InitLine(List<YuMiBaoZiModel> models)
        {
            LineSeries line = new LineSeries();
            line.XAxis = (CategoryAxisBase)dataChart.Axes[0];

            line.YAxis = (NumericYAxis)dataChart.Axes[1];

            line.ItemsSource = models;
            line.Visibility = Visibility.Visible;
            line.ValueMemberPath = "yData";
            line.Thickness = 3;
            line.MarkerType = MarkerType.None;
            line.ToolTip = InitToolTip(models, line);
            //if (dataChart.Series.Count > 0)
            //{
            //    dataChart.Series.Clear();
            //}
            dataChart.Series.Add(line);
        }
        private void InitBubble(List<YuMiBaoZiModel> models)
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
        private void InitDongTai(List<YuMiBaoZiModel> models)
        {
            DongTaiModels = dataSource.convert(models);
            Frame frame = new Frame();
            frame.Source = new Uri("pack://application:,,,/DongTaiTu;component/YuMiBaoZi.xaml");
            if (ChartDisplay.mainGrid.Children.Count > 0)
            {
                ChartDisplay.mainGrid.Children.Clear();
            }
            ChartDisplay.mainGrid.Children.Add(frame);
        }
        private Grid InitToolTip(List<YuMiBaoZiModel> model, Series col)
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
        private Grid InitSpeedToolTip(List<YuMiBaoZiModel> models, Series col)
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

        private void InitLineBar(List<YuMiBaoZiModel> models, string str)
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
        private void setAxes(List<YuMiBaoZiModel> models)
        {
            xAxis = new XAxis();
            yAxis = new YAxis();
            if (dataChart.Axes.Count > 0)
            {
                dataChart.Axes.Clear();
            }
            if (YuMiBaoZiPage.type == 9 ||YuMiBaoZiPage.type == 11 || YuMiBaoZiPage.type == 12)
            {
                dataChart.Axes.Add(xAxis.initCategoryXAxis(dataSource.convert(models), 32));
            }
            else
            {
                dataChart.Axes.Add(xAxis.initCategoryXAxis(dataSource.convert(models), 1));
            }
            dataChart.Axes.Add(yAxis.initNumericYAxis(models[0].low - (models[0].high - models[0].low) / 10, models[0].high + (models[0].high - models[0].low) / 10, (models[0].high - models[0].low) / 10));
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

        private void setBubbleAxes(List<YuMiBaoZiModel> models)
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
                foreach (YuMiBaoZiModel str in models)
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

            dataChart.Axes.Add(xAxis.initNumericXAxis(min, max + 1, (max - min + 2) / 10));
            dataChart.Axes.Add(yAxis.initNumericYAxis(models[0].low - (models[0].high - models[0].low) / 10, models[0].high + (models[0].high - models[0].low) / 10, (models[0].high - models[0].low) / 10));

            dataChart.Visibility = System.Windows.Visibility.Visible;
            dataChart.VerticalZoomable = true;
            dataChart.HorizontalZoomable = true;
            dataChart.VerticalZoombarVisibility = System.Windows.Visibility.Visible;
            dataChart.HorizontalZoombarVisibility = System.Windows.Visibility.Visible;
        }
        private void setAddToSpeedAxes(List<YuMiBaoZiModel> models)
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
            if (YuMiBaoZiPage.type == 1)
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
            public string radioCheck3Text;
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
                        setTitle("玉米孢子坐标轴描述表", "000001");
                        models = dataSource.getYuMiBaoZiData("000001");
                    }
                    else if (check2.IsChecked == true)
                    {
                        setTitle("玉米孢子坐标轴描述表", "000002");
                        models = dataSource.getYuMiBaoZiData("000002");
                    }
                    else if (check3.IsChecked == true)
                    {
                        setTitle("玉米孢子坐标轴描述表", "000003");
                        models = dataSource.getYuMiBaoZiData("000003");
                    }
                    break;
                case 1:
                    if (check1.IsChecked == true)
                    {
                        setTitle("玉米孢子坐标轴描述表", "000004");
                        models = dataSource.getYuMiBaoZiData("000004");
                    }
                    else if (check2.IsChecked == true)
                    {
                        setTitle("玉米孢子坐标轴描述表", "000005");
                        models = dataSource.getYuMiBaoZiData("000005");
                    }
                    else if (check3.IsChecked == true)
                    {
                        setTitle("玉米孢子坐标轴描述表", "000006");
                        models = dataSource.getYuMiBaoZiData("000006");
                    }
                    break;
                default:
                    MessageBox.Show("没有数据!");
                    break;
            }

            switch (YuMiBaoZiPage.type)
            {
                case 9:
                    double timeClip = Convert.ToDouble(models[models.Count - 1].xData);
                    predictModels = dataSource.getPredictDataAfterTime(models, Convert.ToInt16(daySelect.SelectedItem), 32);
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

        private void initPredictDay()
        {
            List<int> dayNum = new List<int>();
            for (int i = 0; i <= 192; i = i + 32)
            {
                dayNum.Add(i);
            }
            daySelect.ItemsSource = dayNum;
            daySelect.SelectedIndex = 0;
        }

        private void day_Changed(object sender, EventArgs e)
        {
            predictPanDuan();
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
                foreach (YuMiBaoZiModel data in predictModels)
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

                foreach (YuMiBaoZiModel data in predictModels)
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
