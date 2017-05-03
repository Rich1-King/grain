using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace CornPeatsTeXingDataMember
{
    public class DataValue : ObservableModel
    {
      public static int count=1;
      public DataValue() { }
      #region Properties
      private DateTime _date;
      public DateTime date
      {
          get { return _date; }
          set
          {
              if (_date == value) return;
              _date = value;
              OnPropertyChanged("date");
          }
      }
      private double _y;
      public double Y
      {
          get { return _y; }
          set
          {
              if (_y == value) return;
              _y = value;
              OnPropertyChanged("Y");
          }
      }
      private string _yLable;
      public string yLable
      {
          get { return _yLable; }
          set
          {
              if (_yLable == value) return;
              _yLable = value;
              OnPropertyChanged("yLable");
          }
      }

      private int _index;
      public int index
      {
          get { return _index; }
          set
          {
              if (_index == value) return;
              _index = value;
              OnPropertyChanged("Index");
          }
      }
      #endregion

      private double _peatsMiDu;
      public double PeatsMiDu
      {
          get { return _peatsMiDu; }
          set 
          {
              if (_peatsMiDu == value) return;
              _peatsMiDu = value;
              OnPropertyChanged("PeatsMiDu");
          }
      }

      private double _water;
      public double Water
      {
          get { return _water; }
          set
          {
              if (_water == value) return;
              _water = value;
              OnPropertyChanged("Water");
          }
      }
      private  DateTime _startTime;
      public DateTime StartTime
        {
            get { return _startTime; }
            set
            {
                if (_startTime == value) return;
                _startTime= value;
                OnPropertyChanged("StartTime");
            }
        }

      private DateTime _endTime;
      public DateTime EndTime
        {
            get { return _endTime; }
            set
            {
                if (_endTime == value) return;
                _endTime = value;
                OnPropertyChanged("EndTime");
            }
        }

      private double _predictData;
      public double PredictData
      {
          get { return _predictData; }
          set
          {
              if (_predictData == value) return;
              _predictData = value;
              OnPropertyChanged("PredictData");
          }
      }
      private double _media;
      public double Media
      {
          get { return _media; }
          set
          {
              if (_media == value) return;
              _media = value;
              OnPropertyChanged("Media");
          }
      }
      private double _high;
      public double High
      {
          get { return _high; }
          set
          {
              if (_high == value) return;
              _high = value;
              OnPropertyChanged("High");
          }
      }
      private double _low;
      public double Low
      {
          get { return _low; }
          set
          {
              if (_low == value) return;
              _low = value;
              OnPropertyChanged("Low");
          }
      }
      private string _inTemp;
      public string InTemp
      {
          get { return _inTemp; }
          set
          {
              if (_inTemp == value) return;
              _inTemp = value;
              OnPropertyChanged("InTemp");
          }
      }
      private double _chaValue;
      public double ChaValue
      {
          get { return _chaValue; }
          set
          {
              if (_chaValue == value) return;
              _chaValue= value;
              OnPropertyChanged("ChaValue");
          }
      }

      private double _speedData;
      public double SpeedData
      {
          get { return _speedData; }
          set
          {
              if (_speedData == value) return;
              _speedData = value;
              OnPropertyChanged("SpeedData");
          }
      }

      private double _grainTemp;
      public double GrainTemp
      {
          get { return _grainTemp; }
          set
          {
              if (_grainTemp == value) return;
              _grainTemp = value;
              OnPropertyChanged("GrainTemp");
          }
      }

      private String _canShuNumber;
      public String CanShuNumber
      {
          get { return _canShuNumber; }
          set 
          { 
              if (_canShuNumber == value)return;
             _canShuNumber = value;
             OnPropertyChanged("CanShuNumber");
          }
      }

    }
}
