using DataBaseControl.PredictData;
using DataModel;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Text;

namespace DataBaseControl
{
    public class DataSource
    {
        static string connectionStr = ConfigurationManager.ConnectionStrings["SQLConnString"].ConnectionString;

        static SqlConnection sqlCon;
        static string sqlStr;
        static DataControl dataControl;
        static SqlDataReader reader;
        public void SqlConnection()
        {
            sqlCon = new System.Data.SqlClient.SqlConnection();

            sqlCon.ConnectionString = connectionStr;
            try
            {
                sqlCon.Open();
            }
            catch (Exception)
            {
                throw new Exception("数据库打开失败");
            }

        }
        public void SqlClose()
        {
            try
            {
                sqlCon.Close();
            }
            catch (SqlException e)
            {
                throw new Exception(e.ToString());
            }
        }
        public TitleModel getTitle(string tableName, string shiYanHao)
        {
            TitleModel title = new TitleModel();

            try
            {
                SqlConnection();
            }
            catch (Exception e)
            {
                throw e;
            }

            sqlStr = "select * from " + tableName + " where 实验号 = '" + shiYanHao + "'";

            try
            {
                dataControl = new DataControl();
                reader = dataControl.controlSql(sqlCon, sqlStr);
            }
            catch (Exception e)
            {
                throw e;
            }

            reader.Read();

            title.Title = Convert.ToString(reader["标题"]);
            title.TitleSpeed = Convert.ToString(reader["标题速率"]);
            title.XLabel = Convert.ToString(reader["x轴"]);
            title.YLabel = Convert.ToString(reader["y轴"]);
            title.ShiYanHao = Convert.ToString(reader["实验号"]);
            title.YLabelSpeed = Convert.ToString(reader["y轴速率"]);
            title.chartMiaoShu = Convert.ToString(reader["描述"]);
            title.chartSpeedMiaoShu = Convert.ToString(reader["速率图描述"]);
            
            
            try
            {
                SqlClose();
            }
            catch (Exception e)
            {
                throw e;
            }

            return title;

        }

        public YuMiPoHuaiTitleModel getYuMiPoHuaiTitle(string tableName, string shiYanHao)
        {
            YuMiPoHuaiTitleModel title = new YuMiPoHuaiTitleModel();

            try
            {
                SqlConnection();
            }
            catch (Exception e)
            {
                throw e;
            }

            sqlStr = "select * from " + tableName + " where 实验号 = '" + shiYanHao + "'";

            try
            {
                dataControl = new DataControl();
                reader = dataControl.controlSql(sqlCon, sqlStr);
            }
            catch (Exception e)
            {
                throw e;
            }

            reader.Read();

            title.temTitle = Convert.ToString(reader["温度标题"]);
            title.poHuaiLvTitle = Convert.ToString(reader["破坏率标题"]);
            title.temTitleSpeed = Convert.ToString(reader["温度标题速率"]);
            title.poHuaiLvTitleSpeed = Convert.ToString(reader["破坏率标题速率"]);
            title.ShiYanHao = Convert.ToString(reader["实验号"]);
            title.XLabel = Convert.ToString(reader["x轴"]);
            title.temLabelSpeed = Convert.ToString(reader["y轴温度速率"]);
            title.temLabel = Convert.ToString(reader["y轴温度"]);
            title.poHuaiLvLabelSpeed = Convert.ToString(reader["y轴破坏率速率"]);
            title.poHuaiLvLabel = Convert.ToString(reader["y轴破坏率"]);
            title.temChartMiaoShu = Convert.ToString(reader["温度描述"]);
            title.poHuaiLvChartMiaoShu = Convert.ToString(reader["破坏率描述"]);
            title.temChartSpeedMiaoShu = Convert.ToString(reader["温度速率图描述"]);
            title.poHuaiLvChartSpeedMiaoShu = Convert.ToString(reader["破坏率速率描述"]);

            try
            {
                SqlClose();
            }
            catch (Exception e)
            {
                throw e;
            }

            return title;

        }

