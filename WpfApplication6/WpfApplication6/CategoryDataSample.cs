using System;
using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Collections.Generic;

namespace WpfApplication6
{
    public class CategoryDataSample : CategoryDataCollection
    {
        public CategoryDataSample()
        {
            this.Add(new CategoryDataPoint { Category = "A", Value = 85, Low = 80, High = 95 });
            this.Add(new CategoryDataPoint { Category = "B", Value = 50, Low = 45, High = 65 });
            this.Add(new CategoryDataPoint { Category = "C", Value = 75, Low = 70, High = 90 });
            this.Add(new CategoryDataPoint { Category = "D", Value = 100, Low = 75, High = 95 });
            this.Add(new CategoryDataPoint { Category = "E", Value = 80, Low = 65, High = 80 });
            this.Add(new CategoryDataPoint { Category = "F", Value = 40, Low = 35, High = 55 });
            this.Add(new CategoryDataPoint { Category = "G", Value = 80, Low = 35, High = 50 });
            this.Add(new CategoryDataPoint { Category = "H", Value = 75, Low = 70, High = 90 });
            this.Add(new CategoryDataPoint { Category = "I", Value = 80, Low = 65, High = 80 });
            this.Add(new CategoryDataPoint { Category = "J", Value = 85, Low = 80, High = 90 });
            this.Add(new CategoryDataPoint { Category = "K", Value = 50, Low = 45, High = 60 });
            this.Add(new CategoryDataPoint { Category = "L", Value = 85, Low = 80, High = 90 });
            this.Add(new CategoryDataPoint { Category = "M", Value = 50, Low = 45, High = 60 });
            this.Add(new CategoryDataPoint { Category = "N", Value = 75, Low = 70, High = 90 });
            this.Add(new CategoryDataPoint { Category = "O", Value = 100, Low = 75, High = 95 });
            this.Add(new CategoryDataPoint { Category = "P", Value = 80, Low = 65, High = 80 });
            this.Add(new CategoryDataPoint { Category = "Q", Value = 40, Low = 35, High = 50 });
            this.Add(new CategoryDataPoint { Category = "R", Value = 80, Low = 35, High = 50 });
            this.Add(new CategoryDataPoint { Category = "S", Value = 75, Low = 70, High = 90 });
            this.Add(new CategoryDataPoint { Category = "T", Value = 80, Low = 65, High = 80 });
            this.Add(new CategoryDataPoint { Category = "U", Value = 85, Low = 80, High = 90 });
            this.Add(new CategoryDataPoint { Category = "W", Value = 50, Low = 45, High = 60 });
            this.Add(new CategoryDataPoint { Category = "V", Value = 85, Low = 80, High = 90 });
            this.Add(new CategoryDataPoint { Category = "X", Value = 50, Low = 45, High = 60 });
            this.Add(new CategoryDataPoint { Category = "Y", Value = 75, Low = 70, High = 90 });
            this.Add(new CategoryDataPoint { Category = "Z", Value = 100, Low = 75, High = 95 });

            int i = 0;
            foreach (CategoryDataPoint dataPoint in this)
            {
                dataPoint.Index = i++;
            }
        }
    }
    public class CategoryDataCollection : ObservableCollection<CategoryDataPoint>
    {
        public CategoryDataCollection()
        {
            _title = "";
        }
        private string _title;
        public string Title
        {
            get { return _title; }
            set
            {
                if (_title.Equals(value)) return;
                _title = value;
                OnPropertyChanged(new PropertyChangedEventArgs("Title"));
            }
        }
    }
    public class CategoryDataPoint : ObservableModel
    {
        public CategoryDataPoint() { }
        public CategoryDataPoint(double value, string label)
        {
            this.Value = value;
            this.Category = label;
        }
        public CategoryDataPoint(CategoryDataPoint dataPoint)
        {
            this.Index = dataPoint.Index;
            this.Category = dataPoint.Category;
            this.Value = dataPoint.Value;
            this.Date = dataPoint.Date;
            this.High = dataPoint.High;
            this.Low = dataPoint.Low;
            this.Maxtem = dataPoint.Maxtem;
            this.Mintem = dataPoint.Mintem;
            this.Name = dataPoint.Name;
            this.Hum = dataPoint.Hum;
        }
      
        public double Change
        {
            get { return High - Low; }
        }
        public double ChangePerCent
        {
            get { return (Change / High) * 100; }
        }

        private double _index;
        public double Index
        {
            get { return _index; }
            set { if (_index == value) return; _index = value; OnPropertyChanged("Index"); }
        }

        private double _value;
        public double Value
        {
            get { return _value; }
            set { if (_value == value) return; _value = value; OnPropertyChanged("Value");}
        }

