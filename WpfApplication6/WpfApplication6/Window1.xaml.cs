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
using System.Windows.Media.Effects;

namespace WpfApplication6
{
    /// <summary>
    /// Window1.xaml 的交互逻辑
    /// </summary>
    public partial class Window1 : Window
    {
        private string insectname;
        private Brush color;
        private string name = "";
        private Brush brush;
        public Window1()
        {
            InitializeComponent();


            color = lab1.Background;
            List<string> list = InsectData.getInsect();
            insectname = list[1];
            List<Insect> insects = new List<Insect>();
            for (int i = 0; i < list.Count; i++)
            {
                Insect insect = new Insect();
                insect.Id = i.ToString();
                insect.Name = list[i];
                insects.Add(insect);
            }
            combobox1.ItemsSource = insects;
            combobox1.DisplayMemberPath = "Name";
            combobox1.SelectedValuePath = "Id";
            combobox1.Visibility = Visibility.Hidden;
            combobox2.ItemsSource = insects;
            combobox2.DisplayMemberPath = "Name";
            combobox2.SelectedValuePath = "Id";
            combobox2.Visibility = Visibility.Hidden;
            brush = new SolidColorBrush(Color.FromArgb(225, 68, 87, 84));
            grid1.Visibility = Visibility.Visible;
            grid2.Visibility = Visibility.Hidden;
            grid3.Visibility = Visibility.Hidden;
            combobox1.Visibility = Visibility.Hidden;
            combobox2.Visibility = Visibility.Hidden;

            this.lab1.Background = brush;
            //label.Foreground = Brushes.Black;
            frame1.Source = new Uri("pack://application:,,,/MainWindow.xaml");
            frame1.Refresh();
        }

        public class Insect
        {

            public String Id { set; get; }

            public String Name { set; get; }
        }
        private void lab_PreviewMouseLeftButtonDown(object sender, MouseButtonEventArgs e)
        {
            Label label = sender as Label;
            if (name.Length <= 0)
            {
                //if (label == lab1)
                //{
                //    grid1.Visibility = Visibility.Visible;
                //    grid2.Visibility = Visibility.Hidden;
                //    grid3.Visibility = Visibility.Hidden;
                //    combobox1.Visibility = Visibility.Hidden;
                //    combobox2.Visibility = Visibility.Hidden;

                //   label.Background = brush;
                //   //label.Foreground = Brushes.Black;
                //    frame1.Source= new Uri("pack://application:,,,/MainWindow.xaml");
                //    frame1.Refresh();
                //}
                if (label == lab2)
                {
                    grid1.Visibility = Visibility.Hidden;
                    grid2.Visibility = Visibility.Visible;
                    grid3.Visibility = Visibility.Hidden;
                    combobox1.Visibility = Visibility.Visible;
                    combobox2.Visibility = Visibility.Hidden;
                    label.Background = brush;
                    // label.Background = null;
                    label.Foreground = Brushes.Black;
                    this.lab1.Background = color;
                    if (combobox1isclick == false)
                    {
                        this.combobox1.Text = insectname;
                        InsectData.setInsect(insectname);
                        frame2.Source = new Uri("pack://application:,,,/Editing/ChartScrollIntoView.xaml");
                        frame2.Refresh();
                    }
                }
                if (label == lab3)
                {
                    grid1.Visibility = Visibility.Hidden;
                    grid2.Visibility = Visibility.Hidden;
                    grid3.Visibility = Visibility.Visible;
                    combobox1.Visibility = Visibility.Hidden;
                    combobox2.Visibility = Visibility.Visible;
                    label.Foreground = Brushes.Black;
                    label.Background = brush;
                    this.lab1.Background = color;
                    if (combobox2isclick == false)
                    {
                        this.combobox2.Text = insectname;
                        InsectData.setInsect(insectname);
                        frame3.Source = new Uri("pack://application:,,,/series/ValueOverlays.xaml");
                        frame3.Refresh();
                    }
                }
            }
            else if (label.Name == name)
            {
                return;
            }
            else
            {
                if (lab1.Name == name)
                {
                    lab1.Background = color;
                    lab1.Foreground = Brushes.White;
                }
                if (lab2.Name == name)
                {
                    lab2.Background = color;
                    lab2.Foreground = Brushes.White;
                }
                if (lab3.Name == name)
                {
                    lab3.Background = color;
                    lab3.Foreground = Brushes.White;
                }
                if (label == lab1)
                {
                    grid1.Visibility = Visibility.Visible;
                    grid2.Visibility = Visibility.Hidden;
                    grid3.Visibility = Visibility.Hidden;
                    combobox1.Visibility = Visibility.Hidden;
                    combobox2.Visibility = Visibility.Hidden;
                    label.Background = brush;
                    label.Foreground = Brushes.Black;
                    frame1.Source = new Uri("pack://application:,,,/MainWindow.xaml");
                    frame1.Refresh();
                }
                if (label == lab2)
                {
                    grid1.Visibility = Visibility.Hidden;
                    grid2.Visibility = Visibility.Visible;
                    grid3.Visibility = Visibility.Hidden;
                    combobox1.Visibility = Visibility.Visible;
                    combobox2.Visibility = Visibility.Hidden;
                    label.Background = brush;
                    label.Foreground = Brushes.Black;
                    if (combobox1isclick == false)
                    {
                        this.combobox1.Text = insectname;
                        InsectData.setInsect(insectname);
                        frame2.Source = new Uri("pack://application:,,,/Editing/ChartScrollIntoView.xaml");
                        frame2.Refresh();
                    }
                }
                if (label == lab3)
                {
                    grid1.Visibility = Visibility.Hidden;
                    grid2.Visibility = Visibility.Hidden;
                    grid3.Visibility = Visibility.Visible;
                    combobox1.Visibility = Visibility.Hidden;
                    combobox2.Visibility = Visibility.Visible;
                    label.Background = brush;
                    label.Foreground = Brushes.Black;

                    if (combobox2isclick == false)
                    {
                        this.combobox2.Text = insectname;
                        InsectData.setInsect(insectname);
                        frame3.Source = new Uri("pack://application:,,,/series/ValueOverlays.xaml");
                        frame3.Refresh();
                    }
                }

            }
            name = label.Name;
        }
        private bool combobox1isclick = false;
        private bool combobox2isclick = false;
        private void combobox_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            ComboBox combobox = sender as ComboBox;
            if (combobox.SelectedIndex != -1 && combobox == combobox1)
            {
                combobox1isclick = true;
                Insect insect = (Insect)combobox.SelectedItem;
                InsectData.setInsect(insect.Name);
                frame2.Source = new Uri("pack://application:,,,/Editing/ChartScrollIntoView.xaml");
                frame2.Refresh();
            }
            if (combobox.SelectedIndex != -1 && combobox == combobox2)
            {
                combobox2isclick = true;
                Insect insect = (Insect)combobox.SelectedItem;
                InsectData.setInsect(insect.Name);
                frame3.Source = new Uri("pack://application:,,,/series/ValueOverlays.xaml");
                frame3.Refresh();
            }
        }

