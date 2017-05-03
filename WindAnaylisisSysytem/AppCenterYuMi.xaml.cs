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
    /// AppCenter.xaml 的交互逻辑
    /// </summary>
    public partial class AppCenterYuMi : Page
    {
        public AppCenterYuMi()
        {
            InitializeComponent();
        }

        private void miaoshu_Clik(object sender, RoutedEventArgs e)
        {
            try
            {
                miaoshu.Text = MiaoShu.CoreMessage.TuPianMiaoShu[0];
            }
            catch (Exception)
            { }
        }
    }
}
