using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;

namespace ZhiLiangCanShuDataMember
{
    class SqlData
    {
        static string connectionStr = ConfigurationManager.ConnectionStrings["SQLConnString"].ConnectionString;

        public static List<double> sqlGetData(string TableName,string row,string str)
        {
            List<double> number = new List<double>();

            SqlConnection sqlCon = new SqlConnection(connectionStr);
            sqlCon.Open();
            SqlCommand com = new SqlCommand();

            com.Connection = sqlCon;
            com.CommandType = CommandType.Text;
            com.CommandText = "Select * from " + TableName + " Where ShiYanNumber = '"+str+"'";
            SqlDataReader dr = com.ExecuteReader();//执行SQL语句
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

            SqlConnection sqlCon = new SqlConnection(connectionStr);
            sqlCon.Open();

            SqlCommand com = new SqlCommand();
            com.Connection = sqlCon;
            com.CommandType = CommandType.Text;
            com.CommandText = "Select * from " + TableName + " Where ShiYanNumber='" + str + "'";
            SqlDataReader dr = com.ExecuteReader();//执行SQL语句
            while (dr.Read())
            {
                time.Add(Convert.ToDateTime(dr[row]));
            }

            dr.Close();//关闭执行
            sqlCon.Close();//关闭数据库
            return time;
        }
 
        public static List<double> sqlDataDoubleValue(string TableName, string row, string str)
        {
            List<double> strGrainTemp = new List<double>();

            SqlConnection sqlCon = new SqlConnection(connectionStr);
            sqlCon.Open();

            SqlCommand com = new SqlCommand();
            com.Connection = sqlCon;
            com.CommandType = CommandType.Text;
            com.CommandText = "Select * from " + TableName + " Where ShiYanNumber='" + str + "'";
            SqlDataReader dr = com.ExecuteReader();//执行SQL语句
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
            SqlConnection sqlCon = new SqlConnection(connectionStr);
            sqlCon.Open();

           // List<double> d = new List<double>();
            SqlCommand com = new SqlCommand();
            com.Connection = sqlCon;
            com.CommandType = CommandType.Text;
            com.CommandText = "Select * from " + TableName + " Where ShiYanNumber='" + str + "'";
            SqlDataReader dr = com.ExecuteReader();//执行SQL语句
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
            SqlConnection sqlCon = new SqlConnection(connectionStr);
            sqlCon.Open();

            // List<double> d = new List<double>();
            SqlCommand com = new SqlCommand();
            com.Connection = sqlCon;
            com.CommandType = CommandType.Text;
            com.CommandText = "Select * from " + TableName + " Where ShiYanNumber='" + str + "'";
            SqlDataReader dr = com.ExecuteReader();//执行SQL语句
            while (dr.Read())
            {
                date = Convert.ToDateTime(dr[row]);
            }

            dr.Close();//关闭执行
            sqlCon.Close();//关闭数据库
            return date;
        }

        public static String getCanShuNumber(string TableName, string row, string str)
        {
            //DateTime date = new DateTime();
            String canShuNumber=null;
            SqlConnection sqlCon = new SqlConnection(connectionStr);
            sqlCon.Open();

            SqlCommand com = new SqlCommand();
            com.Connection = sqlCon;
            com.CommandType = CommandType.Text;
            com.CommandText = "Select * from " + TableName + " Where ShiYanNumber='" + str + "'";
            SqlDataReader dr = com.ExecuteReader();//执行SQL语句
            while (dr.Read())
            {
                canShuNumber = Convert.ToString(dr[row]);
            }

            dr.Close();//关闭执行
            sqlCon.Close();//关闭数据库
            return canShuNumber;
        }

        public static String getCanShuName(string TableName, string row, string canShuNumber)
        {
            
            String canShuName = null;
            SqlConnection sqlCon = new SqlConnection(connectionStr);
            sqlCon.Open();

            SqlCommand com = new SqlCommand();
            com.Connection = sqlCon;
            com.CommandType = CommandType.Text;
            com.CommandText = "Select * from " + TableName + " Where CanShuNumber='" + canShuNumber + "'";
            SqlDataReader dr = com.ExecuteReader();//执行SQL语句
            while (dr.Read())
            {
                canShuName = Convert.ToString(dr[row]);
            }

            dr.Close();//关闭执行
            sqlCon.Close();//关闭数据库
            return canShuName;
        }
        public static XiaoMaiDisplayModel getXiaoMaiChartDisplay(string number)
        {
            XiaoMaiDisplayModel model = new XiaoMaiDisplayModel();

            SqlConnection sqlCon = new SqlConnection(connectionStr);
            sqlCon.Open();
            SqlCommand com = new SqlCommand();
            com.CommandType = CommandType.Text;
            com.Connection = sqlCon;
            com.CommandText = "select * from 小麦坐标信息描述表 where ShiYanNumber = '" + number + "'";
            SqlDataReader dr = com.ExecuteReader();
            dr.Read();
            model.chartMiaoShu = dr["描述"].ToString();
            model.chartSpeedMiaoShu = dr["速率图描述"].ToString();

            dr.Close();//关闭执行
            sqlCon.Close();//关闭数据库

            return model;
        }
    }
}
