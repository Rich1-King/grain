using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.IO;
using ZhiLiangCanShuDataMember.PredictData;

namespace ZhiLiangCanShuDataMember
{
   public class SelectData
    {
       
        public static int getCount()
        {
           return DataValue.count;
            
        }

        public static List<DataValue> getData(String str)
        {
            try
            {
                List<DataValue> lists = new List<DataValue>();
                List<double> a = new List<double>();

                List<DateTime> dateTime = new List<DateTime>();

                List<double> grainTemp = new List<double>();
                List<double> WaterValue = new List<double>();

                a = SqlData.sqlGetData("dbo.小麦质量特性参数数据表", "CanNumberValue", str);

                dateTime = SqlData.sqlDataDate("dbo.小麦质量特性参数数据表", "Date", str);

                grainTemp = SqlData.sqlDataDoubleValue("dbo.小麦质量特性参数数据表", "GrainTemp", str);
                WaterValue = SqlData.sqlDataDoubleValue("dbo.小麦质量特性参数数据表", "Water", str);

                DateTime endTime = SqlData.getInformationDate("dbo.小麦参数实验总概括表", "EndTime", str);
                DateTime startTime = SqlData.getInformationDate("dbo.小麦参数实验总概括表", "StartTime", str);
                String canShuNumber = SqlData.getCanShuNumber("dbo.小麦参数实验总概括表", "CanShuNumber", str);
                String canShuName = SqlData.getCanShuName("dbo.小麦参数名表", "CanShuName", canShuNumber);

                double[] col0 = a.ToArray();
                DateTime[] date = dateTime.ToArray();

                double[] douTemp = grainTemp.ToArray();
                double[] water = WaterValue.ToArray();

                double low = getLow(col0);
                double high = getHigh(col0);
                double media = getMedia(col0);


                for (int i = 0; i < col0.Length; i++)
                {
                    DataValue datapoint = new DataValue(); ;
                    DateTime dYear = date[i];
                    datapoint.date = dYear;
                    datapoint.StartTime = startTime;
                    datapoint.EndTime = endTime;
                    if (i == 0)
                    {
                        datapoint.SpeedData = 0;
                    }
                    else
                    {
                        datapoint.SpeedData = getSpeedData(col0[i], col0[i - 1], 30);
                    }
                    datapoint.High = high;
                    datapoint.Low = low;
                    datapoint.Media = media;
                    datapoint.Y = col0[i];
                    datapoint.yLable = canShuName;
                    datapoint.CanShuNumber = canShuNumber;
                    datapoint.index = i + 1;
                    datapoint.GrainTemp = douTemp[i];
                    datapoint.Water = water[i];
                    lists.Add(datapoint);
                }
                return lists;
            }
            catch (Exception)
            {
                throw new Exception("数据读取失败!!");
            }

           
        }

        public static List<double> readfile(string url)
        {
            StreamReader sr = new StreamReader(url);
           
            List<double> data = new List<double>();
            string str=null;

            str = sr.ReadLine();
            while (str != null)
            {
                data.Add(Convert.ToDouble(str));
                str = sr.ReadLine();
            }
             sr.Close();

            return data;
        }
        public static List<int> readDate(string url)
        {
            StreamReader sr = new StreamReader(url);

            List<int> date = new List<int>();
            string str = null;

            str = sr.ReadLine();
            while (str != null)
            {
                date.Add(Convert.ToInt32(str));
                str = sr.ReadLine();
            }
            sr.Close();

            return date;
        }

        public static double getHigh(double[] values)
        {
            //double value=0;
            if(values==null)
            {
                return 0;
            }
            double valueHigh = values[0];


            for (int i = 1; i < values.Length; i++)
            {
                if (valueHigh < values[i])
                {
                    valueHigh = values[i];
                }
            }
                return valueHigh;
        }

        public static double getLow(double[] values)
        {
            if(values==null)
            {
                return 0;
            }
            double valueLow = values[0];

            for (int i = 1; i < values.Length; i++)
            {
                if (valueLow > values[i])
                {
                    valueLow = values[i];
                }
            }
            return valueLow;
        }

        public static double getMedia(double[] values)
        {
            if (values == null)
            {
                return 0;
            }
            double valueMedia = 0;
            double addCount = 0;
            for (int i = 0; i < values.Length; i++)
            {
                addCount += values[i];
            }
            valueMedia = addCount / values.Length;
            return valueMedia;
        }

        public static double getSpeedData(double data1, double data2, int time)
        {
            double value;

            value = (data1 - data2) / time;
            return value;
            
        }
      