        public List<YuMiTeXingDataModel> getYuMiTeXingData(string shiYanHao)
        {
            List<YuMiTeXingDataModel> yuMiModel = new List<YuMiTeXingDataModel>();
            YuMiTeXingDataModel model = new YuMiTeXingDataModel();

            try
            {
                SqlConnection();
            }
            catch (Exception e)
            {
                throw e;
            }

            sqlStr = "select * from 玉米特性参数实验信息表 where 实验号 = '" + shiYanHao + "'";
            try
            {
                dataControl = new DataControl();
                reader = dataControl.controlSql(sqlCon, sqlStr);
            }
            catch (Exception e)
            {
                throw e;
            }

            reader.Read();

            model.shiYanHao = Convert.ToString(reader["实验号"]);

            model.canShuHao = Convert.ToString(reader["参数号"]);
            model.startCanShuValue = Convert.ToString(reader["起始参数值"]);
            model.endCanShuValue = Convert.ToString(reader["终点参数值"]);
            try
            {
                model.startTime = Convert.ToDateTime(reader["开始时间"]);
                model.endTime = Convert.ToDateTime(reader["结束时间"]);
            }
            catch (Exception)
            { }


            reader.Close();

            sqlStr = "select * from 玉米特性参数信息表 where 参数号 = '" + model.canShuHao + "'";
            try
            {
                dataControl = new DataControl();
                reader = dataControl.controlSql(sqlCon, sqlStr);
            }
            catch (Exception e)
            {
                throw e;
            }
            reader.Read();
            model.canShuName = Convert.ToString(reader["参数名"]);


            reader.Close();

            sqlStr = "select * from 玉米特性参数实验数据表 where 实验号 = '" + shiYanHao + "'";

            try
            {
                dataControl = new DataControl();
                reader = dataControl.controlSql(sqlCon, sqlStr);
            }
            catch (Exception e)
            {
                throw e;
            }

            while (reader.Read())
            {
                YuMiTeXingDataModel model1 = new YuMiTeXingDataModel();

                model1.shiYanHao = model.shiYanHao;

                model1.canShuHao = model.canShuHao;
                model1.startCanShuValue = model.startCanShuValue;
                model1.endCanShuValue = model.endCanShuValue;
                model1.startTime = model.startTime;
                model1.endTime = model.endTime;
                model1.canShuName = model.canShuName;

                if (Convert.ToString(reader["水分"]) != "")
                {
                    model1.xData = Convert.ToString(reader["水分"]);
                    model1.xLabel = "水分";
                }
                else if (Convert.ToString(reader["破碎率"]) != "")
                {
                    model1.xData = Convert.ToString(reader["破碎率"]);
                    model1.xLabel = "破碎率";
                }
                else if (Convert.ToString(reader["杂质含量"]) != "")
                {
                    model1.xData = Convert.ToString(reader["杂质含量"]);
                    model1.xLabel = "杂质含量";
                }
                else
                {
                    throw new Exception("没有数据!!");
                }

                model1.yData = Convert.ToString(reader["参数值"]);
                model1.rData = Convert.ToDouble(model1.yData) * 0.05;
                if (model1.rData < 5)
                {
                    model1.rData = 10;
                }
                //model1.checkTime = Convert.ToDateTime(reader["检测日期"]);
                yuMiModel.Add(model1);
            }

            reader.Close();

            try
            {
                SqlClose();
            }
            catch (Exception e)
            {
                throw e;
            }

            for (int i = 0; i < yuMiModel.Count; i++)
            {
                if (i == 0)
                {
                    yuMiModel[i].addToSpeed = 0.0;
                }
                else
                {
                    yuMiModel[i].addToSpeed = ((Convert.ToDouble(yuMiModel[i].yData) - Convert.ToDouble(yuMiModel[i - 1].yData)) * 1.0 / (Convert.ToDouble(yuMiModel[i].xData) - Convert.ToDouble(yuMiModel[i - 1].xData)));
                }
            }
            for (int i = 0; i < yuMiModel.Count; i++)
            {
                yuMiModel[i].high = getMax(convert(yuMiModel));
                yuMiModel[i].low = getMin(convert(yuMiModel));
                yuMiModel[i].media = getMedia(convert(yuMiModel));
                yuMiModel[i].addToSpeedHigh = getAddToSpeedMax(convert(yuMiModel));
                yuMiModel[i].addToSpeedLow = getAddToSpeedMin(convert(yuMiModel));
            }
            return yuMiModel;
        }

