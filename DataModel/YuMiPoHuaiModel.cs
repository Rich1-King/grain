using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;

namespace DataModel
{
   public class YuMiPoHuaiModel:Model
    {
        private string _tem;
        public string tem
        {
            get { return _tem; }
            set
            {
                if (_tem == value)
                    return;
                _tem = value;
                OnPropertyChanged(new PropertyChangedEventArgs("_tem"));
            }
        }

        private double _temAddToSpeed;
        public double temAddToSpeed
        {
            get { return _temAddToSpeed; }
            set
            {
                if (_temAddToSpeed == value)
                    return;
                _temAddToSpeed = value;
                OnPropertyChanged(new PropertyChangedEventArgs("_temAddToSpeed"));
            }
        }

        private double _temHigh;
        public double temHigh
        {
            get { return _temHigh; }
            set
            {
                if (_temHigh == value)
                    return;
                _temHigh = value;
                OnPropertyChanged(new PropertyChangedEventArgs("_temHigh"));
            }
        }

        private double _temLow;
        public double temLow
        {
            get { return _temLow; }
            set
            {
                if (_temLow == value)
                    return;
                _temLow = value;
                OnPropertyChanged(new PropertyChangedEventArgs("_temLow"));
            }
        }

        private double _temMedia;
        public double temMedia
        {
            get { return _temMedia; }
            set
            {
                if (_temMedia == value)
                    return;
                _temMedia = value;
                OnPropertyChanged(new PropertyChangedEventArgs("_temMedia"));
            }
        }

        private double _temAddToSpeedHigh;
        public double temAddToSpeedHigh
        {
            get { return _temAddToSpeedHigh; }
            set
            {
                if (_temAddToSpeedHigh == value)
                    return;
                _temAddToSpeedHigh = value;
                OnPropertyChanged(new PropertyChangedEventArgs("_temAddToSpeedHigh"));
            }
        }

        private double _temAddToSpeedLow;
        public double temAddToSpeedLow
        {
            get { return _temAddToSpeedLow; }
            set 
            {
                if (_temAddToSpeedLow == value) return;

                _temAddToSpeedLow = value;

                OnPropertyChanged(new PropertyChangedEventArgs("_temAddToSpeedLow"));
            }
        }

        private string _poHuaiLv;

        public string poHuaiLv
        {
            get { return _poHuaiLv; }
            set
            {
                if (_poHuaiLv == value) return;
                _poHuaiLv = value;
                OnPropertyChanged(new PropertyChangedEventArgs("_poHuaiLv"));
            }
        }


        private double _poHuaiLvAddToSpeed;
        public double poHuaiLvAddToSpeed
        {
            get { return _poHuaiLvAddToSpeed; }
            set
            {
                if (_poHuaiLvAddToSpeed == value)
                    return;
                _poHuaiLvAddToSpeed = value;
                OnPropertyChanged(new PropertyChangedEventArgs("_poHuaiLvAddToSpeed"));
            }
        }


        private double _poHuaiLvHigh;
        public double poHuaiLvHigh
        {
            get { return _poHuaiLvHigh; }
            set
            {
                if (_poHuaiLvHigh == value)
                    return;
                _poHuaiLvHigh = value;
                OnPropertyChanged(new PropertyChangedEventArgs("_poHuaiLvHigh"));
            }
        }

        private double _poHuaiLvLow;
        public double poHuaiLvLow
        {
            get { return _poHuaiLvLow; }
            set
            {
                if (_poHuaiLvLow == value)
                    return;
                _poHuaiLvLow = value;
                OnPropertyChanged(new PropertyChangedEventArgs("_poHuaiLvLow"));
            }
        }

        private double _poHuaiLvMedia;
        public double poHuaiLvMedia
        {
            get { return _poHuaiLvMedia; }
            set
            {
                if (_poHuaiLvMedia == value)
                    return;
                _poHuaiLvMedia = value;
                OnPropertyChanged(new PropertyChangedEventArgs("_poHuaiLvMedia"));
            }
        }

        private double _poHuaiLvAddToSpeedHigh;
        public double poHuaiLvAddToSpeedHigh
        {
            get { return _poHuaiLvAddToSpeedHigh; }
            set
            {
                if (_poHuaiLvAddToSpeedHigh == value)
                    return;
                _poHuaiLvAddToSpeedHigh = value;
                OnPropertyChanged(new PropertyChangedEventArgs("_poHuaiLvAddToSpeedHigh"));
            }
        }

        private double _poHuaiLvAddToSpeedLow;
        public double poHuaiLvAddToSpeedLow
        {
            get { return _poHuaiLvAddToSpeedLow; }
            set
            {
                if (_poHuaiLvAddToSpeedLow == value) return;

                _poHuaiLvAddToSpeedLow = value;

                OnPropertyChanged(new PropertyChangedEventArgs("_poHuaiLvAddToSpeedLow"));
            }
        }


        private int _cengShuNumber;
        public int cengShuNumber
        {
            get { return _cengShuNumber; }
            set 
            {
                if (_cengShuNumber == value) return;
                _cengShuNumber = value;
                OnPropertyChanged(new PropertyChangedEventArgs("_cengShuNumber"));
            }
        }

        private int _diDianNumber;

        public int diDianNumber
        {
            get { return _diDianNumber; }
            set 
            {
                if (_diDianNumber == value) return;
                _diDianNumber = value;
                OnPropertyChanged(new PropertyChangedEventArgs("_diDianNumber"));
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

        private string _temSpeedLabel;
        public string temSpeedLabel
        {
            get { return _temSpeedLabel; }
            set
            {
                if (_temSpeedLabel == value) return;
                _temSpeedLabel = value;
                OnPropertyChanged(new PropertyChangedEventArgs("_temSpeedLabel"));
            }
        }

        private string _poHuaiLvSpeedLabel;
        public string poHuaiLvSpeedLabel
        {
            get { return _poHuaiLvSpeedLabel; }
            set
            {
                if (_poHuaiLvSpeedLabel == value) return;
                _poHuaiLvSpeedLabel = value;
                OnPropertyChanged(new PropertyChangedEventArgs("_poHuaiLvSpeedLabel"));
            }
        }
        
   }
}
