using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Configuration;

namespace DataMember
{
    class SqlData
    {
      //static string connectionStr = "Data Source=RICH1\\SA;Initial Catalog=Grain;User ID=sa;Password=sunchong1995;Integrated Security=True";
        static string connectionStr = ConfigurationManager.ConnectionStrings["SQLConnString"].ConnectionString;
        private static SqlConnection sqlCon;
        private static SqlCommand com;
        private static SqlDataReader dr;

        private static void initConnection()
        {
            sqlCon = new SqlConnection(connectionStr);
            try
            {
                sqlCon.Open();
            }
            catch (Exception e)
            {
                throw e;
            }
            com = new SqlCommand();
            com.Connection = sqlCon;
            com.CommandType = CommandType.Text;
        }

        public static List<double> sqlGetData(string TableName,string row,string str)
        {
            List<double> number = new List<double>();
            try
            {
                initConnection();
            }
            catch (Exception e)
            {
                throw e;
            }

            //SqlConnection sqlCon = new SqlConnection(connectionStr);
            //sqlCon.Open();
            //SqlCommand com = new SqlCommand();

            //com.Connection = sqlCon;
           // com.CommandType = CommandType.Text;
            com.CommandText = "Select * from " + TableName + " Where ShiYanNumber = '"+str+"'";
            dr = com.ExecuteReader();//执行SQL语句
            while (dr.Read())
            {
                number.Add(Convert.ToDouble(dr[row]));
            }
            dr.Close();//关闭执行
            sqlCon.Close();//关闭数据库
            return number;
        }

        public static List<DateTime> sqlDataDate(string TableName, string row, string str)
        {
            List<DateTime> time = new List<DateTime>();

            try
            {
                initConnection();
            }
            catch (Exception e)
            {
                throw e;
            }

            //SqlConnection sqlCon = new SqlConnection(connectionStr);
            //sqlCon.Open();

            //SqlCommand com = new SqlCommand();
            //com.Connection = sqlCon;
            //com.CommandType = CommandType.Text;
            com.CommandText = "Select * from " + TableName + " Where ShiYanNumber='" + str + "'";
            dr = com.ExecuteReader();//执行SQL语句
            while (dr.Read())
            {
                time.Add(Convert.ToDateTime(dr[row]));
            }

            dr.Close();//关闭执行
            sqlCon.Close();//关闭数据库
            return time;
        }

        public static List<string> sqlDataInTemp(string TableName, string row, string str)
        {
            List<string> strInTemp = new List<string>();

            try
            {
                initConnection();
            }
            catch (Exception e)
            {
                throw e;
            }

            //SqlConnection sqlCon = new SqlConnection(connectionStr);
            //sqlCon.Open();

            //SqlCommand com = new SqlCommand();
            //com.Connection = sqlCon;
            //com.CommandType = CommandType.Text;
            com.CommandText = "Select * from " + TableName + " Where ShiYanNumber='" + str + "'";
             dr = com.ExecuteReader();//执行SQL语句
            while (dr.Read())
            {
                strInTemp.Add(Convert.ToString(dr[row]));
            }

            dr.Close();//关闭执行
            sqlCon.Close();//关闭数据库
            return strInTemp;
        }

        public static List<double> sqlDataGrainTemp(string TableName, string row, string str)
        {
            List<double> strGrainTemp = new List<double>();

            try
            {
                initConnection();
            }
            catch (Exception e)
            {
                throw e;
            }

            //SqlConnection sqlCon = new SqlConnection(connectionStr);
            //sqlCon.Open();

            //SqlCommand com = new SqlCommand();
            //com.Connection = sqlCon;
            //com.CommandType = CommandType.Text;
            com.CommandText = "Select * from " + TableName + " Where ShiYanNumber='" + str + "'";
            dr = com.ExecuteReader();//执行SQL语句
            while (dr.Read())
            {
                strGrainTemp.Add(Convert.ToDouble(dr[row]));
            }

            dr.Close();//关闭执行
            sqlCon.Close();//关闭数据库
            return strGrainTemp;
        }

        public static double getInformationData(string TableName, string row, string str)
        {
            double data=0;
            //SqlConnection sqlCon = new SqlConnection(connectionStr);
            //sqlCon.Open();
            //SqlCommand com = new SqlCommand();
            //com.Connection = sqlCon;
            //com.CommandType = CommandType.Text;

            try
            {
                initConnection();
            }
            catch (Exception e)
            {
                throw e;
            }
            com.CommandText = "Select * from " + TableName + " Where PeatsNum='" + str + "'";
             dr = com.ExecuteReader();//执行SQL语句
            while (dr.Read())
            {
                data=Convert.ToDouble(dr[row]);
            }

            dr.Close();//关闭执行
            sqlCon.Close();//关闭数据库
            return data;
        }

        public static DateTime getInformationDate(string TableName, string row, string str)
        {
            DateTime date=new DateTime();
            //SqlConnection sqlCon = new SqlConnection(connectionStr);
            //sqlCon.Open();

         
            //SqlCommand com = new SqlCommand();
            //com.Connection = sqlCon;
            //com.CommandType = CommandType.Text;
            try
            {
                initConnection();
            }
            catch (Exception e)
            {
                throw e;
            }
            com.CommandText = "Select * from " + TableName + " Where PeatsNum='" + str + "'";
             dr = com.ExecuteReader();//执行SQL语句
            while (dr.Read())
            {
                date = Convert.ToDateTime(dr[row]);
            }

            dr.Close();//关闭执行
            sqlCon.Close();//关闭数据库
            return date;
        }

        public static DisplayMessageModel getDisplay(int TypeBianHao)
        {
            DisplayMessageModel message = new DisplayMessageModel();
            message.TypeBianHao = TypeBianHao;

            try
            {
                initConnection();
            }
            catch (Exception e)
            {
                throw e;
            }

            com.CommandText = "select MiaoShu,TuPianBianHao,TuPianMiaoShu,GongNengBianHao,GongNengMiaoShu from 粮食种类描述表,粮食图片描述表,粮食功能描述表 where 粮食种类描述表.TypeBianHao = " + TypeBianHao + "and 粮食图片描述表.TypeBianHao = " + TypeBianHao + "and 粮食功能描述表.TypeBianHao =" + TypeBianHao;
            dr = com.ExecuteReader();
            while (dr.Read())
            {
              message.TypeMiaoShu = Convert.ToString(dr["miaoshu"]);
              message.TuPianBianHao.Add(Convert.ToInt16(dr["TuPianBianHao"]));
              message.TuPianMiaoShu.Add(Convert.ToString(dr["TuPianMiaoShu"]));
              message.GongNengBianHao.Add(Convert.ToInt16(dr["GongNengBianHao"]));
              message.GongNengMiaoShu.Add(Convert.ToString(dr["GongNengMiaoShu"]));
            }
            dr.Close();//关闭执行
            sqlCon.Close();//关闭数据库

            return message;
        }

        public static XiaoMaiDisplayModel getXiaoMaiChartDisplay(string number)
        {
            XiaoMaiDisplayModel model = new XiaoMaiDisplayModel();

            try
            {
                initConnection();
            }
            catch (Exception e)
            {
                throw e;
            }

            com.CommandText = "select * from 小麦坐标信息描述表 where ShiYanNumber = '" + number + "'";
            dr = com.ExecuteReader();
            dr.Read();
            model.chartMiaoShu = dr["描述"].ToString();
            model.chartSpeedMiaoShu = dr["速率图描述"].ToString();

            dr.Close();//关闭执行
            sqlCon.Close();//关闭数据库

            return model;
        }
    }
}