        public List<YuMiBaoZiModel> getYuMiBaoZiData(string shiYanHao)
        {
            List<YuMiBaoZiModel> yuMiModel = new List<YuMiBaoZiModel>();
            YuMiBaoZiModel model = new YuMiBaoZiModel();

            try
            {
                SqlConnection();
            }
            catch (Exception e)
            {
                throw e;
            }

            sqlStr = "select * from 玉米孢子检测实验信息表 where 实验号 = '" + shiYanHao + "'";
            try
            {
                dataControl = new DataControl();
                reader = dataControl.controlSql(sqlCon, sqlStr);
            }
            catch (Exception e)
            {
                throw e;
            }

            reader.Read();

            model.shiYanHao = Convert.ToString(reader["实验号"]);

            model.canShuHao = Convert.ToString(reader["孢子号"]);
            model.startCanShuValue = Convert.ToString(reader["起始孢子数"]);
            model.endCanShuValue = Convert.ToString(reader["终点孢子数"]);
            try
            {
                model.startTime = Convert.ToDateTime(reader["开始时间"]);
                model.endTime = Convert.ToDateTime(reader["结束时间"]);
            }
            catch (Exception)
            { }


            reader.Close();

            sqlStr = "select * from 玉米孢子信息表 where 孢子号 = '" + model.canShuHao + "'";
            try
            {
                dataControl = new DataControl();
                reader = dataControl.controlSql(sqlCon, sqlStr);
            }
            catch (Exception e)
            {
                throw e;
            }
            reader.Read();
            model.canShuName = Convert.ToString(reader["孢子名"]);


            reader.Close();

            sqlStr = "select * from 玉米孢子检测实验数据表 where 实验号 = '" + shiYanHao + "'";

            try
            {
                dataControl = new DataControl();
                reader = dataControl.controlSql(sqlCon, sqlStr);
            }
            catch (Exception e)
            {
                throw e;
            }

            while (reader.Read())
            {
                YuMiBaoZiModel model1 = new YuMiBaoZiModel();

                model1.shiYanHao = model.shiYanHao;

                model1.canShuHao = model.canShuHao;
                model1.startCanShuValue = model.startCanShuValue;
                model1.endCanShuValue = model.endCanShuValue;
                model1.startTime = model.startTime;
                model1.endTime = model.endTime;
                model1.canShuName = model.canShuName;

                model1.water = Convert.ToString(reader["水分"]);

                model1.tem = Convert.ToString(reader["温度"]);
                model1.humidity = Convert.ToString(reader["湿度"]);
                model1.xData = Convert.ToString(reader["消耗时间(/h)"]);
                model1.xLabel = "时间(h)";

                model1.yData = Convert.ToString(reader["孢子个数"]);
                model1.rData = Convert.ToDouble(model1.yData) * 0.1;
                try
                {
                    model1.checkTime = Convert.ToDateTime(reader["检测日期"]);
                }
                catch (Exception)
                { }
                yuMiModel.Add(model1);
            }

            reader.Close();

            try
            {
                SqlClose();
            }
            catch (Exception e)
            {
                throw e;
            }

            for (int i = 0; i < yuMiModel.Count; i++)
            {
                if (i == 0)
                {
                    yuMiModel[i].addToSpeed = 0.0;
                }
                else
                {
                    yuMiModel[i].addToSpeed = ((Convert.ToDouble(yuMiModel[i].yData) - Convert.ToDouble(yuMiModel[i - 1].yData)) * 1.0 / (Convert.ToDouble(yuMiModel[i].xData) - Convert.ToDouble(yuMiModel[i - 1].xData)));
                }
            }
            for (int i = 0; i < yuMiModel.Count; i++)
            {
                yuMiModel[i].high = getMax(convert(yuMiModel));
                yuMiModel[i].low = getMin(convert(yuMiModel));
                yuMiModel[i].media = getMedia(convert(yuMiModel));
                yuMiModel[i].addToSpeedHigh = getAddToSpeedMax(convert(yuMiModel));
                yuMiModel[i].addToSpeedLow = getAddToSpeedMin(convert(yuMiModel));
            }
            return yuMiModel;
        }

        public List<DaoGuZhiLiangTeXingModel> getDaoGuZhiLiangTeXingData(string shiYanHao)
        {
            List<DaoGuZhiLiangTeXingModel> daoGuModel = new List<DaoGuZhiLiangTeXingModel>();
            DaoGuZhiLiangTeXingModel model = new DaoGuZhiLiangTeXingModel();
            try
            {
                SqlConnection();
            }
            catch (Exception e)
            {
                throw e;
            }

            sqlStr = "select * from 稻谷质量特性参数实验信息表 where 实验号 = '" + shiYanHao + "'" ;
            try
            {
                dataControl = new DataControl();
                reader = dataControl.controlSql(sqlCon, sqlStr);
            }
            catch (Exception e)
            {
                throw e;
            }

            reader.Read();

            model.shiYanHao = Convert.ToString(reader["实验号"]);

            model.canShuHao = Convert.ToString(reader["参数号"]);
            model.startCanShuValue = Convert.ToString(reader["起始参数值"]);
            model.endCanShuValue = Convert.ToString(reader["终点参数值"]);

            try
            {
                model.startTime = Convert.ToDateTime(reader["开始时间"]);
            }
            catch (Exception)
            {
            }

            try
            {
                model.endTime = Convert.ToDateTime(reader["结束时间"]);
            }
            catch (Exception)
            { }


            reader.Close();

            sqlStr = "select * from 稻谷质量特性参数信息表 where 参数号 = '" + model.canShuHao + "'";
            try
            {
                dataControl = new DataControl();
                reader = dataControl.controlSql(sqlCon, sqlStr);
            }
            catch (Exception e)
            {
                throw e;
            }
            reader.Read();
            model.canShuName = Convert.ToString(reader["参数名"]);


            reader.Close();

            sqlStr = "select * from 稻谷质量特性参数实验数据表 where 实验号 = '" + shiYanHao + "'";

            try
            {
                dataControl = new DataControl();
                reader = dataControl.controlSql(sqlCon, sqlStr);
            }
            catch (Exception e)
            {
                throw e;
            }

            while (reader.Read())
            {
                DaoGuZhiLiangTeXingModel model1 = new DaoGuZhiLiangTeXingModel();

                model1.shiYanHao = model.shiYanHao;

                model1.canShuHao = model.canShuHao;
                model1.startCanShuValue = model.startCanShuValue;
                model1.endCanShuValue = model.endCanShuValue;
                if (model.startTime != null && model.endTime != null)
                {
                    model1.startTime = model.startTime;
                    model1.endTime = model.endTime;
                }
                model1.canShuName = model.canShuName;

                model1.xData = Convert.ToString(reader["消耗时间(/d)"]);
                model1.xLabel = "消耗时间:";
                model1.yData = Convert.ToString(reader["参数值"]);
                if (model1.rData < 5)
                {
                    model1.rData = 10;
                }
                try
                {
                    model1.checkTime = Convert.ToDateTime(reader["检测日期"]);
                }
                catch (Exception)
                { }
                model.tem = Convert.ToString(reader["粮温"]);
                model.water = Convert.ToString(reader["水分"]);
                daoGuModel.Add(model1);
            }

            reader.Close();


            try
            {
                SqlClose();
            }
            catch (Exception e)
            {
                throw e;
            }

            for (int i = 0; i < daoGuModel.Count; i++)
            {
                if (i == 0)
                {
                    daoGuModel[i].addToSpeed = 0.0;
                }
                else
                {
                    daoGuModel[i].addToSpeed = ((Convert.ToDouble(daoGuModel[i].yData) - Convert.ToDouble(daoGuModel[i - 1].yData)) * 1.0 / (Convert.ToDouble(daoGuModel[i].xData) - Convert.ToDouble(daoGuModel[i - 1].xData)));
                }
            }
            for (int i = 0; i < daoGuModel.Count; i++)
            {
                daoGuModel[i].high = getMax(convert(daoGuModel));
                daoGuModel[i].low = getMin(convert(daoGuModel));
                daoGuModel[i].media = getMedia(convert(daoGuModel));
                daoGuModel[i].addToSpeedHigh = getAddToSpeedMax(convert(daoGuModel));
                daoGuModel[i].addToSpeedLow = getAddToSpeedMin(convert(daoGuModel));
            }
            return daoGuModel;
        }

