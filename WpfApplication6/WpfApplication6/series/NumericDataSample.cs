using System;
using System.Collections.ObjectModel;
using System.Collections.Generic;


namespace WpfApplication6.series
{
    public class NumericDataSample : NumericDataCollection
    {
        public NumericDataSample()
        {
            List<int> list = InsectData.getDate();
            string name = InsectData.getName();
            List<double> values = InsectData.getData(name);
            for (int i = 0; i < list.Count; i++)
            {
                NumericDataPoint ndp = new NumericDataPoint();
                ndp.X=list[i];
                ndp.Y=values[i];
                this.Add(ndp);
            }
                
            int index = 0;
            foreach (NumericDataPoint dataPoint in Items)
            {
                dataPoint.Index = index++;
            }
        }
    }
    public class NumericDataCollection : ObservableCollection<NumericDataPoint>
    {

    }
    public class NumericDataPoint : DataPoint
    {
        #region Properties
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

        private double _x;
        public double X
        {
            get { return _x; }
            set
            {
                if (_x == value) return;
                _x = value;
                OnPropertyChanged("X");
            }
        }

        #endregion

        public new string ToString()
        {
            return String.Format("Index {0}, X {1}, Y {2}", Index, X, Y);
        }
    }
}