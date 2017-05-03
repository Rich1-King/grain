using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DataMember;

namespace Glob
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
       public CircleDataSource()
       {
           yLable1 = "玉米象";
           y1Lable1 = "谷蠹";
           y2Lable1 = "米象";
           y3Lable1 = "赤拟谷盗";
       }
        public CircleDataSource(String str)
        {
            try
            {
                foreach (DataValue dataValue in SelectData.getData(str))
                {
                    DataPointSample dataPoint = new DataPointSample();
                    if (str == "000051")
                    {
                        dataPoint.nameStr = "玉米象";
                        dataPoint.ValueY = dataValue.Y;//虫个数
                        dataPoint.ValueR = dataValue.Y * 5;//以个数的3倍为圆的半径  dataPoint.ValueR = dataValue.Y * 5;//以个数的3倍为圆的半径


                    }
                    if (str == "000052")
                    {
                        dataPoint.nameStr = "谷蠹";
                        dataPoint.ValueY = dataValue.Y;
                        dataPoint.ValueR = dataValue.Y * 5;


                    }
                    if (str == "000053")
                    {
                        dataPoint.nameStr = "米象";
                        dataPoint.ValueY = dataValue.Y;
                        dataPoint.ValueR = dataValue.Y * 5;
                    }
                    if (str == "000054")
                    {
                        dataPoint.nameStr = "赤拟谷盗";
                        dataPoint.ValueY = dataValue.Y;
                        dataPoint.ValueR = dataValue.Y * 5;
                    }

                    dataPoint.ValueX = dataValue.GrainTemp;//粮温
                    dataPoint.ValueDateTime = dataValue.date;//日期
                    dataPoint.ValueOfTem = dataValue.InTemp;//室温
                    this.Add(dataPoint);
                }
            }
            catch (Exception e)
            {
                throw e;
            }


        }
    }
}