        public List<YuMiPoHuaiModel> getYuMiPoHuaiData(string shiYanHao)
        {
            List<YuMiPoHuaiModel> yuMiModel = new List<YuMiPoHuaiModel>();
            YuMiPoHuaiModel model = new YuMiPoHuaiModel();

            try
            {
                SqlConnection();
            }
            catch (Exception e)
            {
                throw e;
            }

            sqlStr = "select * from 玉米加热破坏实验信息表 where 实验号 = '" + shiYanHao + "'";
            try
            {
                dataControl = new DataControl();
                reader = dataControl.controlSql(sqlCon, sqlStr);
            }
            catch (Exception e)
            {
                throw e;
            }

            reader.Read();

            model.shiYanHao = Convert.ToString(reader["实验号"]);
            model.cengShuNumber = Convert.ToInt32(reader["层数号"]);
            model.diDianNumber = Convert.ToInt32(reader["实验地点号"]);
            reader.Close();

            sqlStr = "select * from 玉米加热破坏实验数据表 where 实验号 = '" + model.shiYanHao + "'";

            try
            {
                dataControl = new DataControl();
                reader = dataControl.controlSql(sqlCon, sqlStr);
            }
            catch (Exception e)
            {
                throw e;
            }

            while (reader.Read())
            {
                YuMiPoHuaiModel model1 = new YuMiPoHuaiModel();
                model1.tem = Convert.ToString(reader["温度"]);
                model1.poHuaiLv = Convert.ToString(reader["破坏率"]);
                model1.rData = 30;
                model1.xData = Convert.ToString(reader["检测时间(/day)"]);
                model1.xLabel = "时间:";
                model1.temLabel = "温度:";
                model1.poHuaiLvLabel = "破坏率:";
                model1.temSpeedLabel = "温度变化速率:";
                model1.poHuaiLvSpeedLabel = "破坏率变化速率:";
     
                yuMiModel.Add(model1);
            }

            reader.Close();

            try
            {
                SqlClose();
            }
            catch (Exception e)
            {
                throw e;
            }

            for (int i = 0; i < yuMiModel.Count; i++)
            {
                if (i == 0)
                {
                    yuMiModel[i].temAddToSpeed = 0.0;
                    yuMiModel[i].poHuaiLvAddToSpeed = 0.0;
                }
                else
                {
                    yuMiModel[i].temAddToSpeed = ((Convert.ToDouble(yuMiModel[i].tem) - Convert.ToDouble(yuMiModel[i - 1].tem)) * 1.0 / (Convert.ToDouble(yuMiModel[i].xData) - Convert.ToDouble(yuMiModel[i - 1].xData)));

                    yuMiModel[i].poHuaiLvAddToSpeed = ((Convert.ToDouble(yuMiModel[i].poHuaiLv) - Convert.ToDouble(yuMiModel[i - 1].poHuaiLv)) * 1.0 / (Convert.ToDouble(yuMiModel[i].xData) - Convert.ToDouble(yuMiModel[i - 1].xData)));
                }
            }
            for (int i = 0; i < yuMiModel.Count; i++)
            {
                yuMiModel[i].yData = yuMiModel[i].tem;
                yuMiModel[i].addToSpeed = yuMiModel[i].temAddToSpeed;
            }

                yuMiModel[0].temHigh = getMax(convert(yuMiModel));
                yuMiModel[0].temLow = getMin(convert(yuMiModel));
                yuMiModel[0].temMedia = getMedia(convert(yuMiModel));
                yuMiModel[0].temAddToSpeedHigh = getAddToSpeedMax(convert(yuMiModel));
                yuMiModel[0].temAddToSpeedLow = getAddToSpeedMin(convert(yuMiModel));

             for (int j = 0; j < yuMiModel.Count; j++)
             {
                 yuMiModel[j].yData = yuMiModel[j].poHuaiLv;
                 yuMiModel[j].addToSpeed = yuMiModel[j].poHuaiLvAddToSpeed;
             }
             yuMiModel[0].poHuaiLvHigh = getMax(convert(yuMiModel));
             yuMiModel[0].poHuaiLvLow = getMin(convert(yuMiModel));
             yuMiModel[0].poHuaiLvMedia = getMedia(convert(yuMiModel));
             yuMiModel[0].poHuaiLvAddToSpeedHigh = getAddToSpeedMax(convert(yuMiModel));
             yuMiModel[0].poHuaiLvAddToSpeedLow = getAddToSpeedMin(convert(yuMiModel));

             for (int i = 1; i < yuMiModel.Count; i++)
             {
                 yuMiModel[i].temHigh = yuMiModel[0].temHigh;
                 yuMiModel[i].temLow = yuMiModel[0].temLow;
                 yuMiModel[i].temMedia = yuMiModel[0].temMedia;
                 yuMiModel[i].temAddToSpeedHigh = yuMiModel[0].temAddToSpeedHigh;
                 yuMiModel[i].temAddToSpeedLow = yuMiModel[0].temAddToSpeedLow;

                 yuMiModel[i].poHuaiLvHigh = yuMiModel[0].poHuaiLvHigh;
                 yuMiModel[i].poHuaiLvLow = yuMiModel[0].poHuaiLvLow;
                 yuMiModel[i].poHuaiLvMedia = yuMiModel[0].poHuaiLvMedia;
                 yuMiModel[i].poHuaiLvAddToSpeedHigh = yuMiModel[0].poHuaiLvAddToSpeedHigh;
                 yuMiModel[i].poHuaiLvAddToSpeedLow = yuMiModel[0].poHuaiLvAddToSpeedLow;
             }
                 return yuMiModel;
        }

