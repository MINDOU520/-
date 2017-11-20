using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using MODEL;
using DAL;

namespace BLL
{
    public class UserManager
    {
        /// <summary>
        /// 验证用户登录
        /// </summary>
        /// <param name="strUserName">用户名</param>
        /// <param name="Pwd">密码</param>
        /// <param name="validUser">输出参数（User类型对象）</param>
        /// <returns>User类型对象</returns>
        public static bool Login(string strUserName, string Pwd, out User validUser)
        {
            //根据用户名获取用户信息，调用DAL层方法
            User newUser = UserService.GetUserByUserName(strUserName);

            //不存在此用户
            if (newUser == null)
            {
                validUser = null;
                return false;
            }

            //密码错误
            if (newUser.Pwd == Pwd)
            {
                validUser = newUser;
                return true;
            }
            else
            {
                validUser = null;
                return false;
            }
        }
    }
}