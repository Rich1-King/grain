using CornPeatsTeXingDongTaiChart.Resources;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Animation;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using wheateWindow;
using CornPeatsTeXingDataMember;
using ConvertData;

namespace CornPeatsTeXingDongTaiChart
{
    /// <summary>
    /// CornPeatsTeXingDongTaiChart.xaml 的交互逻辑
    /// </summary>
    public partial class CornPeatsTeXingDongTaiChart : Page
    {
     public  static Canvas canvas1;
        public static Canvas canvas2;

        XiaoMaiDisplayModel model;
        ConvertStringToRichTextBox convertToBox = new ConvertStringToRichTextBox();
        public CornPeatsTeXingDongTaiChart()
        {
           
            InitializeComponent();

            
            if (SelectData.getCount()==0)
            {             
            }
            else
            {
            }
            this.Loaded += OnSampleLoaded;
        }
        public CornPeatsTeXingDongTaiChart(string style, int action, int styleid)
        {
       
            InitializeComponent();

            if (SelectData.getCount() == 0)
            {
            }
            else
            {
            }
            this.Loaded += OnSampleLoaded;
        
        }
        protected MotionFramework MotionFramework;
        protected Dictionary<int, IList> DataSources;

        private void OnSampleLoaded(object sender, RoutedEventArgs e)
        {
            // get data sources that will be animated over time
            //this.DataSources = DataSourceGenerator.GetDataSources();

            this.MotionFramework = new MotionFramework();
            // set the interval between data updates 
            this.MotionFramework.DataUpdateInterval = TimeSpan.FromMilliseconds(200);

            // set the chart Transition Function and duration 
            this.MotionFramework.TransitionDuration = TimeSpan.FromMilliseconds(1);
            this.MotionFramework.TransitionFunction = new ExponentialEase { EasingMode = EasingMode.EaseInOut };

            // automatically size the chart axes to contain all data in the datasource 
            this.MotionFramework.AutosetAxisRange = true;
            this.MotionFramework.AutosetAxisMargin = new Thickness(0, 0.5, 0.1, 0.5);
            // set the chart to be used
            this.MotionFramework.Chart = this.MotionDataChart;
            // set the slider to control chart motion over time
            this.MotionFramework.DateTimeSlider = this.MotionSlider;
            // set whether trails would be shown
            this.MotionFramework.ShowTrails = true;
            this.MotionFramework.MarkerTemplate = this.Resources["MotionMarkerTemplate"] as DataTemplate;

            // set data sources
            //this.MotionFramework.DataSources = this.DataSources;
            // set the properties of bound objects to be used in the chart
            this.MotionFramework.SeriesRadiusMemberPath = MotionDataPoint.PropertyNameValueR;
            this.MotionFramework.SeriesXMemberPath = MotionDataPoint.PropertyNameValueX;
            this.MotionFramework.SeriesYMemberPath = MotionDataPoint.PropertyNameValueY;
            this.MotionFramework.SeriesTimeMemberPath = MotionDataPoint.PropertyNameValueDateTime;

            // set the chart axes
            this.MotionFramework.XAxisName = "axisX";
            this.MotionFramework.YAxisName = "axisY";
            this.MotionFramework.Chart.LayoutUpdated += OnChartLayoutUpdated;
            this.MotionFramework.PlaybackStopped += MotionFramework_PlaybackStopped;

            this.DataContext = this.MotionFramework;

           this.MotionPlayToggleButton.Click += OnMotionPlayButtonClick;
           this.DataUpdateIntervalSlider.ValueChanged += OnDataUpdateDurationSliderValueChanged;
           this.TransitionDurationSlider.ValueChanged += OnTransitionDurationSliderValueChanged;

           this.TransitionFunctionsComboBox.DisplayMemberPath = "DisplayName";
           this.TransitionFunctionsComboBox.ItemsSource = new TransitionFunctions();
           this.TransitionFunctionsComboBox.SelectionChanged += OnTransitionFunctionsComboBoxSelectionChanged;
           this.TransitionFunctionsComboBox.SelectedIndex = 1;
        }
      
        #region Event Handlers
        private void OnDataUpdateDurationSliderValueChanged(object sender, RoutedPropertyChangedEventArgs<double> e)
        {
            this.MotionFramework.DataUpdateInterval = TimeSpan.FromMilliseconds(e.NewValue);
        }
        private void OnTransitionFunctionsComboBoxSelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            try
            {
               TransitionFunction trans = e.AddedItems[0] as TransitionFunction;
                
                if (trans != null)
                {
                   //选择执行函数
                    this.MotionFramework.TransitionFunction = trans.Function;
                }
            }
            catch { 
            }
           
        }