        #region predict
        /// <summary>
        /// 根据已有数据预测后面时间的数据
        /// </summary>
        /// <param name="models">已有数据</param>
        /// <param name="time">要预测的时间长度</param>
        /// <param name="interval">时间间隔</param>
        /// <returns>返回预测数据加上已有数据</returns>
        public List<YuMiBaoZiModel> getPredictDataAfterTime(List<YuMiBaoZiModel> models, int time, int interval)
        {
            string xLabel = models[0].xLabel;
            string yLabel = models[0].canShuName;
            List<YuMiBaoZiModel> allModels = getAllData(models);
            double[] douX = new double[allModels.Count];
            List<double> predictX = new List<double>();
            double[] douY = new double[allModels.Count];
            for (int i = 0; i < allModels.Count; i++)
            {
                douX[i] = Convert.ToDouble(allModels[i].xData);
                douY[i] = Convert.ToDouble(allModels[i].yData);
            }
            int count = time / interval;
            int flag = time % interval;
            double xLast = douX[douX.Length - 1];

            for (int i = 0; i < count; i++)
            {
                xLast = xLast + interval;
                predictX.Add(xLast);
            }
            if (flag != 0)
            {
                xLast = xLast + flag;
                predictX.Add(xLast);
            }
            Lagrange lan = new Lagrange(douX, douY);
            List<double> predictY = lan.InsertDatas(predictX);

            for (int i = 0; i < predictY.Count; i++)
            {
                YuMiBaoZiModel model = new YuMiBaoZiModel() ;
                model.xData = predictX[i].ToString();
                model.yData = predictY[i].ToString();
                allModels.Add(model);
            }
            for (int i = 0; i < models.Count; i++)
            {
                allModels[i].high = getMax(convert(allModels));
                allModels[i].low = getMin(convert(allModels));
                allModels[i].media = getMedia(convert(allModels));
                allModels[i].xLabel = xLabel;
                allModels[i].canShuName = yLabel;
            }
            List<YuMiBaoZiModel> predictModels = getAllData(allModels);
            return predictModels;
        }
        public List<YuMiBaoZiModel> getAllData(List<YuMiBaoZiModel> models)
        {
            string xLabel = models[0].xLabel;
            string yLabel = models[0].canShuName;
            double[] douY = new double[models.Count];
            double[] douX = new double[models.Count];
            List<double> douAllX = new List<double>();
            double[] douAllY;
            
            for (int i = 0; i < models.Count; i++)
            {
                douX[i] = Convert.ToDouble(models[i].xData);
                douY[i] = Convert.ToDouble(models[i].yData);
            }
            for (double i = douX[0]; i <= douX[models.Count - 1]; i++)
            {
                douAllX.Add(i);
            }
            douAllY = spline.setSplineData(douX, douY, douAllX.ToArray());

            List<YuMiBaoZiModel> allModels = new List<YuMiBaoZiModel>();
            for (int i = 0; i < douAllX.Count; i++)
            {
                YuMiBaoZiModel model = new YuMiBaoZiModel();
                model.xData = douAllX[i].ToString();
                model.yData = douAllY[i].ToString();
                allModels.Add(model);
            }
            for (int i = 0; i < allModels.Count; i++)
            {
                allModels[i].high = getMax(convert(allModels));
                allModels[i].low = getMin(convert(allModels));
                allModels[i].xLabel = xLabel;
                allModels[i].canShuName = yLabel;
            }
            return allModels;
        }
        public List<YuMiBaoZiModel> getAllPredictData(List<YuMiBaoZiModel> models)
        {
            string xLabel = models[0].xLabel;
            string yLabel = models[0].canShuName;
            List<YuMiBaoZiModel> allModels = getAllData(models);
            double[] douY = new double[allModels.Count];
            double[] douX = new double[allModels.Count];
            List<double> douAllX = new List<double>();
            //double[] douAllY;

            for (int i = 0; i < allModels.Count; i++)
            {
                douX[i] = Convert.ToDouble(allModels[i].xData);
                douY[i] = Convert.ToDouble(allModels[i].yData);
            }
            for (double i = douX[0]; i <= douX[allModels.Count - 1]; i++)
            {
                douAllX.Add(i);
            }
            MatrixEquation mart = new MatrixEquation();
            double[] xiShu = mart.MultiLine(douX, douY, douY.Length, 3);

            List<YuMiBaoZiModel> predictAllModels = new List<YuMiBaoZiModel>();

            for (int i = 0; i < douAllX.Count; i++)
            {
                YuMiBaoZiModel model = new YuMiBaoZiModel();

                double y = xiShu[0] + xiShu[1] * douAllX[i] + xiShu[2] * douAllX[i] * douAllX[i] + xiShu[3] * douAllX[i] * douAllX[i] * douAllX[i];
                model.xData = douAllX[i].ToString();
                model.yData = y.ToString();
                predictAllModels.Add(model);
            }
            for (int i = 0; i < predictAllModels.Count; i++)
            {
                predictAllModels[i].high = getMax(convert(predictAllModels));
                predictAllModels[i].low = getMin(convert(predictAllModels));
                predictAllModels[i].predictChaValue = Convert.ToDouble(allModels[i].yData) - Convert.ToDouble(predictAllModels[i].yData);
                predictAllModels[i].xLabel = xLabel;
                predictAllModels[i].canShuName = yLabel;
            }
            return predictAllModels;
        }
        public List<YuMiBaoZiModel> getLagPredictValue(List<YuMiBaoZiModel> models, int time)
        {
            string xLabel = models[0].xLabel;
            string yLabel = models[0].canShuName;
            List<YuMiBaoZiModel> allModels = getAllData(models);

            double[] ownX = new double[time];
            double[] ownY = new double[time];
            List<double> douX = new List<double>();
            List<double> douY;

            for (int i = 0; i < allModels.Count; i++)
            {
                if (i < time)
                {
                    ownX[i] = Convert.ToDouble(allModels[i].xData);
                    ownY[i] = Convert.ToDouble(allModels[i].yData);
                }
                douX.Add(Convert.ToDouble(allModels[i].xData));

            }

            Lagrange lan1 = new Lagrange(ownX, ownY);

            douY = lan1.InsertDatas(douX);
            List<YuMiBaoZiModel> predictAllModel = new List<YuMiBaoZiModel>();

            for (int i = 0; i < douY.Count; i++)
            {
                YuMiBaoZiModel model = new YuMiBaoZiModel();
                model.xData = douX[i].ToString();
                model.yData = douY[i].ToString();
                predictAllModel.Add(model);
            }
            for (int i = 0; i < predictAllModel.Count; i++)
            {
                predictAllModel[i].high = getMax(convert(models));
                predictAllModel[i].low = getMin(convert(models));
                predictAllModel[i].predictChaValue = Convert.ToDouble(allModels[i].yData) - Convert.ToDouble(predictAllModel[i].yData);
                predictAllModel[i].xLabel = xLabel;
                predictAllModel[i].canShuName = yLabel;
            }
            return predictAllModel;
        }
        