        private void lab1_MouseEnter(object sender, MouseEventArgs e)
        {
            Label label = sender as Label;
            if (name != label.Name)
            {
                label.Background = brush;

            }
        }

        private void lab1_MouseLeave(object sender, MouseEventArgs e)
        {
            Label label = sender as Label;
            if (name != label.Name)
            {

                label.Background = color;
                label.Foreground = Brushes.White;
            }
        }
        private void combobox_MouseEnter(object sender, MouseEventArgs e)
        {
            ComboBox combobox = sender as ComboBox;
            combobox.Background = Brushes.Turquoise;
            combobox.Foreground = Brushes.Black;
        }
        private void combobox_MouseLeave(object sender, MouseEventArgs e)
        {
            ComboBox combobox = sender as ComboBox;
            combobox.Background = color;
            combobox.Foreground = Brushes.White;
        }
        private void combobox_Loaded(object sender, RoutedEventArgs e)
        {
            //ComboBox combobox = sender as ComboBox;
            // combobox.Text = "请选择头数：";
        }

        //private void TabControl_SelectionChanged(object sender, SelectionChangedEventArgs e)
        //{
        //    Frame frame = new Frame();
        //    if (tabcontrol.SelectedIndex == 0)
        //    {

        //        frame.Source = new Uri("pack://application:,,,/MainWindow.xaml");
        //        grid1.Children.Add(frame);
        //        frame.Refresh();
        //    }
        //    if (tabcontrol.SelectedIndex == 1)
        //    {

        //        frame.Source = new Uri("pack://application:,,,/Editing/ChartScrollIntoView.xaml");
        //        grid2.Children.Add(frame);
        //        frame.Refresh();
        //    }
        //}

        //private void TabControl_Loaded(object sender, RoutedEventArgs e)
        //{
        //    tabcontrol.SelectedIndex = 0;
        //    if (tabcontrol.SelectedIndex == 0)
        //    {
        //        Frame frame = new Frame();
        //        frame.Source = new Uri("pack://application:,,,/MainWindow.xaml");
        //        grid1.Children.Add(frame);
        //        frame.Refresh();
        //    }
        //}

        //private void TabItem_MouseDown(object sender, MouseButtonEventArgs e)
        //{

        //    frame2.Refresh();
        //    frame1.Source = new Uri("pack://application:,,,/MainWindow.xaml");
        //    frame1.Refresh();
        //}

        //private void TabItem_MouseDown_1(object sender, MouseButtonEventArgs e)
        //{
        //    frame2.Refresh();
        //    frame2.Source = new Uri("pack://application:,,,/Editing/ChartScrollIntoView.xaml");
        //    frame2.Refresh();
        //}

        //private void TabItem_MouseDown_2(object sender, MouseButtonEventArgs e)
        //{

        //}

        //private void Window_Loaded(object sender, RoutedEventArgs e)
        //{

        //}

        //private void button1_Click(object sender, RoutedEventArgs e)
        //{

        //    InsectData.setInsect(textBox1.Text.ToString());
        //    frame.Source = new Uri("pack://application:,,,/Editing/ChartScrollIntoView.xaml");
        //    frame.Refresh();
        //}

    }
}
