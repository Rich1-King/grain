using System.Collections.Generic;
using System.Windows;
using System.Windows.Media;

namespace CornPeatsTeXingScatterDiagram.Behaviors
{
    public class ChartBehaviors : DependencyObject
    {

    }
    public static class ChartExtension
    {
        public static IEnumerable<DependencyObject> VisualDescendants(this DependencyObject current)
        {
            yield return current;
            for (int i = 0; i < VisualTreeHelper.GetChildrenCount(current); i++)
            {
                DependencyObject child = VisualTreeHelper.GetChild(current, i);
                foreach (DependencyObject sub in child.VisualDescendants())
                {
                    yield return sub;
                }
            }
        }
    }
}