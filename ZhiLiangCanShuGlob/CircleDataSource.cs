using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using ZhiLiangCanShuDataMember;

namespace ZhiLiangCanShuGlob
{
   public class CircleDataSource : List<DataPointSample>
    {
        private string _ylabel1;

        public string yLable1
        {
            get { return _ylabel1; }
            set
            {
                if (_ylabel1 == value) return;
                _ylabel1 = value;

            }
        }
       public CircleDataSource()
       {
       }
        public CircleDataSource(String str)
        {
            foreach (DataValue dataValue in SelectData.getData(str))
            {
                DataPointSample dataPoint = new DataPointSample();
                if (dataValue.CanShuNumber.Equals("000001"))
                {      
                    dataPoint.ValueR = dataValue.Y * 10;    
                }
                else if (dataValue.CanShuNumber.Equals("000002"))
                {
                    dataPoint.ValueR = dataValue.Y ;
                }
                else if (dataValue.CanShuNumber.Equals("000003"))
                {
                    dataPoint.ValueR = dataValue.Y / 7;
                }
                dataPoint.GrainTemp = dataValue.GrainTemp;
                dataPoint.nameStr = dataValue.yLable;
                dataPoint.ValueY = dataValue.Y;
                dataPoint.ValueX = dataValue.index;
                dataPoint.ValueDateTime = dataValue.date;
                dataPoint.ValueOfWater = dataValue.Water;
                this.Add(dataPoint);
            }

        }
    }
}
