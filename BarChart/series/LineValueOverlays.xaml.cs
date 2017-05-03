using System.Windows;
using System.Windows.Controls;
using CornPeatsTeXingDataMember;
using Infragistics.Controls.Charts;
using System.Windows.Media;
namespace CornPeatsTeXingBarChart.series
{
    public partial class LineValueOverlays : Infragistics.Samples.Framework.SampleContainer
    {
        public LineValueOverlays()
        {
            InitializeComponent();
            if (SelectData.getCount() == 0)
            {
                this.line.Visibility = Visibility.Hidden;
                //this.line1.Visibility = Visibility.Visible;
            }
            else
            {
                this.line.Visibility = Visibility.Visible;
                //this.line1.Visibility = Visibility.Hidden;
            }

        }


        #region Event Handlers

        private void OnMedianValueOverlayCheckBoxClick(object sender, RoutedEventArgs e)
        {
            CheckBox chb = sender as CheckBox;
            if (chb != null && chb.IsChecked != null)
                this.DataChart.Series["MedianValueOverlay"].Opacity = chb.IsChecked.Value ? 0.5 : 0;
        }
        private void OnMeanValueOverlayCheckBoxClick(object sender, RoutedEventArgs e)
        {
            CheckBox chb = sender as CheckBox;
            if (chb != null && chb.IsChecked != null)
                this.DataChart.Series["MeanValueOverlay"].Opacity = chb.IsChecked.Value ? 0.5 : 0;
        }
        private void OnVarianceValueOverlayCheckBoxClick(object sender, RoutedEventArgs e)
        {
            CheckBox chb = sender as CheckBox;
            if (chb != null && chb.IsChecked != null)
                this.DataChart.Series["VarianceValueOverlay"].Opacity = chb.IsChecked.Value ? 0.5 : 0;
        }
        private void OnHighestValueOverlayCheckBoxClick(object sender, RoutedEventArgs e)
        {
            CheckBox chb = sender as CheckBox;
            if (chb != null && chb.IsChecked != null)
                this.DataChart.Series["HighestValueOverlay"].Opacity = chb.IsChecked.Value ? 0.5 : 0;
        }
        private void OnLowestValueOverlayCheckBoxClick(object sender, RoutedEventArgs e)
        {
            CheckBox chb = sender as CheckBox;
            if (chb != null && chb.IsChecked != null)
                this.DataChart.Series["LowestValueOverlay"].Opacity = chb.IsChecked.Value ? 0.5 : 0;
        }
        private void OnFixedValueOverlayCheckBoxClick(object sender, RoutedEventArgs e)
        {
            CheckBox chb = sender as CheckBox;
            if (chb != null && chb.IsChecked != null)
                this.DataChart.Series["FixedValueOverlay"].Opacity = chb.IsChecked.Value ? 0.5 : 0;
        }
        private void OnEditableValueOverlayCheckBoxClick(object sender, RoutedEventArgs e)
        {
            CheckBox chb = sender as CheckBox;
            // this.DataChart.Series["tt"].Visibility = Visibility.Visible;
            if (chb != null && chb.IsChecked != null)
                this.DataChart.Series["EditableValueOverlay"].Opacity = chb.IsChecked.Value ? 0.5 : 0;
        }
        #endregion