       /// <summary>
        /// 得到后几天的预测值
       /// </summary>
       /// <param name="str">实验号</param>
       /// <param name="day">天数</param>
       /// <returns>得到的预测值</returns>
        public static List<DataValue> getPredictData(String str, int day)
        {
            

            List<DataValue> lists = new List<DataValue>();
            List<double> a = new List<double>();

            List<DateTime> dateTime = new List<DateTime>();
            List<double> grainTemp = new List<double>();
            List<double> WaterValue = new List<double>();

            a = SqlData.sqlGetData("dbo.小麦质量特性参数数据表", "CanNumberValue", str);

            dateTime = SqlData.sqlDataDate("dbo.小麦质量特性参数数据表", "Date", str);

            grainTemp = SqlData.sqlDataDoubleValue("dbo.小麦质量特性参数数据表", "GrainTemp", str);

            WaterValue = SqlData.sqlDataDoubleValue("dbo.小麦质量特性参数数据表", "Water", str);
            String canShuNumber = SqlData.getCanShuNumber("dbo.小麦参数实验总概括表", "CanShuNumber", str);
            String canShuName = SqlData.getCanShuName("dbo.小麦参数名表", "CanShuName", canShuNumber);

            double[] col0 = a.ToArray();
            DateTime[] date = dateTime.ToArray();
            double[] douTemp = grainTemp.ToArray();
            double[] water = WaterValue.ToArray();

            double low = getLow(col0);
            double high = getHigh(col0);
            double media = getMedia(col0);

            DataValue datapoint=null;
            for (int i = 0; i < col0.Length; i++)
            {
                if (datapoint != null)
                {
                    datapoint = null;
                }
                datapoint = new DataValue();
                DateTime dYear = date[i];
                datapoint.date = dYear;

                if (i == 0)
                {
                    datapoint.SpeedData = 0;
                }
                else
                {
                    datapoint.SpeedData = getSpeedData(col0[i], col0[i - 1], 30);
                }
                    datapoint.High = high;
                    datapoint.Low = low;
                    datapoint.Media = media;
                    datapoint.PredictData = col0[i];
                    datapoint.yLable = canShuName;
                    datapoint.CanShuNumber = canShuNumber;
                    datapoint.index = i + 1;
                    datapoint.GrainTemp = douTemp[i];
                    datapoint.Water = water[i];
                    lists.Add(datapoint);          
            }
          
            int count = day / 30;
            int count1 = day % 30;
            int index = datapoint.index;
            DateTime d = datapoint.date;
            double d1 = datapoint.PredictData;

            List<double> dayDou=new List<double>();//将有数据的日期转换为double类型
            for(int i=0;i<date.Length;i++)
            {
                dayDou.Add(date[i].ToOADate());
            }
            double[] dat ;
            DateTime ti=date[date.Length - 1];
            if (count1 != 0)
            {
                dat = new double[count + 1];
                for (int i = 0; i < count; i++)
                { 
                    ti=ti.AddDays(30);
                    dat[i] = ti.ToOADate();
                   
                }
                dat[count] = ti.AddDays(count1).ToOADate();
                
            }
            else 
            {
                dat = new double[count];
                for (int i = 0; i < count; i++)
                {
                    ti = ti.AddDays(7);
                    dat[i] = ti.ToOADate();
                }
            }
           Lagrange lan = new Lagrange(dayDou.ToArray(), col0);
           List<double> jieguo = lan.InsertDatas(dat.ToList<double>());
           double[] predictData = jieguo.ToArray();

               for (int i = 0; i < count; i++)
               {
                   if (datapoint != null)
                   {
                       datapoint = null;
                   }

                   datapoint = new DataValue();
                   datapoint.index = index + 1;
                   datapoint.PredictData = predictData[i];
                   datapoint.date = d.AddDays(30);

                   datapoint.Water = water[0];
                   datapoint.yLable = canShuName;
                   datapoint.GrainTemp = douTemp[0];

                   d = datapoint.date;
                   d1 = datapoint.PredictData;
                   index = datapoint.index;
                   lists.Add(datapoint);
               }
            if (count1 != 0)
            {
                if (datapoint != null)
                {
                    datapoint = null;
                }

                datapoint = new DataValue();
                datapoint.PredictData = predictData[count];
                datapoint.date = d.AddDays(count1);

                datapoint.Water = water[0];
                datapoint.yLable = canShuName;
                datapoint.GrainTemp = douTemp[0];


                d = datapoint.date;
                d1 = datapoint.PredictData;

                datapoint.index = index + 1;
                lists.Add(datapoint);
            }
                return lists;
        }


