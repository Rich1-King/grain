using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;

namespace DataModel
{
  public class TitleModel :Model
    {
      public TitleModel()
      { 
      }
        #region
        private string _title;
        public string Title
        {
            get { return _title; }
            set
            {
                if (_title == value) return;
                _title = value;
                OnPropertyChanged(new PropertyChangedEventArgs("_title"));  
            }
        }

        private string _titleSpeed;
        public string TitleSpeed
        {
            get { return _titleSpeed; }
            set
            {
                if (_titleSpeed == value) return;
                _titleSpeed = value;
                OnPropertyChanged(new PropertyChangedEventArgs("_titleSpeed"));
            }
        }
        private string _xLabel;
        public string XLabel
        {
            get { return _xLabel; }
            set
            {
                if (_xLabel == value) return;
                _xLabel = value;
                OnPropertyChanged(new PropertyChangedEventArgs("_xLabel"));
            }
        }

        private string _yLabel;
        public string YLabel
        {
            get { return _yLabel; }
            set 
            {
                if (_yLabel == value) return;
                _yLabel = value;
                OnPropertyChanged(new PropertyChangedEventArgs("_yLabel"));
            }
        }

        private string _yLabelSpeed;
        public string YLabelSpeed
        {
            get { return _yLabelSpeed; }
            set
            {
                if (_yLabelSpeed == value)
                    return;
                _yLabelSpeed = value;
                OnPropertyChanged(new PropertyChangedEventArgs("_yLabelSpeed"));
            }
        }

        private string _shiYanHao;

        public string ShiYanHao
        {
            get { return _shiYanHao; }
            set 
            {
                if (_shiYanHao == value) return;
                _shiYanHao = value;
                OnPropertyChanged(new PropertyChangedEventArgs("_shiYanHao"));
            }
        }
        #endregion

        private string _chartMiaoShu;
        public string chartMiaoShu
        {
            get { return _chartMiaoShu; }
            set
            {
                if (_chartMiaoShu == value) return;
                _chartMiaoShu = value;
                OnPropertyChanged(new PropertyChangedEventArgs("_chartMiaoShu"));
            }
        }

        private string _chartSpeedMiaoShu;
        public string chartSpeedMiaoShu
        {
            get { return _chartSpeedMiaoShu; }
            set
            {
                if (_chartSpeedMiaoShu == value) return;
                _chartSpeedMiaoShu = value;
                OnPropertyChanged(new PropertyChangedEventArgs("_chartSpeedMiaoShu"));
            }
        }
       

      
    }
}
