using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Glob
{
   public class DataPointSample
    {
        /// <summary>
        /// 日期
        /// </summary>
        public DateTime ValueDateTime { get; set; }
        /// <summary>
        /// 粮温
        /// </summary>
        public double ValueX { get; set; }
        /// <summary>
        /// 虫数
        /// </summary>
        public double ValueY { get; set; }

        /// <summary>
        /// 以玉米象个数为半径
        /// </summary>
        public double ValueR { get; set; }

        public string nameStr { get; set; }
        /// <summary>
        /// 室温
        /// </summary>
        /// 
        public string ValueOfTem { set; get; }
    }
}
