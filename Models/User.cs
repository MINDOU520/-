using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Models
{
    public class User
    {
        #region 声明用户属性
        //用户ID
        public int UserID { get; set; }
        //用户名
        public string UserName { get; set; }
        //用户密码
        public string Pwd { get; set; }
        //用户电子邮箱
        public string Email { get; set; }
        //用户积分
        public int Score { get; set; }
        #endregion

        public User()
        {

        }
    }
}