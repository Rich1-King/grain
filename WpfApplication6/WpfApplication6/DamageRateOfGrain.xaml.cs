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

namespace WpfApplication6
{
    /// <summary>
    /// DamageRateOfGrain.xaml 的交互逻辑
    /// </summary>
    public partial class DamageRateOfGrain : Window
    {
        public DamageRateOfGrain()
        {
            InitializeComponent();
        }

        private void TabItem_PreviewMouseLeftButtonUp(object sender, MouseButtonEventArgs e)
        {
            
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            Frame frame = new Frame();
            frame.Source = new Uri("pack://application:,,,/MainWindow.xaml");
            page.Children.Add(frame);
        }

        private void button2_Click(object sender, RoutedEventArgs e)
        {

        }
    }
}
