using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace ZhiLiangCanShuDataMember
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

       public DataSource()
       {               
       }

        public DataSource(String str)
        {
            try
            {
                shiYanHao = str;
                foreach (DataValue datapoint in SelectData.getData(str))
                {
                    this.Add(datapoint);

                    yLable1 = datapoint.yLable;
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
            catch (Exception e)
            {
                throw e;
            }
        }
        private string shiYanHao;
        public XiaoMaiDisplayModel getMiaoShu()
        {
            return SqlData.getXiaoMaiChartDisplay(shiYanHao);
        }
   }
}
