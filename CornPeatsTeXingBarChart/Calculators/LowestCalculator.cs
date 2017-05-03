using System.Collections.Generic;
using Infragistics.Math.Calculators;

namespace CornPeatsTeXingBarChart.Calculators
{
    public class LowestCalculator : ValueCalculator
    {

        public LowestCalculator() { }
        /// <summary>
        /// Calculates the lowest value in the specified input.
        /// </summary>
        /// <param name="input">The input list of double values.</param>
        /// <returns></returns>
        public override double Calculate(IList<double> input)
        {
            if (input == null || input.Count == 0)
            {
                return double.NaN;
            }

            double lowest = double.PositiveInfinity;
            foreach (double value in input)
            {
                lowest = System.Math.Min(lowest, value);
            }
            return lowest;
        }
    }
}