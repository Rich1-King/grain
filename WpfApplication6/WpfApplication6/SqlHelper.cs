using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using System.Windows;
using System.Configuration;
namespace WpfApplication6
{
    class SqlHelper
    {
        private static readonly string safeloag = ConfigurationManager.ConnectionStrings["SQLConnString"].ConnectionString.ToString();
        private static readonly string table_0 = ConfigurationManager.AppSettings["table_0"].ToString();
        public static Double maxValue(string name)
        {
            using (SqlConnection conn = new SqlConnection(safeloag))
            {
                conn.Open();
                using (SqlCommand d = conn.CreateCommand())
                {
                    d.CommandText = "select max([" + name + "])from " + table_0;
                    return Convert.ToDouble(d.ExecuteScalar());
                }
            }
        }
        public static DataTable selectTable()
        {
            using (SqlConnection con = new SqlConnection(safeloag))
            {
                con.Open();
                using (SqlCommand d = con.CreateCommand())
                {
                    d.CommandText = "select *from" + table_0;
                    SqlDataAdapter adapter = new SqlDataAdapter(d);
                    DataSet dataset = new DataSet();
                    adapter.Fill(dataset);
                    DataTable table = dataset.Tables[0];
                    return table;
                }
            }
        }
        public static List<double> selectRead(string name)
        {
            List<double> data = new List<double>();
            using (SqlConnection conn = new SqlConnection(safeloag))
            {
                conn.Open();
                using (SqlCommand d = conn.CreateCommand())
                {
                    d.CommandText = "select [" + name + "] from " + table_0;
                    using (SqlDataReader reader = d.ExecuteReader())
                    {
                        while (reader.Read())
                        {

                            data.Add(reader.GetDouble(0));

                        }
                    }
                }
            }
            return data;
        }
        public static List<int> selectweek()
        {
            List<int> data = new List<int>();
            using (SqlConnection conn = new SqlConnection(safeloag))
            {
                conn.Open();
                using (SqlCommand d = conn.CreateCommand())
                {
                    d.CommandText = "select *from " + table_0;
                    using (SqlDataReader reader = d.ExecuteReader())
                    {
                        while (reader.Read())
                        {


                            data.Add(reader.GetInt32(1));

                        }
                    }
                }
            }
            return data;
        }
        public static List<string> selectName(string sql)
        {
            List<string> names = new List<string>();
            using (SqlConnection conn = new SqlConnection(safeloag))
            {
                conn.Open();
                using (SqlCommand d = conn.CreateCommand())
                {
                    d.CommandText = sql;
                    using (SqlDataReader reader = d.ExecuteReader())
                    {
                        while (reader.Read())
                        {

                            names.Add(reader.GetString(0));

                        }
                    }
                }
            }
            return names;
        }
        public static void selectRead(string name, ref List<int> datas)
        {
            using (SqlConnection conn = new SqlConnection(safeloag))
            {
                conn.Open();
                using (SqlCommand d = conn.CreateCommand())
                {
                    d.CommandText = "select [" + name + "] from " + table_0;
                    using (SqlDataReader reader = d.ExecuteReader())
                    {
                        while (reader.Read())
                        {


                            datas.Add(reader.GetInt32(0));

                        }
                    }
                }
            }
        }
        public static void selectRead(string name, ref List<double> datas)
        {
            using (SqlConnection conn = new SqlConnection(safeloag))
            {
                conn.Open();
                using (SqlCommand d = conn.CreateCommand())
                {
                    d.CommandText = "select [" + name + "] from " + table_0;
                    using (SqlDataReader reader = d.ExecuteReader())
                    {
                        while (reader.Read())
                        {


                            datas.Add(reader.GetDouble(0));

                        }
                    }
                }
            }
        }
    }
}
