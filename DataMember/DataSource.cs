using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;

namespace DataMember
{
   public class DataSource : ObservableCollection<DataValue>
    {
       private DateTime _date1;
       public DateTime date1
       {
           get { return _date1; }
           set
           {
               if (_date1 == value) return;
               _date1 = value;

           }
       }

       private  string _ylabel1;

       public string yLable1
       {
           get { return _ylabel1; }
           set
           {
               if (_ylabel1 == value) return;
               _ylabel1 = value;
              
           }
       }

       private string _y1Lable1;
       public string y1Lable1
       {
           get { return _y1Lable1; }
           set
           {
               if (_y1Lable1 == value) return;
               _y1Lable1 = value;
             
           }
       }

       private string _y2Lable1;
       public string y2Lable1
       {
           get { return _y2Lable1; }
           set
           {
               if (_y2Lable1 == value) return;
               _y2Lable1 = value;
              
           }
       }

       private string _y3Lable1;
       public string y3Lable1
       {
           get { return _y3Lable1; }
           set
           {
               if (_y3Lable1 == value) return;
               _y3Lable1 = value;
              
           }
       }
       
       public DataSource()
       { 
            
                    yLable1 = "玉米象";


                    y1Lable1 = "谷蠹";
                
           
                    y2Lable1 = "米象";


                    y3Lable1 = "赤拟谷盗";
                
       }

       public DataSource(String str)
        {
            shiYanHao = str;
            try
            {
                foreach (DataValue datapoint in SelectData.getData(str))
                {
                    this.Add(datapoint);
                    if (str == "000051")
                    {
                        yLable1 = datapoint.yLable;
                    }
                    if (str == "000052")
                    {
                        y1Lable1 = datapoint.yLable;
                    }
                    if (str == "000053")
                    {
                        y2Lable1 = datapoint.yLable;
                    }
                    if (str == "000054")
                    {
                        y3Lable1 = datapoint.yLable;
                    }
                }
            }
            catch (Exception e)
            {
                throw e;
            }

            int index = 0;
            foreach (DataValue dataPoint in Items)
            {
                if (index == 0)
                {
                    date1 = dataPoint.date;
                }
                dataPoint.index = index++;
            }
        }

       private string shiYanHao;
       public XiaoMaiDisplayModel getMiaoShu()
       {
           return SqlData.getXiaoMaiChartDisplay(shiYanHao);
       }
   }
}
