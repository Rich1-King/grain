using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace DataMember
{
   public class XiaoMaiDisplayModel
    {
        private string _chartMiaoShu;
        public string chartMiaoShu
        {
            get
            {
                return _chartMiaoShu;
            }
            set
            {
                _chartMiaoShu = value;
            }
        }

        private string _chartSpeedMiaoShu;
        public string chartSpeedMiaoShu
        {
            get
            {
                return _chartSpeedMiaoShu;
            }
            set
            {
                _chartSpeedMiaoShu = value;
            }
        }

    }
}
