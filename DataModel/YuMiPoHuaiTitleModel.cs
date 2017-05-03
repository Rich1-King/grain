using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;

namespace DataModel
{
   public class YuMiPoHuaiTitleModel :TitleModel
    {

        #region
        private string _temTitle;
        public string temTitle
        {
            get { return _temTitle; }
            set
            {
                if (_temTitle == value) return;
                _temTitle = value;
                OnPropertyChanged(new PropertyChangedEventArgs("_temTitle"));
            }
        }

        private string _poHuaiLvTitle;
        public string poHuaiLvTitle
        {
            get { return _poHuaiLvTitle; }
            set
            {
                if (_poHuaiLvTitle == value) return;
                _poHuaiLvTitle = value;
                OnPropertyChanged(new PropertyChangedEventArgs("_poHuaiLvTitle"));
            }
        }

        private string _temTitleSpeed;
        public string temTitleSpeed
        {
            get { return _temTitleSpeed; }
            set
            {
                if (_temTitleSpeed == value) return;
                _temTitleSpeed = value;
                OnPropertyChanged(new PropertyChangedEventArgs("_temTitleSpeed"));
            }
        }

        private string _poHuaiLvTitleSpeed;
        public string poHuaiLvTitleSpeed
        {
            get { return _poHuaiLvTitleSpeed; }
            set
            {
                if (_poHuaiLvTitleSpeed == value) return;
                _poHuaiLvTitleSpeed = value;
                OnPropertyChanged(new PropertyChangedEventArgs("_poHuaiLvTitleSpeed"));
            }
        }


        private string _temLabel;
        public string temLabel
        {
            get { return _temLabel; }
            set
            {
                if (_temLabel == value) return;
                _temLabel = value;
                OnPropertyChanged(new PropertyChangedEventArgs("_temLabel"));
            }
        }

        private string _poHuaiLvLabel;
        public string poHuaiLvLabel
        {
            get { return _poHuaiLvLabel; }
            set
            {
                if (_poHuaiLvLabel == value) return;
                _poHuaiLvLabel = value;
                OnPropertyChanged(new PropertyChangedEventArgs("_poHuaiLvLabel"));
            }
        }

        private string _temLabelSpeed;
        public string temLabelSpeed
        {
            get { return _temLabelSpeed; }
            set
            {
                if (_temLabelSpeed == value)
                    return;
                _temLabelSpeed = value;
                OnPropertyChanged(new PropertyChangedEventArgs("_temLabelSpeed"));
            }
        }

        private string _poHuaiLvLabelSpeed;
        public string poHuaiLvLabelSpeed
        {
            get { return _poHuaiLvLabelSpeed; }
            set
            {
                if (_poHuaiLvLabelSpeed == value)
                    return;
                _poHuaiLvLabelSpeed = value;
                OnPropertyChanged(new PropertyChangedEventArgs("_poHuaiLvLabelSpeed"));
            }
        }

        #endregion

        private string _temChartMiaoShu;
        public string temChartMiaoShu
        {
            get { return _temChartMiaoShu; }
            set
            {
                if (_temChartMiaoShu == value) return;
                _temChartMiaoShu = value;
                OnPropertyChanged(new PropertyChangedEventArgs("_temChartMiaoShu"));
            }
        }

        private string _poHuaiLvChartMiaoShu;
        public string poHuaiLvChartMiaoShu
        {
            get { return _poHuaiLvChartMiaoShu; }
            set
            {
                if (_poHuaiLvChartMiaoShu == value) return;
                _poHuaiLvChartMiaoShu = value;
                OnPropertyChanged(new PropertyChangedEventArgs("_poHuaiLvChartMiaoShu"));
            }
        }

        private string _temChartSpeedMiaoShu;
        public string temChartSpeedMiaoShu
        {
            get { return _temChartSpeedMiaoShu; }
            set
            {
                if (_temChartSpeedMiaoShu == value) return;
                _temChartSpeedMiaoShu = value;
                OnPropertyChanged(new PropertyChangedEventArgs("_temChartSpeedMiaoShu"));
            }
        }

        private string _poHuaiLvChartSpeedMiaoShu;
        public string poHuaiLvChartSpeedMiaoShu
        {
            get { return _poHuaiLvChartSpeedMiaoShu; }
            set
            {
                if (_poHuaiLvChartSpeedMiaoShu == value) return;
                _poHuaiLvChartSpeedMiaoShu = value;
                OnPropertyChanged(new PropertyChangedEventArgs("_poHuaiLvChartSpeedMiaoShu"));
            }
        }

    }
}
