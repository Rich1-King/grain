﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Collections;
using System.Configuration;

using System.Windows;
using CornPeatsTeXingDataMember;


namespace CornPeatsTeXingDongTaiChart  
{
    class SelectData
    {

        public static int getCount()
        {
            return DataValue.count;
        }

        public static List<DataPoint> recieveData(string shiYanHao)
        {
            System.Collections.Generic.List<CornPeatsTeXingDataMember.DataValue> data = CornPeatsTeXingDataMember.SelectData.getData(shiYanHao);
            List<DataPoint> list = new List<DataPoint>(data.Count());
            for (int i = 0; i < data.Count(); i++)
            {
                DataPoint dataPoint = new DataPoint();
                dataPoint.ValueX = i + 1;
                dataPoint.ValueY = data[i].Y;

                if (data[i].CanShuNumber == "000005")
                {
                    dataPoint.ValueR = data[i].Y / 10;
                }
                else
                {
                    dataPoint.ValueR = data[i].Y + 30;
                }
              
                dataPoint.ValueDateTime = data[i].date;

                dataPoint.ValueOfTem = "粮温:" + data[i].InTemp;
                list.Add(dataPoint);
            }
            return list;
        }

        public static Dictionary<int, IList> getData()
        {
            //System.Collections.Generic.List<DataMember.DataValue> dataSampleY = new List<DataMember.DataValue>();
            //System.Collections.Generic.List<DataMember.DataValue> dataSampleY1 = new List<DataMember.DataValue>();
            //System.Collections.Generic.List<DataMember.DataValue> dataSampleY2 = new List<DataMember.DataValue>();
            //System.Collections.Generic.List<DataMember.DataValue> dataSampleY3 = new List<DataMember.DataValue>();
            //dataSampleY = DataMember.SelectData.getData("000001");
            //dataSampleY1 = DataMember.SelectData.getData("000002");
            //dataSampleY2 = DataMember.SelectData.getData("000003");
            //dataSampleY3 = DataMember.SelectData.getData("000004");

            Dictionary<int, IList> dictionary = new Dictionary<int, IList>();
            
         
          
            //   List<DataPoint> list = new List<DataPoint>(dataSampleY.Count());
            //    for (int i = 0; i < dataSampleY.Count(); i++)
            //    {
            //        DataPoint data = new DataPoint();
            //        data.ValueX = i + 1;
            //        data.ValueY = dataSampleY[i].Y;
            //        data.ValueR = dataSampleY[i].Y + 30;
             
            //        data.ValueDateTime = dataSampleY[i].date;

            //        data.ValueOfTem = "玉米象:" + data.ValueY;
            //        list.Add(data);
            //    }
            //    dictionary.Add(0, list);

            //    List<DataPoint> list1 = new List<DataPoint>(dataSampleY.Count());
            //for (int i = 0; i < dataSampleY1.Count(); i++)
            //{
            //    DataPoint data = new DataPoint();
            //    data.ValueX = i+1;
            //    data.ValueY = dataSampleY1[i].Y;
            //    data.ValueR = dataSampleY1[i].Y+ 30;
            //    data.ValueDateTime = dataSampleY1[i].date;
            //    data.ValueOfTem = "谷蠹:" + data.ValueY;
            //    list1.Add(data);
            //}
            //dictionary.Add(1, list1);


            //List<DataPoint> list2 = new List<DataPoint>(dataSampleY2.Count());
            //for (int i = 0; i < dataSampleY2.Count(); i++)
            //{

            //    DataPoint data = new DataPoint();
            //    data.ValueX = i + 1;
            //    data.ValueY = dataSampleY2[i].Y;
            //    data.ValueR = dataSampleY2[i].Y + 30;
            //    data.ValueDateTime = dataSampleY2[i].date;
          
            //    data.ValueOfTem = "米象:" + data.ValueY;
            //    list2.Add(data);
            //}
            //dictionary.Add(2, list2);


            //List<DataPoint> list3 = new List<DataPoint>(dataSampleY3.Count());
            //for (int i = 0; i < dataSampleY3.Count(); i++)
            //{
            //    DataPoint data = new DataPoint();
            //    data.ValueX = i+1;
            //    data.ValueY = dataSampleY3[i].Y ;
            //    data.ValueR = dataSampleY3[i].Y + 30;
            //    data.ValueDateTime = dataSampleY3[i].date;
        
            //    data.ValueOfTem = "赤拟谷盗:" + data.ValueY;
            //    list3.Add(data);
            //}
            //dictionary.Add(3, list3);
            return dictionary;
        }
     
    }
}
