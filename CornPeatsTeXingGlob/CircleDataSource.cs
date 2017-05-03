using CornPeatsTeXingDataMember;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace CornPeatsTeXingGlob
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
                if (dataValue.CanShuNumber.Equals("000004"))
                {
                    dataPoint.ValueR = dataValue.Y * 3;
                }
                else if (dataValue.CanShuNumber.Equals("000005"))
                {
                    dataPoint.ValueR = dataValue.Y / 50;
                }
                dataPoint.InTemp = dataValue.InTemp;
                dataPoint.nameStr = dataValue.yLable;
                dataPoint.ValueY = dataValue.Y;
                dataPoint.ValueX = dataValue.index;
                dataPoint.ValueDateTime = dataValue.date;
                dataPoint.ValueOfWater = dataValue.PeatsMiDu;
                this.Add(dataPoint);
            }

        }
    }
}
