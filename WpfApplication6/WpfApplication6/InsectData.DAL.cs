using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Collections;
using System.Configuration;
using WpfApplication6.series;
using Linq;
using System.Windows;

namespace WpfApplication6  
{
    class InsectData
    {
        private static String insect;
       
        private static readonly string table_1=ConfigurationManager.AppSettings["table_1"].ToString();
        private static readonly string safeloag = ConfigurationManager.ConnectionStrings["SQLConnString"].ConnectionString.ToString();
        public static Dictionary<int, IList> getData(string style, int styleid, int action)
        {
            AdventureWorks db = new AdventureWorks(safeloag);
            var query = from con in db.analysis
                        where con.style == style && con.StyleId == styleid && con.action == action
                        select con;
            Dictionary<int, IList> dictionary = new Dictionary<int, IList>();
            List<DataPoint> lists = new List<DataPoint>(query.Count());
            for (int i = 0; i < query.Count(); i++)
            {
                DataPoint data = new DataPoint();
                data.ValueX = i+1;
                data.ValueY = Convert.ToDouble(query.ToArray()[i].low.ToString("0.00"));
                data.ValueR = Convert.ToDouble(query.ToArray()[i].low.ToString("0.00")) * (i + 1) / 3;
                data.ValueDateTime = Convert.ToDateTime(query.ToArray()[i].date);
                data.ValueOfTem = "粮低温:" + data.ValueY;
                lists.Add(data);
            }
            dictionary.Add(0, lists);


            List<DataPoint> lists1 = new List<DataPoint>(query.Count());
            for (int i = 0; i < query.Count(); i++)
            {
                DataPoint data = new DataPoint();
                data.ValueX = i + 1;
                data.ValueY = Convert.ToDouble(query.ToArray()[i].average.ToString("0.00"));
                data.ValueR = Convert.ToDouble(query.ToArray()[i].average.ToString("0.00")) * (i + 1) / 3;
                data.ValueDateTime = Convert.ToDateTime(query.ToArray()[i].date);
                data.ValueOfTem = "粮均温:"+data.ValueY;
                lists1.Add(data);
            }
            dictionary.Add(1, lists1);


               List<DataPoint> lists2 = new List<DataPoint>(query.Count());
            for (int i = 0; i < query.Count(); i++)
            {
                DataPoint data = new DataPoint();
                data.ValueX = i+1;
                data.ValueY = Convert.ToDouble(query.ToArray()[i].hight.ToString("0.00"));
                data.ValueR = Convert.ToDouble(query.ToArray()[i].hight.ToString("0.00"))*(i+1)/3;
                data.ValueDateTime = Convert.ToDateTime(query.ToArray()[i].date);
                data.ValueOfTem = "粮高温:" + data.ValueY;
                lists2.Add(data);
            }
            dictionary.Add(2, lists2);
            return dictionary;
        }
        public static void  setInsect(string s)
        {
           insect = s;
        }
        private static string sql = "select name from " + table_1;
        public static double getMaxValue()
        {
            return SqlHelper.maxValue(insect);
        }
        public static Dictionary<int, IList> getInsectData()
        {
            Dictionary<int, IList> dict = new Dictionary<int, IList>();
            List<string> names=SqlHelper.selectName(sql);
            List<int> weeks = new List<int>();
            SqlHelper.selectRead("weeks", ref weeks);
            List<double> mintem = new List<double>();
            SqlHelper.selectRead("mintem", ref mintem);
            List<double> maxtem = new List<double>();
            SqlHelper.selectRead("maxtem", ref maxtem);
            List<double> hum = new List<double>();
            SqlHelper.selectRead("hum", ref hum);
            for (int i = 0; i < names.Count; i++)
            {
                DateTime valueDateTime = DateTime.Now.AddDays(-140);
                List<DataPoint> result = new List<DataPoint>();
                List<double> insectdatas=SqlHelper.selectRead(names[i]);
              
                for (int j = 0; j <insectdatas.Count ; j++)
                {

                    DataPoint point = new DataPoint();
                    point.ValueY = Convert.ToDouble(insectdatas[j]);
                    point.ValueR =(i+2)*j*2+5;
                    point.ValueX = Convert.ToDouble(weeks[j]);
                 
                    point.ValueDateTime = valueDateTime;
                    result.Add(point);
                    valueDateTime = valueDateTime.AddDays(14);
                }
                dict.Add(i, result);
            }
            return dict;
        }
        public static List<string> getInsect()
        {
            return SqlHelper.selectName("select name from " + table_1);
        }
        public static int getDataPoints()
        {
            return  SqlHelper.selectweek()[SqlHelper.selectweek().Count-1];
        }
        public static int getInsects()
        {
            return SqlHelper.selectName("select name from " + table_1).Count; 
        }
        public static string getName()
        {
            return insect;
        }
        public static List<double> getData(string name)
        {
            List<double> list = SqlHelper.selectRead(name);
            return list;

        }
        public static List<int> getDate()
        {

            return SqlHelper.selectweek();
        }
        public static List<double> getMaxTem()
        {
            return SqlHelper.selectRead("maxtem");
        }
        public static List<double> getMinTem()
        {
            return SqlHelper.selectRead("mintem");
        }
        public static List<double> getHum()
        {
            return SqlHelper.selectRead("hum");
        }
    }
}