       /// <summary>
       /// 用MatrixEquation得到的预测值
       /// </summary>
       /// <param name="str">实验号</param>
       /// <returns>预测值</returns>
        public static List<DataValue> getAllPredictValue(String str)
        {
          List<DataValue> lists = new List<DataValue>();

          List<double> a = SqlData.sqlGetData("dbo.小麦质量特性参数数据表", "CanNumberValue", str);

          List<DateTime> dateTime = SqlData.sqlDataDate("dbo.小麦质量特性参数数据表", "Date", str);

          List<double> grainTemp = SqlData.sqlDataDoubleValue("dbo.小麦质量特性参数数据表", "GrainTemp", str);
          List<double> WaterValue = SqlData.sqlDataDoubleValue("dbo.小麦质量特性参数数据表", "Water", str);
          String canShuNumber = SqlData.getCanShuNumber("dbo.小麦参数实验总概括表", "CanShuNumber", str);
          String canShuName = SqlData.getCanShuName("dbo.小麦参数名表", "CanShuName", canShuNumber);
       
          double[] douTemp = grainTemp.ToArray();
          double[] col0 = a.ToArray();
          DateTime[] date = dateTime.ToArray();
          double[] water = WaterValue.ToArray();
          List<double> dayDou = new List<double>();//将有数据的日期转换为double类型
          for (int i = 0; i < date.Length; i++)
          {
              dayDou.Add(date[i].ToOADate());
          }

          List<double> doubleDay = new List<double>();
          for (double j = dayDou[0]; j <= dayDou[dayDou.Count - 1]; j++)
          {
              doubleDay.Add(j);
          }
          double[] ceshi = spline.setSplineData(dayDou.ToArray(), col0, doubleDay.ToArray());//实际值

          MatrixEquation mart = new MatrixEquation();
          double[] ceshi2 = mart.MultiLine(dayDou.ToArray(), col0, col0.Length, 3);
          int index=-1;
          DateTime dDay = date[0];
          for (int i = 0; i < doubleDay.Count; i++)
          {
             
              DataValue datapoint = new DataValue();
              double y1 = ceshi2[0] + ceshi2[1] * doubleDay[i] + ceshi2[2] * doubleDay[i] * doubleDay[i] + ceshi2[3] * doubleDay[i] * doubleDay[i] * doubleDay[i];
             datapoint.PredictData = y1;

             if (i % 30 == 0)
             {
                 index++;
             }
             datapoint.GrainTemp = douTemp[index];
             datapoint.Water = water[index];
             datapoint.date = dDay.AddDays(1);
             datapoint.CanShuNumber = canShuNumber;
             datapoint.yLable = canShuName;
             dDay = datapoint.date;
             datapoint.ChaValue = ceshi[i]-y1;
             datapoint.Y = ceshi[i];
             lists.Add(datapoint);
          }
          return lists;
      }

       /// <summary>
       /// Lagrange得到的预测值
       /// </summary>
       /// <param name="str">实验号</param>
       /// <returns></returns>
        public static List<DataValue> getLagPredictValue(String str,int day)
        {

            List<DataValue> lists = new List<DataValue>();
            List<double> a = SqlData.sqlGetData("dbo.小麦质量特性参数数据表", "CanNumberValue", str);

            List<DateTime> dateTime = SqlData.sqlDataDate("dbo.小麦质量特性参数数据表", "Date", str);

            List<double> grainTemp = SqlData.sqlDataDoubleValue("dbo.小麦质量特性参数数据表", "GrainTemp", str);
            List<double> WaterValue = SqlData.sqlDataDoubleValue("dbo.小麦质量特性参数数据表", "Water", str);
            String canShuNumber = SqlData.getCanShuNumber("dbo.小麦参数实验总概括表", "CanShuNumber", str);
            String canShuName = SqlData.getCanShuName("dbo.小麦参数名表", "CanShuName", canShuNumber);

    
            double[] douTemp = grainTemp.ToArray();
            double[] col0 = a.ToArray();
            DateTime[] date = dateTime.ToArray();
            double[] water = WaterValue.ToArray();
            List<double> dayDou = new List<double>();//将有数据的日期转换为double类型
            for (int i = 0; i < date.Length; i++)
            {
                dayDou.Add(date[i].ToOADate());
            }

            List<double> doubleDay = new List<double>();
            for (double j = dayDou[0]; j <= dayDou[dayDou.Count - 1]; j++)
            {
                doubleDay.Add(j);
            }
            double[] ceshi = spline.setSplineData(dayDou.ToArray(), col0, doubleDay.ToArray());//实际值

            List<double> time1 = new List<double>();
            List<double> col1 = new List<double>();
        
                for (int i = 0; i < day; i++)
                {
                    time1.Add(doubleDay[i]);
                }
                for (int i = 0; i < day; i++)
                {
                    col1.Add(ceshi[i]);
                }
        
            Lagrange lan1 = new Lagrange(time1.ToArray(), col1.ToArray());

            List<double> jieguo1 = lan1.InsertDatas(doubleDay);//预测值

           
            DateTime dDay = date[0];
            int index = -1;
            for (int i = 0; i < doubleDay.Count; i++)
            {
                DataValue datapoint = new DataValue();
                datapoint.PredictData = jieguo1[i];
                if (i % 30 == 0)
                {
                    index++;
                }

                datapoint.GrainTemp = douTemp[index];
                datapoint.Water = water[index];
                datapoint.CanShuNumber = canShuNumber;
                datapoint.yLable = canShuName;

                datapoint.date = dDay.AddDays(1);
                dDay = datapoint.date;
                datapoint.ChaValue = ceshi[i] - jieguo1[i];
              
                datapoint.Y = ceshi[i];
              
             
                lists.Add(datapoint);
            }
            return lists; 
        }

   }
}
