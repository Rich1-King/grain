using CornPeatsTeXingBarChart.series;
using CornPeatsTeXingBarChart;
using ScatterDiagram;
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

namespace CornPeatsTeXingBarChart.Select
{
    /// <summary>
    /// SelectWindow.xaml 的交互逻辑
    /// </summary>
    public partial class SelectWindow : Window
    {
        public Infragistics.Samples.Framework.SampleContainer window;
        public Button butCorn;
        public Button butGrain;
        public Button butTcc;
        public Button butRice;
        public SelectWindow()
        {
            InitializeComponent();
        }

        public SelectWindow(Infragistics.Samples.Framework.SampleContainer window)
        {
            InitializeComponent();
            this.window = window;
        }
        private void Button_Click(object sender, RoutedEventArgs e)
        {
            if (this.window is MediaValueOverlays)
            {
                MediaValueOverlays media = this.window as MediaValueOverlays;
                media.Click(sender);
                
            }
            if (this.window is ScatterDiagramAnaylisis)
            {
                ScatterDiagramAnaylisis scatter = this.window as ScatterDiagramAnaylisis;
                scatter.Click(sender);
            }
            if (this.window is SpeedDataWindow)
            {
                SpeedDataWindow speed = this.window as SpeedDataWindow;
                speed.Click(sender);
            }
            if (this.window is LineCrosshairCoordinates)
            {
                LineCrosshairCoordinates line = this.window as LineCrosshairCoordinates;
                line.Click(sender);
            }
            if (this.window is LineCrosshairCoordinates1)
            {
                LineCrosshairCoordinates1 line1 = this.window as LineCrosshairCoordinates1;
                line1.Click(sender);
            }
            if (this.window is LineCrosshairCoordinates2)
            {
                LineCrosshairCoordinates2 line2 = this.window as LineCrosshairCoordinates2;
                line2.Click(sender);
            }
            if (this.window is ValueOverlays)
            {
                ValueOverlays value = this.window as ValueOverlays;
                //value.Click(sender);
            }
            if (this.window is ValueOverlays1)
            {
                ValueOverlays1 value1 = this.window as ValueOverlays1;
                value1.Click(sender);
            }
            if (this.window is ValueOverlays2)
            {
                ValueOverlays2 value2 = this.window as ValueOverlays2;
                value2.Click(sender);
            }
            if (this.window is ChartCrosshairCoordinates)
            {
                ChartCrosshairCoordinates chart = this.window as ChartCrosshairCoordinates;
                chart.Click(sender);
            }
            if (this.window is ChartCrosshairCoordinates1)
            {
                ChartCrosshairCoordinates1 chart1 = this.window as ChartCrosshairCoordinates1;
                chart1.Click(sender);
            }
            if (this.window is ChartCrosshairCoordinates2)
            {
                ChartCrosshairCoordinates2 chart2 = this.window as ChartCrosshairCoordinates2;
                chart2.Click(sender);
            }
            //if (this.window is AllWindow)
            //{
            //    AllWindow all = this.window as AllWindow;
            //    all.Click(sender);
            //}
        }

        private void Grid_Loaded(object sender, RoutedEventArgs e)
        {
            this.butCorn = butCorn1;
            this.butRice = butRice1;
            this.butTcc = butTcc1;
            this.butGrain = butGrain1;
        }
    }
}
