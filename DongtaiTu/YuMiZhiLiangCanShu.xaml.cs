using System;
using System.Collections;
using System.Collections.Generic;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Media.Animation;
using WpfApplication6.Resources;
using System.Windows.Input;
using Infragistics.Controls.Charts;
using YuMiChart;
namespace WpfApplication6
{
  
    public partial class YuMiZhiLiangCanShu : Infragistics.Samples.Framework.SampleContainer
    {
        public  static Canvas canvas1;
        public static Canvas canvas2;
       
        public YuMiZhiLiangCanShu()
        {
           
            InitializeComponent();

            
         
            this.Loaded += OnSampleLoaded;
        }
        protected MotionFramework MotionFramework;
        protected Dictionary<int, IList> DataSources;

        private void OnSampleLoaded(object sender, RoutedEventArgs e)
        {
            // get data sources that will be animated over time
            try
            {
                this.DataSources = DataSourceGenerator.GetDataSources();
            }
            catch (Exception e1)
            {
                MessageBox.Show(e1.Message);
            }

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
            this.MotionFramework.DataSources = this.DataSources;
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
            this.TransitionFunctionsComboBox.ItemsSource = new WpfApplication6.TransitionFunctions();
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
                WpfApplication6.TransitionFunction trans = e.AddedItems[0] as WpfApplication6.TransitionFunction;
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


    }
    public class DataSourceGenerator:List<DataPoint>
    {
        public DataSourceGenerator()
        {
            try
            {
                d.Add(0, SelectData.getData(SelectPage.DongTaiModels));
            }
            catch (Exception)
            {
                return;
            }

            foreach (DataPoint dp in d[0])
            {
                this.Add(dp);
            }
           
       
        }
        public static Dictionary<int, IList> d;
        public static Dictionary<int, IList> GetDataSources()
        {
            d = new Dictionary<int, IList>();
            try
            {
                d.Add(0,SelectData.getData(SelectPage.DongTaiModels));
            }
            catch (Exception e)
            {
                throw e;
            }
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