        /// <summary>
        /// 根据已有数据预测后面时间的数据
        /// </summary>
        /// <param name="models">已有数据</param>
        /// <param name="time">要预测的时间长度</param>
        /// <param name="interval">时间间隔</param>
        /// <returns>返回预测数据加上已有数据</returns>
        public List<DaoGuZhiLiangTeXingModel> getPredictDataAfterTime(List<DaoGuZhiLiangTeXingModel> models, int time, int interval)
        {
            string xLabel = models[0].xLabel;
            string yLabel = models[0].canShuName;
            double[] douX = new double[models.Count];
            List<double> predictX = new List<double>();
            double[] douY = new double[models.Count];
            for (int i = 0; i < models.Count; i++)
            {
                douX[i] = Convert.ToDouble(models[i].xData);
                douY[i] = Convert.ToDouble(models[i].yData);
            }
            int count = time / interval;
            int flag = time % interval;
            double xLast = douX[douX.Length - 1];

            for (int i = 0; i < count; i++)
            {
                xLast = xLast + interval;
                predictX.Add(xLast);
            }
            if (flag != 0)
            {
                xLast = xLast + flag;
                predictX.Add(xLast);
            }
            Lagrange lan = new Lagrange(douX, douY);
            List<double> predictY = lan.InsertDatas(predictX);

            for (int i = 0; i < predictY.Count; i++)
            {
                DaoGuZhiLiangTeXingModel model = new DaoGuZhiLiangTeXingModel();
                model.xData = predictX[i].ToString();
                model.yData = predictY[i].ToString();
                models.Add(model);
            }
            for (int i = 0; i < models.Count; i++)
            {
                models[i].high = getMax(convert(models));
                models[i].low = getMin(convert(models));
                models[i].media = getMedia(convert(models));
                models[i].xLabel = xLabel;
                models[i].canShuName = yLabel;
            }
            return models;
        }

