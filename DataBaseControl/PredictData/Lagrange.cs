using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace DataBaseControl.PredictData
{
     /// <summary>
    /// 根据离散点进行二次的拉格朗日插值
    /// </summary>
    class Lagrange
    {
        /// <summary>
        /// X各点坐标组成的数组
        /// </summary>
        public double[] x { get; set; }

        /// <summary>
        /// X各点对应的Y坐标值组成的数组
        /// </summary>
        public double[] y { get; set; }

        /// <summary>
        /// x数组或者y数组中元素的个数, 注意两个数组中的元素个数需要一样
        /// </summary>
        public int itemNum { get; set; }

        /// <summary>
        /// 初始化拉格朗日插值
        /// </summary>
        /// <param name="x">X各点坐标组成的数组</param>
        /// <param name="y">X各点对应的Y坐标值组成的数组</param>
        public Lagrange(double[] x, double[] y)
        {
            this.x = x; 
            this.y = y;
            this.itemNum = x.Length;
        }
        /// <summary>
        /// 获取插入点的值
        /// </summary>
        /// <param name="insertx">插入点x坐标</param>
        /// <returns>y值集合</returns>
        public List<double> InsertDatas(List<double> insertx)
        {
            List<double> inserty = new List<double>();
            foreach (double i in insertx)
            {
                inserty.Add(GetValue(i));
            }
            return inserty;
        }
        /// <summary>
        /// 获得某个横坐标对应的Y坐标值
        /// </summary>
        /// <param name="xValue">x坐标值</param>
        /// <returns></returns>
        public double GetValue(double xValue)
        {
            //用于累乘数组始末下标
            int start, end;
            //返回值
            double value = 0.0;
            //如果初始的离散点为空, 返回0
            if (itemNum < 1) { return value; }
            //如果初始的离散点只有1个, 返回该点对应的Y值
            if (itemNum == 1) { value = y[0]; return value; }
            //如果初始的离散点只有2个, 进行线性插值并返回插值
            if (itemNum == 2)
            {
                value = (y[0] * (xValue - x[1]) - y[1] * (xValue - x[0])) / (x[0] - x[1]);
                return value;
            }
            //如果插值点小于第一个点X坐标, 取数组前3个点做插值
            if (xValue <= x[1]) { start = 0; end = 2; }
            //如果插值点大于等于最后一个点X坐标, 取数组最后3个点做插值
            else if (xValue >= x[itemNum - 2]) { start = itemNum - 3; end = itemNum - 1; }
            //除了上述的一些特殊情况, 通常情况如下
            else
            {
                start = 1; end = itemNum;
                int temp;
                //使用二分法决定选择哪三个点做插值
                while ((end - start) != 1)
                {
                    temp = (start + end) / 2;
                    if (xValue < x[temp - 1])
                        end = temp;
                    else
                        start = temp;
                }
                start--; end--;
                //看插值点跟哪个点比较靠近
                if (Math.Abs(xValue - x[start]) < Math.Abs(xValue - x[end]))
                    start--;
                else
                    end++;
            }
            //这时已经确定了取哪三个点做插值, 第一个点为x[start]
            double valueTemp;
            //注意是二次的插值公式
            for (int i = start; i <= end; i++)
            {
                valueTemp = 1.0;
                for (int j = start; j <= end; j++)
                    if (j != i)
                        valueTemp *= (double)(xValue - x[j]) / (double)(x[i] - x[j]);
                value += valueTemp * y[i];
            }
            return value;
        }
    }
}