        private void OnTransitionDurationSliderValueChanged(object sender, RoutedPropertyChangedEventArgs<double> e)
        {
            this.MotionFramework.TransitionDuration = TimeSpan.FromMilliseconds(e.NewValue);
        }
        private void MotionFramework_PlaybackStopped(object sender, EventArgs e)
        {
            this.MotionPlayToggleButton.IsChecked = false;
             this.MotionPlayToggleButton.Content = DataChartStrings.XWDC_Motion_Framework_Play;
        }

        private void OnChartLayoutUpdated(object sender, EventArgs e)
        {
            // initialize MotionFramework when chart finished loading for the first time
            if (!this.MotionFramework.IsInitialized)
            {
                this.MotionFramework.Initialize();
            }
        }
        //点击执行动画
        private void OnMotionPlayButtonClick(object sender, RoutedEventArgs e)
        {
            if (!this.MotionFramework.IsPlaying)
            {
                this.MotionFramework.Play();
                this.MotionPlayToggleButton.IsChecked = true;
               this.MotionPlayToggleButton.Content = DataChartStrings.XWDC_Motion_Framework_Pause;
            }
            else
            {
                this.MotionFramework.Pause();
              this.MotionPlayToggleButton.IsChecked = false;
                this.MotionPlayToggleButton.Content = DataChartStrings.XWDC_Motion_Framework_Play;
            }
        }
        #endregion

