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
using System.Windows.Navigation;
using System.Windows.Shapes;
using DataMember;

namespace WindAnaylisisSysytem
{
    /// <summary>
    /// AppBegin.xaml 的交互逻辑
    /// </summary>
    public partial class AppBegin : Page
    {
        public AppBegin()
        {    
            InitializeComponent();
        }

        private void Button_MouseEnter(object sender, MouseEventArgs e)
        {
            Button but = sender as Button;
            corn.Background = new SolidColorBrush(Colors.White);
            rice.Background = new SolidColorBrush(Colors.White);
            wheate.Background = new SolidColorBrush(Colors.White);
            but.Background = new SolidColorBrush(Colors.Gray);
            jieshi.Text = null;
            if (but == wheate)
            {

                try
                {
                    jieshi.Text = MiaoShu.WheateMessage.TypeMiaoShu;
                    TitleName.Content = "小麦特性参数智能数字化数据平台";
                }
                catch (Exception)
                {
                    
                }
             
                Frame frame = new Frame();
                frame.Source = new Uri("pack://application:,,,/AppCenterXiaoMai.xaml");

                if (mainDisplay.Children.Count > 0)
                {
                    mainDisplay.Children.Clear();
                }
                mainDisplay.Children.Add(frame);
            }
            else if(but == rice)
            {
                try
                {
                    jieshi.Text = MiaoShu.RiceMessage.TypeMiaoShu;
                    TitleName.Content = "稻谷特性参数智能数字化数据平台";
                }
                catch (Exception)
                { }
               
                Frame frame = new Frame();
                frame.Source = new Uri("pack://application:,,,/AppCenterShuiDao.xaml");

                if (mainDisplay.Children.Count > 0)
                {
                    mainDisplay.Children.Clear();
                }
                mainDisplay.Children.Add(frame);
            }
            else if (but == corn)
            {
                try
                {
                    jieshi.Text = MiaoShu.CoreMessage.TypeMiaoShu;
                    TitleName.Content = "玉米特性参数智能数字化数据平台";
                }
                catch (Exception)
                { }

             
                Frame frame = new Frame();
                frame.Source = new Uri("pack://application:,,,/AppCenterYuMi.xaml");

                if (mainDisplay.Children.Count > 0)
                {
                    mainDisplay.Children.Clear();
                }
                mainDisplay.Children.Add(frame);
            }

        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            Button but = sender as Button;
            Frame frame = new Frame();

            if (but == wheate)
            {
                frame.Source = new Uri("pack://application:,,,/wheateWindow;component/wheateMainPage.xaml");
               
            }
            else if (but == rice)
            {
                frame.Source = new Uri("pack://application:,,,/DaoGuWindow;component/DaoGuMainPage.xaml");
              
            }
            else if (but == corn)
            { 
                frame.Source = new Uri("pack://application:,,,/YuMiWindow;component/YuMiMainPage.xaml");
                
            }

            AppWindow.listFrame.Add(frame);

            if (mainGrid.Children.Count > 0)
            {
                mainGrid.Children.Clear();
            }
            mainGrid.Children.Add(frame);
        }

        private void mainDisplay_Load(object sender, EventArgs e)
        {

            try
            {
                new MiaoShu();//初始化描述数据     
                jieshi.Text = MiaoShu.WheateMessage.TypeMiaoShu;
                TitleName.Content = "小麦特性参数智能数字化数据平台";
            }
            catch (Exception e1)
            {
                MessageBox.Show(e1.Message); 
            }
          
            wheate.Background = new SolidColorBrush(Colors.Gray);
            Frame frame = new Frame();
            frame.Source = new Uri("pack://application:,,,/AppCenterXiaoMai.xaml");

            if (mainDisplay.Children.Count > 0)
            {
                mainDisplay.Children.Clear();
            }
            mainDisplay.Children.Add(frame);
        }
      
    }
}
