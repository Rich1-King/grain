using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;

namespace DataModel
{
 public abstract class Model:INotifyPropertyChanged
    { 
         private string _xData;
         public string xData 
         {
             get
             {
                 return _xData;
             }
             set
             {
                 if (_xData == value) return;
                 _xData = value;
                 OnPropertyChanged(new PropertyChangedEventArgs("_xData"));
             }
         }
         private double _rData;
         public double rData
         {
             get { return _rData; }
             set
             {
                 if (_rData == value) return;
                 _rData = value;
                 OnPropertyChanged(new PropertyChangedEventArgs("_rData"));
             }
         }
         private string _yData;
         public string yData
         {
             get 
             {
                 return _yData;
             }
             set
             {
                 if (_yData == value) return;
                 _yData = value;
                 OnPropertyChanged(new PropertyChangedEventArgs("_yData"));
             }


         }

         
         private DateTime _checkTime;
         public DateTime checkTime
         {
             get
             {
                 return _checkTime;
             }
             set
             {
                 if (_checkTime == value)
                     return;
                 _checkTime = value;
                 OnPropertyChanged(new PropertyChangedEventArgs("_checkTime"));
             }
         }
    
         private string _shiYanHao;
         public string shiYanHao
         {
             get { return _shiYanHao; }
             set
             {
                 if (_shiYanHao == value) return;
                 _shiYanHao = value;
                 OnPropertyChanged(new PropertyChangedEventArgs("_shiYanHao"));
             }

         }

         private string _canShuHao;
         public string canShuHao
         {
             get { return _canShuHao; }
             set
             {
                 if (_canShuHao == value)
                     return;
                 _canShuHao = value;
                 OnPropertyChanged(new PropertyChangedEventArgs("_canShuHao"));
             }
         }

         private string _canShuName;
         public string canShuName
         {
             get { return _canShuName; }
             set
             {
                 if (_canShuName == value)
                     return;
                 _canShuName = value;
                 OnPropertyChanged(new PropertyChangedEventArgs("_canShuName"));
             }
         }
         private string _xLabel;
         public string xLabel
         {
             get { return _xLabel; }
             set
             {
                 if (_xLabel == value) return;
                 _xLabel = value;
                 OnPropertyChanged(new PropertyChangedEventArgs("_xLabel"));
             }
         }

         private DateTime _startTime;
         public DateTime startTime
         {
             get { return _startTime; }
             set
             {
                 if (_startTime == value)
                     return;
                 _startTime = value;
                 OnPropertyChanged(new PropertyChangedEventArgs("_startTime"));
             }
         }
         private DateTime _endTime;
         public DateTime endTime
         {
             get { return _endTime; }
             set
             {
                 if (_endTime == value)
                     return;
                 _endTime = value;
                 OnPropertyChanged(new PropertyChangedEventArgs("_endTime"));
             }
         }

         private string _startCanShuValue;
         public string startCanShuValue
         {
             get { return _startCanShuValue; }
             set
             {
                 if (_startCanShuValue == value)
                     return;
                 _startCanShuValue = value;
                 OnPropertyChanged(new PropertyChangedEventArgs("_startCanShuValue"));
             }
         }
         private string _endCanShuValue;
         public string endCanShuValue
         {
             get { return _endCanShuValue; }
             set
             {
                 if (_endCanShuValue == value)
                     return;
                 _endCanShuValue = value;
                 OnPropertyChanged(new PropertyChangedEventArgs("_endCanShuValue"));
             }
         }

         private double _high;
         public double high
         {
             get { return _high; }
             set 
             {
                 if (_high == value) return;
                 _high = value;
                 OnPropertyChanged(new PropertyChangedEventArgs("_high"));
             }
         }

         private double _low;
         public double low
         {
             get { return _low; }
             set
             {
                 if (_low == value) return;
                 _low = value;
                 OnPropertyChanged(new PropertyChangedEventArgs("_low"));
             }
         }

         private double _media;
         public double media
         {
             get { return _media; }
             set 
             {
                 if (_media == value)
                     return;
                 _media = value;
                 OnPropertyChanged(new PropertyChangedEventArgs("_media"));
             }
         }
         private double _addToSpeed;
         public double addToSpeed
         {
             get { return _addToSpeed; }
             set
             {
                 if (_addToSpeed == value) return;
                 _addToSpeed = value;
                 OnPropertyChanged(new PropertyChangedEventArgs("_addToSpeed"));
             }
         }
         private double _addToSpeedLow;
         public double addToSpeedLow
         {
             get { return _addToSpeedLow; }
             set 
             {
                 if (_addToSpeedLow == value)
                     return;
                 _addToSpeedLow = value;
                 OnPropertyChanged(new PropertyChangedEventArgs("_addToSpeedLow"));
             }
         }

         private double _addToSpeedHigh;
         public double addToSpeedHigh
         {
             get { return _addToSpeedHigh;}
             set
             {
                 if (_addToSpeedHigh == value)
                     return;
                 _addToSpeedHigh = value;
                 OnPropertyChanged(new PropertyChangedEventArgs("_addToSpeedHigh"));
             }
         }

         private double _predictChaValue;
         public double predictChaValue
         {
             get { return _predictChaValue; }
             set
             {
                 if (_predictChaValue == value)
                     return;
                 _predictChaValue = value;
                 OnPropertyChanged(new PropertyChangedEventArgs("_predictChaValue"));
             }
         }

         public event PropertyChangedEventHandler PropertyChanged;
         public void OnPropertyChanged(PropertyChangedEventArgs propertyChangedEventArgs)
         {
             PropertyChangedEventHandler handler = this.PropertyChanged;
             if (handler != null)
                 handler(this, propertyChangedEventArgs);

         }


    }
}