        SplineSeries[] tt1 = new SplineSeries[4];
        DataSource Axis = new DataSource("000001");
        DataSource yData = new DataSource("000001");
        DataSource y1Data = new DataSource("000002");
        DataSource y2Data = new DataSource("000003");
        DataSource y3Data = new DataSource("000004");
        private void CheckBox_Checked(object sender, RoutedEventArgs e)
        {

            CheckBox checkCenter = sender as CheckBox;
            checkCenter.IsChecked = true;

            if (checkCenter == checkRice)
            {
                if (tt1[0] == null)
                {
                    tt1[0] = new SplineSeries();
                }
                tt1[0].MarkerType = MarkerType.None;
                tt1[0].ItemsSource = y2Data;
                tt1[0].Thickness = 5;
                tt1[0].ValueMemberPath = colRice.ValueMemberPath;
                tt1[0].Brush = new SolidColorBrush(Colors.Black);
                tt1[0].Visibility = Visibility.Visible;
                tt1[0].XAxis = categoryXAxis;
                tt1[0].YAxis = numericYAxis;
                this.DataChart.Series.Add(tt1[0]);
            }
            else if (checkCenter == checkCorn)
            {
                if (tt1[1] == null)
                {
                    tt1[1] = new SplineSeries();
                }
                tt1[1].MarkerType = MarkerType.None;
                tt1[1].ItemsSource = y1Data;
                tt1[1].Thickness = 5;
                tt1[1].ValueMemberPath = colCorn.ValueMemberPath;
                tt1[1].Brush = new SolidColorBrush(Colors.Gray);
                tt1[1].Visibility = Visibility.Visible;
                tt1[1].XAxis = categoryXAxis;
                tt1[1].YAxis = numericYAxis;
                this.DataChart.Series.Add(tt1[1]);
            }
            else if (checkCenter == checkGrain)
            {
                if (tt1[2] == null)
                {
                    tt1[2] = new SplineSeries();
                }
                tt1[2].MarkerType = MarkerType.None;
                tt1[2].ItemsSource = yData;
                tt1[2].Thickness = 5;
                tt1[2].ValueMemberPath = colGrain.ValueMemberPath;
                tt1[2].Brush = new SolidColorBrush(Colors.LawnGreen);
                tt1[2].Visibility = Visibility.Visible;
                tt1[2].XAxis = categoryXAxis;
                tt1[2].YAxis = numericYAxis;
                this.DataChart.Series.Add(tt1[2]);
            }
            else if (checkCenter == checkTCC)
            {
                if (tt1[3] == null)
                {
                    tt1[3] = new SplineSeries();
                }
                tt1[3].MarkerType = MarkerType.None;
                tt1[3].ItemsSource = y3Data;
                tt1[3].Thickness = 5;
                tt1[3].ValueMemberPath = colTCC.ValueMemberPath;
                tt1[3].Brush = new SolidColorBrush(Colors.Red);
                tt1[3].Visibility = Visibility.Visible;
                tt1[3].XAxis = categoryXAxis;
                tt1[3].YAxis = numericYAxis;
                this.DataChart.Series.Add(tt1[3]);
            }
            else
            {
                if (tt1[3] == null)
                {
                    tt1[3] = new SplineSeries();
                }
                tt1[3].MarkerType = MarkerType.None;
                tt1[3].ItemsSource = y3Data;
                tt1[3].Thickness = 5;
                tt1[3].ValueMemberPath = colTCC.ValueMemberPath;
                tt1[3].Brush = new SolidColorBrush(Colors.Red);
                tt1[3].Visibility = Visibility.Visible;
                tt1[3].XAxis = categoryXAxis;
                tt1[3].YAxis = numericYAxis;
                this.DataChart.Series.Add(tt1[3]);

                if (tt1[2] == null)
                {
                    tt1[2] = new SplineSeries();
                }
                tt1[2].MarkerType = MarkerType.None;
                tt1[2].ItemsSource = yData;
                tt1[2].Thickness = 5;
                tt1[2].ValueMemberPath = colGrain.ValueMemberPath;
                tt1[2].Brush = new SolidColorBrush(Colors.LawnGreen);
                tt1[2].Visibility = Visibility.Visible;
                tt1[2].XAxis = categoryXAxis;
                tt1[2].YAxis = numericYAxis;
                this.DataChart.Series.Add(tt1[2]);

                if (tt1[1] == null)
                {
                    tt1[1] = new SplineSeries();
                }
                tt1[1].MarkerType = MarkerType.None;
                tt1[1].ItemsSource = y1Data;
                tt1[1].Thickness = 5;
                tt1[1].ValueMemberPath = colCorn.ValueMemberPath;
                tt1[1].Brush = new SolidColorBrush(Colors.Gray);
                tt1[1].Visibility = Visibility.Visible;
                tt1[1].XAxis = categoryXAxis;
                tt1[1].YAxis = numericYAxis;
                this.DataChart.Series.Add(tt1[1]);

                if (tt1[0] == null)
                {
                    tt1[0] = new SplineSeries();
                }
                tt1[0].MarkerType = MarkerType.None;
                tt1[0].ItemsSource = y2Data;
                tt1[0].Thickness = 5;
                tt1[0].ValueMemberPath = colRice.ValueMemberPath;
                tt1[0].Brush = new SolidColorBrush(Colors.Black);
                tt1[0].Visibility = Visibility.Visible;
                tt1[0].XAxis = categoryXAxis;
                tt1[0].YAxis = numericYAxis;
                this.DataChart.Series.Add(tt1[0]);

            }

        }

