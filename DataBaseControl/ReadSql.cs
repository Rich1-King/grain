using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DataModel;
using System.Data.SqlClient;

namespace DataBaseControl
{
   public class DataControl
    {

       private SqlCommand com;
       private SqlDataReader dataReader;
        #region

       public SqlDataReader controlSql(SqlConnection sqlCon, string sqlStr)
       {
           com = new SqlCommand();
           com.Connection = sqlCon;
           com.CommandType = System.Data.CommandType.Text;
           com.CommandText = sqlStr;

           try
           {
               dataReader = com.ExecuteReader();
           }
           catch (Exception)
           {
               throw new Exception("读取数据失败!");
           }
           
           return dataReader;
       }
        #endregion

    }
}
