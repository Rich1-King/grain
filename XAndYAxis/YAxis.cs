using Infragistics.Controls.Charts;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace XAndYAxis
{
   public class YAxis
    {
        public YAxis()
        { }
        public NumericYAxis initNumericYAxis(double min, double max, double interval)
        {
            NumericYAxis numericYAxis = new NumericYAxis();
            numericYAxis.MinimumValue = Math.Round(min,4);
            numericYAxis.MaximumValue = Math.Round(max,4);
            numericYAxis.Interval = Math.Round(interval,0);

            return numericYAxis;
        }
    }
}