        private void CheckBox_UnChecked(object sender, RoutedEventArgs e)
        {
            CheckBox checkCenter = sender as CheckBox;
            checkCenter.IsChecked = false;
            if (check.IsChecked == false)
            {
                if (checkRice.IsChecked == false)
                {
                    if (tt1[0] != null)
                    {
                        tt1[0].Visibility = Visibility.Hidden;
                    }
                }
                if (checkCorn.IsChecked == false)
                {
                    if (tt1[1] != null)
                    {
                        tt1[1].Visibility = Visibility.Hidden;
                    }
                }
                if (checkGrain.IsChecked == false)
                {
                    if (tt1[2] != null)
                    {
                        tt1[2].Visibility = Visibility.Hidden;
                    }
                }
                if (checkTCC.IsChecked == false)
                {
                    if (tt1[3] != null)
                    {
                        tt1[3].Visibility = Visibility.Hidden;
                    }
                }
            }

        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            Button but = sender as Button;
            if (but == butCorn)
            {
                if (colCorn != null && colCorn.Visibility == Visibility.Hidden)
                {
                    colCorn.Visibility = Visibility.Visible;
                }
                else if (colCorn != null && colCorn.Visibility == Visibility.Visible)
                {
                    colCorn.Visibility = Visibility.Hidden;
                }
            }

            if (but == butRice)
            {
                if (colRice != null && colRice.Visibility == Visibility.Hidden)
                {
                    colRice.Visibility = Visibility.Visible;
                }
                else if (colRice != null && colRice.Visibility == Visibility.Visible)
                {
                    colRice.Visibility = Visibility.Hidden;
                }
            }
            if (but == butGrain)
            {
                if (colGrain != null && colGrain.Visibility == Visibility.Hidden)
                {
                    colGrain.Visibility = Visibility.Visible;
                }
                else if (colGrain != null && colGrain.Visibility == Visibility.Visible)
                {
                    colGrain.Visibility = Visibility.Hidden;
                }
            }
            if (but == butTcc)
            {
                if (colTCC != null && colTCC.Visibility == Visibility.Hidden)
                {
                    colTCC.Visibility = Visibility.Visible;
                }
                else if (colTCC != null && colTCC.Visibility == Visibility.Visible)
                {
                    colTCC.Visibility = Visibility.Hidden;
                }
            }
        }

        private void SampleContainer_Loaded(object sender, RoutedEventArgs e)
        {
            categoryXAxis.ItemsSource = Axis;
            colCorn.ItemsSource = y1Data;
            colRice.ItemsSource = y2Data;
            colGrain.ItemsSource = yData;
            colTCC.ItemsSource = y3Data;
        }
    }
    //public class NumericDataSample : NumericDataCollection
    //{
    //    public NumericDataSample()
    //    {
    //        this.Add(new NumericDataPoint { X = 1, Y = 1 });
    //        this.Add(new NumericDataPoint { X = 2, Y = 2 });
    //        this.Add(new NumericDataPoint { X = 3, Y = 6 });
    //        this.Add(new NumericDataPoint { X = 4, Y = 8 });
    //        this.Add(new NumericDataPoint { X = 5, Y = 2 });
    //        this.Add(new NumericDataPoint { X = 6, Y = 6 });
    //        this.Add(new NumericDataPoint { X = 7, Y = 4 });
    //        this.Add(new NumericDataPoint { X = 8, Y = 2 });
    //        this.Add(new NumericDataPoint { X = 9, Y = 1 });

    //        int index = 0;
    //        foreach (NumericDataPoint dataPoint in Items)
    //        {
    //            dataPoint.Index = index++;
    //        }
    //    }
    //}
}