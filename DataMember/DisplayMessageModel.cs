using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace DataMember
{
   public class DisplayMessageModel
    {
     
        public int TypeBianHao
        {
            get;
            set;
        }

      
        public string TypeMiaoShu
        {
            get;
            set;
        }


        public List<int> TuPianBianHao = new List<int>();



        public List<string> TuPianMiaoShu = new List<string>();


        public List<int> GongNengBianHao = new List<int>();



        public List<string> GongNengMiaoShu = new List<string>();

       // public List<int> ChartID = new List<int>();
        public List<ChartMiaoShuModel> ChartMiaoShu = new List<ChartMiaoShuModel>();
  
    }

    public class ChartMiaoShuModel
    {
        public int chartId
        {
            get;
            set;
        }
        public string PeatsNum
        {
            get;
            set;
        }
        public string ChartMiaoShu
        {
            get;
            set;
        }
        public int gongNengBianHao
        {
            get;
            set;
        }
    }

}