        private double _high;
        public double High
        {
            get { return _high; }
            set { if (_high == value) return; _high = value; OnPropertyChanged("High"); }
        }
        private string _name;
        public string Name
        {
            get { return _name; }
            set { if (_name == value) return; _name = value; OnPropertyChanged("Name"); }
        }
        private double _maxtem;
        public double Maxtem
        {
            get { return _maxtem; }
            set { if (_maxtem == value) return; _maxtem = value; OnPropertyChanged("Maxtem"); }
        }
        private double _mintem;
        public double Mintem
        {
            get { return _mintem; }
            set { if (_mintem == value) return; _mintem = value; OnPropertyChanged("Mintem"); }
        }
        private double _hum;
        public double Hum
        {
            get { return _hum; }
            set { if (_hum == value) return; _hum = value; OnPropertyChanged("Hum"); }
        }

        private double _low;
        public double Low
        {
            get { return _low; } 
            set { if (_low == value) return; _low = value; OnPropertyChanged("Low"); }
        }

        private string _category;
        public string Category
        {
            get { return _category; }
            set { if (_category == value) return; _category = value; OnPropertyChanged("Category"); }
        }
        public string Label
        {
            get { return _category; }
            set { if (_category == value) return; _category = value; OnPropertyChanged("Label"); }
        }
        private DateTime _date;
        public DateTime Date
        {
            get { return _date; } 
            set { if (_date == value) return; _date = value; OnPropertyChanged("Date"); }
        }

        public new string ToString()
        {
            return String.Format("Category {0}, Value {1}", Category, Value);
        }
        public CategoryDataPoint Clone()
        {
            return new CategoryDataPoint(this);
        } 
    }

    public class CategoryDataRandomSample : CategoryDataCollection
    {
        public CategoryDataRandomSample()
        {
           
                _settings = new CategoryDataSettings();

                _settings.DataPoints = InsectData.getDataPoints();
                _settings.ValueStart = 0;
                _settings.ValueChange = 10;
                _settings.PropertyChanged += OnSettingsPropertyChanged;
               this.Generate(InsectData.getName());
         
        }
        private void OnSettingsPropertyChanged(object sender, PropertyChangedEventArgs e)
        {
            this.Generate(InsectData.getName());
        }
        public void Generate(string name)
        {
            this.Clear();
            CategoryDataPoint dataPoint = new CategoryDataPoint();
          
            //dataPoint.Index = 0;
            //dataPoint.Value = this.Settings.ValueStart;
            //dataPoint.High = 0;
            //dataPoint.Low = 0;
            //dataPoint.Category = (dataPoint.Index + 2).ToString();
            dataPoint.Category = (dataPoint.Index + 2).ToString();
            List<double> list = InsectData.getData(name);
            List<int> dates = InsectData.getDate();
            List<double> maxtem = InsectData.getMaxTem();
            List<double> mintem = InsectData.getMinTem();
            List<double> hum = InsectData.getHum();
            for (int i = 0; i <dates.Count; i++)
            {
               
                dataPoint.Value=list[i];
                dataPoint.Mintem=mintem[i];
                dataPoint.Maxtem=maxtem[i];
                dataPoint.Hum=hum[i];
                dataPoint.Name = name;
                dataPoint.Low=list[i];
                dataPoint.High = list[i];
                dataPoint.Index = dates[i];
                dataPoint.Category = "µÚ"+(dates[i]).ToString()+"ÖÜ";
                this.Add(dataPoint.Clone());
             //   if (CategoryDataGenerator.Random.NextDouble() > .5)
             //   {
             //      dataPoint.Value += (CategoryDataGenerator.Random.NextDouble() * this.Settings.ValueChange);
             //       dataPoint.Value += this.Settings.ValueChange;
             //   }
             //   else
             //   {
             //       dataPoint.Value -= (CategoryDataGenerator.Random.NextDouble() * this.Settings.ValueChange);
             //       //dataPoint.Value -= this.Settings.ValueChange;
             //   }
             //   dataPoint.High = dataPoint.Value + this.Settings.ValueChange;
             //   dataPoint.Low = dataPoint.Value - this.Settings.ValueChange;
             ////   dataPoint.Date = dataPoint.Date.Add(this.Settings.DateInterval);
             //   dataPoint.Index += 1;
             //   dataPoint.Category = (dataPoint.Index + 1).ToString();
            }
        }
        private CategoryDataSettings _settings;
        public CategoryDataSettings Settings
        {
            get { return _settings; }
            set
            {
                if (_settings == value) return;
                _settings = value;
                //this.Generate();
            }
        } 

        
    }
    public class CategoryDataSettings : ObservableModel
    {
        public CategoryDataSettings()
        {
            DataPoints = 20;

            ValueStart = 0;
            ValueChange = 1;
        }
        
        public double ValueChange { get; set; }
        public double ValueStart { get; set; }
        public int DataPoints { get; set; }
    }
    public static class CategoryDataGenerator
    {
        public static Random Random = new Random();
    }
}