using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using System.Collections;
using System.Data.SqlClient;
using System.Configuration;
using System.Security.Cryptography;
namespace CloudChart3D
{
    public abstract class SqlHelper
    {

        //数据库连接字符串
        public static readonly string ConnectionStringLocalTransaction = ConfigHelper.GetConfig("SQLConnString");
        // Hashtable存储缓存参数
        private static Hashtable parmCache = Hashtable.Synchronized(new Hashtable());

        /// <summary>
        ///用指定定的数据库连接字符串执行SqlCommand (不返回结果集)
        /// </summary>
        /// <remarks>
        /// 例如:  
        ///  int result = ExecuteNonQuery(connString, CommandType.StoredProcedure, "PublishOrders", new SqlParameter("@prodid", 24));
        /// </remarks>
        /// <param name="connectionString">SqlConnection的有效连接字符串</param>
        /// <param name="commandType">CommandType类型(stored procedure, text,等.)</param>
        /// <param name="commandText">存储过程名或T-SQL命令</param>
        /// <param name="commandParameters">SqlParamters数组</param>
        /// <returns>返回受影响的行数</returns>
        public static int ExecuteNonQuery(string connectionString, CommandType cmdType, string cmdText, params SqlParameter[] commandParameters)
        {

            SqlCommand cmd = new SqlCommand();

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                PrepareCommand(cmd, conn, null, cmdType, cmdText, commandParameters);
                int val = cmd.ExecuteNonQuery();
                cmd.Parameters.Clear();
                return val;
            }
        }

        /// <summary>
        /// 执行SqlCommand (无结果集返回) 
        /// </summary>
        /// <remarks>
        /// 例如.:  
        ///  int result = ExecuteNonQuery(connString, CommandType.StoredProcedure, "PublishOrders", new SqlParameter("@prodid", 24));
        /// </remarks>
        /// <param name="conn">存在的数据库连接</param>
        /// <param name="commandType">CommandType (stored procedure, text,等等.)</param>
        /// <param name="commandText">存储过程名或T-SQL命令</param>
        /// <param name="commandParameters">执行命令的SqlParamters数组</param>
        /// <returns>返回被影响的行数</returns>
        public static int ExecuteNonQuery(SqlConnection connection, CommandType cmdType, string cmdText, params SqlParameter[] commandParameters)
        {

            SqlCommand cmd = new SqlCommand();

            PrepareCommand(cmd, connection, null, cmdType, cmdText, commandParameters);
            int val = cmd.ExecuteNonQuery();
            cmd.Parameters.Clear();
            return val;
        }
        /// <summary>
        /// 用事物执行SqlCommand (无结果集返回) 
        /// </summary>
        /// <remarks>
        /// 例如.:  
        ///  int result = ExecuteNonQuery(connString, CommandType.StoredProcedure, "PublishOrders", new SqlParameter("@prodid", 24));
        /// </remarks>
        /// <param name="conn">存在的数据库连接</param>
        /// <param name="commandType">CommandType (stored procedure, text,等等.)</param>
        /// <param name="commandText">存储过程名或T-SQL命令</param>
        /// <param name="commandParameters">执行命令的SqlParamters数组</param>
        /// <returns>返回被影响的行数</returns>
        public static int ExecuteNonQuery(SqlTransaction trans, CommandType cmdType, string cmdText, params SqlParameter[] commandParameters)
        {
            SqlCommand cmd = new SqlCommand();
            PrepareCommand(cmd, trans.Connection, trans, cmdType, cmdText, commandParameters);
            int val = cmd.ExecuteNonQuery();
            cmd.Parameters.Clear();
            return val;
        }

        /// <summary>
        ///执行SqlCommand返回结果集
        /// </summary>
        /// <remarks>
        ///例如.:  
        ///  SqlDataReader r = ExecuteReader(connString, CommandType.StoredProcedure, "PublishOrders", new SqlParameter("@prodid", 24));
        /// </remarks>
        /// <param name="connectionString">有效的SqlConnection连接字符串</param>
        /// <param name="commandType">CommandType(stored procedure, text等.)</param>
        /// <param name="commandText">存储过程名或者T-SQL指令</param>
        /// <param name="commandParameters">执行命令的SqlParamters数组</param>
        /// <returns>返回包含结果集的SqlDataReader</returns>
        public static SqlDataReader ExecuteReader(string connectionString, CommandType cmdType, string cmdText, params SqlParameter[] commandParameters)
        {
            SqlCommand cmd = new SqlCommand();
            SqlConnection conn = new SqlConnection(connectionString);
            try
            {
                PrepareCommand(cmd, conn, null, cmdType, cmdText, commandParameters);
                SqlDataReader rdr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
                cmd.Parameters.Clear();
                return rdr;
            }
            catch
            {
                conn.Close();
                throw;
            }
        }

