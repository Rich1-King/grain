using Infragistics.Controls.Charts;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DataModel;
using System.Windows;

namespace XAndYAxis
{
   public class XAxis
    {
        public XAxis()
        { }

        public CategoryXAxis initCategoryXAxis(List<Model> model,double interval)
        {
            CategoryXAxis categoryXAxis = new CategoryXAxis();
            categoryXAxis.ItemsSource = model;
            categoryXAxis.Interval = interval;
            categoryXAxis.Label = "{xData:0}";
          
            return categoryXAxis;
        }

        public NumericXAxis initNumericXAxis(double min, double max, double interval)
        {
            NumericXAxis numericXAxis = new NumericXAxis();

            numericXAxis.MinimumValue = Math.Round(min,2);
            numericXAxis.MaximumValue = Math.Round(max,2);
            numericXAxis.Interval = interval;
          //  numericXAxis.IsInverted = true;
            return numericXAxis;
        }
    }
}
