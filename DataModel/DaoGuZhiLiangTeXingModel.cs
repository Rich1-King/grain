using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;

namespace DataModel
{
  public class DaoGuZhiLiangTeXingModel:Model
    {
      private string _water;
      public string water
      {
          get { return _water; }
          set
          {
              if (_water == value)
                  return;
              _water = value;
              OnPropertyChanged(new PropertyChangedEventArgs("_water"));
          }
      }
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
    }
}