        public List<DaoGuZhiLiangTeXingModel> getAllData(List<DaoGuZhiLiangTeXingModel> models)
        {
            string xLabel = models[0].xLabel;
            string yLabel = models[0].canShuName;
            double[] douY = new double[models.Count];
            double[] douX = new double[models.Count];
            List<double> douAllX = new List<double>();
            double[] douAllY;

            for (int i = 0; i < models.Count; i++)
            {
                douX[i] = Convert.ToDouble(models[i].xData);
                douY[i] = Convert.ToDouble(models[i].yData);
            }
            for (double i = douX[0]; i <= douX[models.Count - 1]; i++)
            {
                douAllX.Add(i);
            }
            douAllY = spline.setSplineData(douX, douY, douAllX.ToArray());

            List<DaoGuZhiLiangTeXingModel> allModels = new List<DaoGuZhiLiangTeXingModel>();
            for (int i = 0; i < douAllX.Count; i++)
            {
                DaoGuZhiLiangTeXingModel model = new DaoGuZhiLiangTeXingModel();
                model.xData = douAllX[i].ToString();
                model.yData = douAllY[i].ToString();
                allModels.Add(model);
            }
            for (int i = 0; i < allModels.Count; i++)
            {
                allModels[i].high = getMax(convert(allModels));
                allModels[i].low = getMin(convert(allModels));
                allModels[i].xLabel = xLabel;
                allModels[i].canShuName = yLabel;
            }
            return allModels;
        }
        public List<DaoGuZhiLiangTeXingModel> getAllPredictData(List<DaoGuZhiLiangTeXingModel> models)
        {
            string xLabel = models[0].xLabel;
            string yLabel = models[0].canShuName;
            List<DaoGuZhiLiangTeXingModel> allModels = getAllData(models);
            double[] douY = new double[allModels.Count];
            double[] douX = new double[allModels.Count];
            List<double> douAllX = new List<double>();
            //double[] douAllY;

            for (int i = 0; i < allModels.Count; i++)
            {
                douX[i] = Convert.ToDouble(allModels[i].xData);
                douY[i] = Convert.ToDouble(allModels[i].yData);
            }
            for (double i = douX[0]; i <= douX[allModels.Count - 1]; i++)
            {
                douAllX.Add(i);
            }
            MatrixEquation mart = new MatrixEquation();
            double[] xiShu = mart.MultiLine(douX, douY, douY.Length, 3);

            List<DaoGuZhiLiangTeXingModel> allPredictModels = new List<DaoGuZhiLiangTeXingModel>();

            for (int i = 0; i < douAllX.Count; i++)
            {
                DaoGuZhiLiangTeXingModel model = new DaoGuZhiLiangTeXingModel();

                double y = xiShu[0] + xiShu[1] * douAllX[i] + xiShu[2] * douAllX[i] * douAllX[i] + xiShu[3] * douAllX[i] * douAllX[i] * douAllX[i];
                model.xData = douAllX[i].ToString();
                model.yData = y.ToString();
                allPredictModels.Add(model);
            }
            for (int i = 0; i < allPredictModels.Count; i++)
            {
                allPredictModels[i].high = getMax(convert(allPredictModels));
                allPredictModels[i].low = getMin(convert(allPredictModels));
                allPredictModels[i].predictChaValue = Convert.ToDouble(allModels[i].yData) - Convert.ToDouble(allPredictModels[i].yData);
                allPredictModels[i].xLabel = xLabel;
                allPredictModels[i].canShuName = yLabel;
            }
            return allPredictModels;
        }

        public List<DaoGuZhiLiangTeXingModel> getLagPredictValue(List<DaoGuZhiLiangTeXingModel> models, int time)
        {
            string xLabel = models[0].xLabel;
            string yLabel = models[0].canShuName;
            List<DaoGuZhiLiangTeXingModel> allModels = getAllData(models);

            double[] ownX = new double[time];
            double[] ownY = new double[time];
            List<double> douX = new List<double>();
            List<double> douY;

            for (int i = 0; i < allModels.Count; i++)
            {
                if(i < time)
                {
                    ownX[i] = Convert.ToDouble(allModels[i].xData);
                    ownY[i] = Convert.ToDouble(allModels[i].yData);
                }
                douX.Add(Convert.ToDouble(allModels[i].xData));
         
            }

            Lagrange lan1 = new Lagrange(ownX, ownY);

            douY = lan1.InsertDatas(douX);
            List<DaoGuZhiLiangTeXingModel> predictModels = new List<DaoGuZhiLiangTeXingModel>();

            for (int i = 0; i < douY.Count; i++)
            {
                DaoGuZhiLiangTeXingModel model = new DaoGuZhiLiangTeXingModel();
                model.xData = douX[i].ToString();
                model.yData = douY[i].ToString();
                predictModels.Add(model);       
            }
            for (int i = 0; i < predictModels.Count; i++)
            {
                predictModels[i].high = getMax(convert(predictModels));
                predictModels[i].low = getMin(convert(predictModels));
                predictModels[i].predictChaValue = Convert.ToDouble(allModels[i].yData) - Convert.ToDouble(predictModels[i].yData);
                predictModels[i].xLabel = xLabel;
                predictModels[i].canShuName = yLabel;
            }
            return predictModels;
        }

