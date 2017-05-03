using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Collections;
using System.Configuration;
using System.Windows;
using DataModel;
using DataBaseControl;


namespace WpfApplication6  
{
    class SelectData
    {
        public static List<DataPoint> getData(List<Model> Models)
        {
            
            List<DataPoint> list = new List<DataPoint>();
            for (int i = 0; i < Models.Count(); i++)
            {
                DataPoint dataPoint = new DataPoint();
                dataPoint.ValueX = i + 1;
                dataPoint.ValueY = Math.Round(Convert.ToDouble(Models[i].yData),2);
             
                dataPoint.ValueR = 20;

               dataPoint.ValueDateTime = Models[i].checkTime;

               // dataPoint.ValueOfTem = ;
                list.Add(dataPoint);
            }
            return list;
        }
     
    }
}