        private void TransitionFunctionsComboBox_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
           
        }

        private void MotionSlider_ValueChanged(object sender, RoutedPropertyChangedEventArgs<double> e)
        {

        }
        Dictionary<int, IList> dictionary = new Dictionary<int, IList>();
      
        private void LayoutRoot_Loaded(object sender, RoutedEventArgs e)
        {
            string miaoShu = null;
            this.DataSources = new Dictionary<int, IList>();
            int j = 0;
            if (wheateHaiChongDuiXiaoMaiYingXiang.type == 1)
            {
                titleLab.Content = "小麦感染谷蠹后虫蚀粒率的变化情况";
                for (int i = 37; i < 40; i++)
                {
                    List<DataPoint> data = SelectData.recieveData("0000"+i);
                    XAxis.ItemsSource = data;
                    this.DataSources.Add(j++, data);
                    model = (new DataSource("0000"+i)).getMiaoShu();
                    if(miaoShu == null)
                    {
                        miaoShu = model.chartMiaoShu;
                    }
                    else
                    {
                        miaoShu = miaoShu + "\n" + model.chartMiaoShu;
                    }           
                }
            }
            if (wheateHaiChongDuiXiaoMaiYingXiang.type == 2)
            {
                titleLab.Content = "小麦感染米象后虫蚀粒率的变化情况";
                for (int i = 40; i < 43; i++)
                {
                    List<DataPoint> data = SelectData.recieveData("0000" + i);
                    XAxis.ItemsSource = data;
                    this.DataSources.Add(j++, data);
                    model = (new DataSource("0000" + i)).getMiaoShu();
                    if (miaoShu == null)
                    {
                        miaoShu = model.chartMiaoShu;
                    }
                    else
                    {
                        miaoShu = miaoShu + "\n" + model.chartMiaoShu;
                    }           
                }
            }
            if (wheateHaiChongDuiXiaoMaiYingXiang.type == 3)
            {
                titleLab.Content = "小麦感染玉米象后容重的变化情况";
                for (int i = 43; i < 51; i++)
                {          
                     List<DataPoint> data = SelectData.recieveData("0000" + i);
                     XAxis.ItemsSource = data;
                    
                    this.DataSources.Add(j++, data);
                    model = (new DataSource("0000" + i)).getMiaoShu();
                    if (miaoShu == null)
                    {
                        miaoShu = model.chartMiaoShu;
                    }
                    else
                    {
                        miaoShu = miaoShu + "\n" + model.chartMiaoShu;
                    }           
                }
            }

            this.MotionFramework.DataSources = this.DataSources;
            wheateHaiChongDuiXiaoMaiYingXiang.miaoShu.Document = convertToBox.convertStringToFlowDocument(miaoShu);
        }


    }
    public class DataSourceGenerator:List<DataPoint>
    {
        public DataSourceGenerator()
        {
             //d = SelectData.getData();
        
             //  foreach (DataPoint dp in d[0])
             //  {
             //      this.Add(dp);
             //  }
           
       
        }
        public static Dictionary<int, IList> d;
        public static Dictionary<int, IList> GetDataSources()
        {
            d = SelectData.getData();
            return d;
        }
    }
    public class TransitionFunctions : List<TransitionFunction>
    {
        public TransitionFunctions()
        {

            this.Add(new TransitionFunction()); // Linear Transition Function
            this.Add(new TransitionFunction(new BackEase(), EasingMode.EaseIn));
            this.Add(new TransitionFunction(new BackEase(), EasingMode.EaseInOut));
            this.Add(new TransitionFunction(new BackEase(), EasingMode.EaseOut));
            this.Add(new TransitionFunction(new BounceEase(), EasingMode.EaseIn));
            this.Add(new TransitionFunction(new BounceEase(), EasingMode.EaseInOut));
            this.Add(new TransitionFunction(new BounceEase(), EasingMode.EaseOut));
            this.Add(new TransitionFunction(new CircleEase(), EasingMode.EaseIn));
            this.Add(new TransitionFunction(new CircleEase(), EasingMode.EaseInOut));
            this.Add(new TransitionFunction(new CircleEase(), EasingMode.EaseOut));
            this.Add(new TransitionFunction(new CubicEase(), EasingMode.EaseIn));
            this.Add(new TransitionFunction(new CubicEase(), EasingMode.EaseInOut));
            this.Add(new TransitionFunction(new CubicEase(), EasingMode.EaseOut));
            this.Add(new TransitionFunction(new ElasticEase(), EasingMode.EaseIn));
            this.Add(new TransitionFunction(new ElasticEase(), EasingMode.EaseInOut));
            this.Add(new TransitionFunction(new ElasticEase(), EasingMode.EaseOut));
            this.Add(new TransitionFunction(new ExponentialEase(), EasingMode.EaseIn));
            this.Add(new TransitionFunction(new ExponentialEase(), EasingMode.EaseInOut));
            this.Add(new TransitionFunction(new ExponentialEase(), EasingMode.EaseOut));
            this.Add(new TransitionFunction(new PowerEase(), EasingMode.EaseIn));
            this.Add(new TransitionFunction(new PowerEase(), EasingMode.EaseInOut));
            this.Add(new TransitionFunction(new PowerEase(), EasingMode.EaseOut));
            this.Add(new TransitionFunction(new QuadraticEase(), EasingMode.EaseIn));
            this.Add(new TransitionFunction(new QuadraticEase(), EasingMode.EaseInOut));
            this.Add(new TransitionFunction(new QuadraticEase(), EasingMode.EaseOut));
            this.Add(new TransitionFunction(new QuarticEase(), EasingMode.EaseIn));
            this.Add(new TransitionFunction(new QuarticEase(), EasingMode.EaseInOut));
            this.Add(new TransitionFunction(new QuarticEase(), EasingMode.EaseOut));
            this.Add(new TransitionFunction(new SineEase(), EasingMode.EaseIn));
            this.Add(new TransitionFunction(new SineEase(), EasingMode.EaseInOut));
            this.Add(new TransitionFunction(new SineEase(), EasingMode.EaseOut));

        }
    }
    public class TransitionFunction
    {
        /// <summary>
        /// Constructor for Transition Function, default is Linear Transition Function
        /// </summary>
        public TransitionFunction()
        {
            //this.DisplayName = "线性";
        }
        public TransitionFunction(EasingFunctionBase function, EasingMode easingMode)
        {
            function.EasingMode = easingMode;
            this.Function = function;
            this.Mode = easingMode;
           // this.DisplayName = str;
        }
      
        public EasingMode Mode { get; private set; }
        public EasingFunctionBase Function { get; private set; }

        private string GetFunctionName()
        {
            return this.Function.GetType().Name.Replace("Ease", "");
        }
        private string GetModeName()
        {
            return this.Mode.ToString().Replace("Ease", "");
        }
        public string DisplayName
        {

            get
            {
                if (Function == null) return "线性";
                return this.GetFunctionName() + this.GetModeName();
            }
        }
        public override string ToString()
        {
            return this.DisplayName;
        }
    }
}