        #endregion
        public List<Model> convert(List<YuMiTeXingDataModel> strValues)
        {
            List<Model> models = new List<Model>();
            foreach (YuMiTeXingDataModel model in strValues)
            {
                models.Add(model as Model);
            }
            return models;
        }
        public List<Model> convert(List<YuMiBaoZiModel> strValues)
        {
            List<Model> models = new List<Model>();
            foreach (YuMiBaoZiModel model in strValues)
            {
                models.Add(model as Model);
            }
            return models;
        }
        public List<Model> convert(List<DaoGuZhiLiangTeXingModel> strValues)
        {
            List<Model> models = new List<Model>();
            foreach (DaoGuZhiLiangTeXingModel model in strValues)
            {
                models.Add(model as Model);
            }
            return models;
        }
        public List<Model> convert(List<YuMiPoHuaiModel> strValues)
        {
            List<Model> models = new List<Model>();
            foreach (YuMiPoHuaiModel model in strValues)
            {
                models.Add(model as Model);
            }
            return models;
        }
        
        
        private double getMax(List<Model> strValues)
        {
            double value;
            try
            {
                value = Convert.ToDouble(strValues[0].yData);
            }
            catch (Exception)
            {
                throw new Exception("数据格式不正确");
            }

            List<double> douValues;
            try
            {
                douValues = YToDouble(strValues);
            }
            catch (Exception e)
            {
                throw e;

            }
            foreach (double dou in douValues)
            {
                if (value < dou)
                {
                    value = dou;
                }
            }

            return value;
        }
        private double getMin(List<Model> strValues)
        {
            double value;
            try
            {
                value = Convert.ToDouble(strValues[0].yData);
            }
            catch (Exception)
            {
                throw new Exception("数据格式不正确");
            }
            List<double> douValues;
            try
            {
                douValues = YToDouble(strValues);
            }
            catch (Exception e)
            {
                throw e;
            }

            foreach (double dou in douValues)
            {
                if (value > dou)
                {
                    value = dou;
                }
            }
            return value;
        }
        private double getMedia(List<Model> strValues)
        {
            double value = 0.0;

            List<double> douValues;

            try
            {
                douValues = YToDouble(strValues);
            }
            catch (Exception e)
            {
                throw e;
            }

            double sum = 0;
            foreach (double dou in douValues)
            {
                sum = sum + dou;
            }
            value = sum / douValues.Count;
            return value;
        }
        private double getAddToSpeedMax(List<Model> strValues)
        {
            double value;

            value = strValues[0].addToSpeed;

            foreach (Model dou in strValues)
            {
                if (value < dou.addToSpeed)
                {
                    value = dou.addToSpeed;
                }
            }
            return value;
        }
        private double getAddToSpeedMin(List<Model> strValues)
        {
            double value;

            value = strValues[0].addToSpeed;

            foreach (Model dou in strValues)
            {
                if (value > dou.addToSpeed)
                {
                    value = dou.addToSpeed;
                }
            }
            return value;
        }
        private List<double> YToDouble(List<Model> strValues)
        {
            List<double> douValues = new List<double>();

            foreach (Model str in strValues)
            {
                try
                {
                    douValues.Add(Convert.ToDouble(str.yData));
                }
                catch (Exception)
                {
                    throw new Exception("数据格式不正确");
                }
            }
            return douValues;
        }
        //private List<double> getAddToSpeed(List<YuMiTeXingDataModel> strValues)
        //{
        //    List<double> douValues = new List<double>();
        //    List<double> douValuesY = new List<double>();
        //    List<double> douValuesX = new List<double>();
        //    douValuesY = YToDouble(strValues);
        //    foreach (YuMiTeXingDataModel str in strValues)
        //    {
        //        try
        //        {
        //            douValuesX.Add(Convert.ToDouble(str.xData));
        //        }
        //        catch (Exception)
        //        {
        //            throw new Exception("数据格式不正确");
        //        }
        //    }
        //    for (int i = 0; i < douValuesY.Count; i++)
        //    {
        //        if (i == 0)
        //        {
        //            douValues.Add(0);
        //        }
        //        else
        //        {
        //            douValues.Add((douValuesY[i] - douValuesY[i - 1]) * 1.0 / douValuesX[i] - douValuesX[i - 1]);
        //        }
        //    }
        //        return douValues;
        //}
    }
}
