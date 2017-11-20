using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using MODEL;
using Models;

namespace DAL
{
    public class UserService
    {
        #region 根据用户名，返回用户实体
        /// <summary>
        /// 根据用户名，返回用户实体
        /// </summary>
        /// <param name="strUserName">用户名</param>
        /// <returns>User</returns>
        public static User GetUserByUserName(string strUserName)
        {
            //根据用户名，查询是否存在此用户
            string strSqlGetUser = "select * from T_User where UserName=@UserName";

            SQLHelp help = new SQLHelp();

            SqlDataReader dr = null;

            SqlParameter[] para = {
                                      new SqlParameter ("@UserName",strUserName)
                                  };

            //根据用户名，返回dataReader对象
            dr = help.GetDRWithPara(strSqlGetUser, para);

            //数据流中是否有数据
            if (dr.Read())
            {
                //声明User对象，将数据流中的值赋给User对象
                User newUser = new User();
                newUser.UserID = Convert.ToInt32(dr["UserID"]);
                newUser.UserName = dr["UserName"].ToString();
                newUser.Pwd = dr["Pwd"].ToString();
                newUser.Email = dr["Email"].ToString();
                newUser.Score = Convert.ToInt32(dr["Score"]);

                //关闭SqlDataReader对象，此时连接同时关闭
                //详见SQLHelp：GetDRWithPara（string cmdText, SqlParameter[] para）
                //mycom.ExecuteReader(CommandBehavior.CloseConnection);
                dr.Close();
                return newUser;
            }
            else
            {
                dr.Close();
                return null;
            }
        }

        internal static UserInfo Insert(UserInfo model)
        {
            throw new NotImplementedException();
        }

        internal static UserInfo SelectByPrimaryKey(int id)
        {
            throw new NotImplementedException();
        }

        public static List<UserInfo> SelectAll()
        {
            throw new NotImplementedException();
        }

        internal static bool Update(UserInfo model)
        {
            throw new NotImplementedException();
        }
        #endregion
    }
}