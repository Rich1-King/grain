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


namespace WindAnaylisisSysytem
{

  
    /// <summary>
    /// AppWindow.xaml 的交互逻辑
    /// </summary>
    public partial class AppWindow : Window
    {
        public static List<Frame> listFrame = new List<Frame>();
        public static Grid mainGrid;
        public static Frame mainFrame;

        public AppWindow()
        {
            InitializeComponent();
        }

        private void main_Loaded(object sender, RoutedEventArgs e)
        {
            mainGrid = this.main;
            Frame frame = new Frame();
            frame.Source = new Uri("pack://application:,,,/AppBegin.xaml");

            if (this.main.Children.Count>0)
            {
                this.main.Children.Clear();
            }
            this.main.Children.Add(frame);
        }
        //int i=2;
        private void back_Click(object sender, RoutedEventArgs e)
        {
            Frame frame = new Frame();
            frame.Source = new Uri("pack://application:,,,/AppBegin.xaml");

            if (this.main.Children.Count > 0)
            {
                this.main.Children.Clear();
            }
            this.main.Children.Add(frame);
            
        }

        private void Window_MouseLeftButtonDown(object sender, MouseButtonEventArgs e)
        {
            try
            {
                this.DragMove();
            }
            catch (Exception)
            {
                MessageBox.Show("没有按下鼠标!");
            }
        }
        private void ButShutDown_Click(object sender, RoutedEventArgs e)
        {
            if (this != null)
            {
                this.Close();
            }
        }

        private void ButReziseSmall_Click(object sender, RoutedEventArgs e)
        {
            this.WindowState = WindowState.Minimized;
        }

        private void ButResizeBig_Click(object sender, RoutedEventArgs e)
        {
            if (this.WindowState == WindowState.Maximized)
            {
                this.WindowState = WindowState.Normal;
            }
            else if (this.WindowState == WindowState.Normal)
            {
                this.WindowState = WindowState.Maximized;
            }
        }
    }
}