        /// <summary>
        /// 返回首行首列 
        /// </summary>
        /// <remarks>
        /// 例如.:  
        ///  Object obj = ExecuteScalar(connString, CommandType.StoredProcedure, "PublishOrders", new SqlParameter("@prodid", 24));
        /// </remarks>
        /// <param name="conn">指定的数据库连接字符串</param>
        /// <param name="commandType">CommandType (stored procedure, text,等等.)</param>
        /// <param name="commandText">存储过程名或者T-SQL命令</param>
        /// <param name="commandParameters">执行命令的SqlParamters数组</param>
        /// <returns>返回期望的类型Convert.To{类型}</returns>
        public static object ExecuteScalar(string connectionString, CommandType cmdType, string cmdText, params SqlParameter[] commandParameters)
        {
            SqlCommand cmd = new SqlCommand();

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                PrepareCommand(cmd, connection, null, cmdType, cmdText, commandParameters);
                object val = cmd.ExecuteScalar();
                cmd.Parameters.Clear();
                return val;
            }
        }

        /// <summary>
        /// 返回首行首列 
        /// </summary>
        /// <remarks>
        /// 例如.:  
        ///  Object obj = ExecuteScalar(connString, CommandType.StoredProcedure, "PublishOrders", new SqlParameter("@prodid", 24));
        /// </remarks>
        /// <param name="conn">存在的数据库连接</param>
        /// <param name="commandType">CommandType (stored procedure, text,等等.)</param>
        /// <param name="commandText">存储过程名或者T-SQL命令</param>
        /// <param name="commandParameters">执行命令的SqlParamters数组</param>
        /// <returns>返回期望的类型Convert.To{类型}</returns>
        public static object ExecuteScalar(SqlConnection connection, CommandType cmdType, string cmdText, params SqlParameter[] commandParameters)
        {

            SqlCommand cmd = new SqlCommand();

            PrepareCommand(cmd, connection, null, cmdType, cmdText, commandParameters);
            object val = cmd.ExecuteScalar();
            cmd.Parameters.Clear();
            return val;
        }
        /// <summary>
        /// 返回DataSet表
        /// </summary>
        /// <param name="storedProcName">存储过程名</param>
        /// <param name="parameters">存储过程参数</param>
        /// <param name="tableName">DataSet结果中的表名</param>
        /// <returns>返回DataSet</returns>
        public static DataSet GetDataSet(string connectionString, CommandType cmdType, string cmdText, string tableName, params SqlParameter[] commandParameters)
        {
            SqlCommand cmd = new SqlCommand();
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                DataSet dataSet = new DataSet();
                SqlDataAdapter sqlda = new SqlDataAdapter();
                PrepareCommand(cmd, connection, null, cmdType, cmdText, commandParameters);
                sqlda.SelectCommand = cmd;
                sqlda.Fill(dataSet, tableName);
                return dataSet;
            }
        }

        /// <summary>
        /// 添加参数数组到缓存
        /// </summary>
        /// <param name="cacheKey">缓存参数的键</param>
        /// <param name="cmdParms">被缓存的SqlParamters数组</param>
        public static void CacheParameters(string cacheKey, params SqlParameter[] commandParameters)
        {
            parmCache[cacheKey] = commandParameters;
        }

        /// <summary>
        /// 检索缓存参数
        /// </summary>
        /// <param name="cacheKey">查找参数的键</param>
        /// <returns>缓存的SqlParamters数组</returns>
        public static SqlParameter[] GetCachedParameters(string cacheKey)
        {
            SqlParameter[] cachedParms = (SqlParameter[])parmCache[cacheKey];

            if (cachedParms == null)
                return null;

            SqlParameter[] clonedParms = new SqlParameter[cachedParms.Length];

            for (int i = 0, j = cachedParms.Length; i < j; i++)
                clonedParms[i] = (SqlParameter)((ICloneable)cachedParms[i]).Clone();

            return clonedParms;
        }

        /// <summary>
        /// 准备要执行的命令
        /// </summary>
        /// <param name="cmd">SqlCommand对象</param>
        /// <param name="conn">SqlConnection对象</param>
        /// <param name="trans">SqlTransaction对象</param>
        /// <param name="cmdType">命令类型，例如. stored procedure或者text</param>
        /// <param name="cmdText">命令文本, 例如. Select * from Products</param>
        /// <param name="cmdParms">指令中得SqlParameters参数</param>
        private static void PrepareCommand(SqlCommand cmd, SqlConnection conn, SqlTransaction trans, CommandType cmdType, string cmdText, SqlParameter[] cmdParms)
        {

            if (conn.State != ConnectionState.Open)
                conn.Open();

            cmd.Connection = conn;
            cmd.CommandText = cmdText;

            if (trans != null)
                cmd.Transaction = trans;

            cmd.CommandType = cmdType;

            if (cmdParms != null)
            {
                foreach (SqlParameter parm in cmdParms)
                    cmd.Parameters.Add(parm);
            }
        }
    }
}