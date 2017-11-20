using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using MODEL;
using BLL;
using System.Data.SqlClient;

namespace Web
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (this.IsValid)
            {
                string strCnn = ConfigurationManager.ConnectionStrings["Student"].ConnectionString;
                SqlConnection cnn = new SqlConnection(strCnn);
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = cnn;
                string name = tbUserName.Text.Trim();
                string password = tbPwd.Text.Trim();
                password = FormsAuthentication.HashPasswordForStoringInConfigFile(password, "md5");
                cmd.CommandText = "select * from UserInfo where UserId='" + name + "'and password='" + password + "'";
                SqlDataReader UserReader = null;
                try
                {
                    if (cnn.State == ConnectionState.Closed)
                        cnn.Open();
                    UserReader = cmd.ExecuteReader();
                    if (UserReader.Read())
                    {
                        Session["UserId"] = name;
                        Response.Redirect("~/DataReaderDemo.aspx");
                    }
                    else
                    {
                        Label1.Text = "用户名、密码不正确！";
                    }
                }
                catch (Exception ex)
                {
                    Response.Write("用户登录失败，错误原因：" + ex.Message);
                }
                finally
                {
                    if (UserReader.IsClosed == false)
                        UserReader.Close();
                    if (cnn.State == ConnectionState.Open)
                        cnn.Close();
                }
            }
        }


        protected void Button2_Click(object sender, EventArgs e)
        {
            if (this.IsValid)
            {
                string strCnn = ConfigurationManager.ConnectionStrings["Student"].ConnectionString;
                SqlConnection cnn = new SqlConnection(strCnn);
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = cnn;
                string name = tbUserName.Text.Trim();
                string password = tbPwd.Text.Trim();
                password = FormsAuthentication.HashPasswordForStoringInConfigFile(password, "md5");
                cmd.CommandText = "select * from UserInfo=@UserId and Password=@password";
                SqlParameter userIdparam = new SqlParameter();
                userIdparam.ParameterName = "@userId";
                userIdparam.SqlDbType = SqlDbType.VarChar;
                userIdparam.Size = 20;
                userIdparam.Direction = ParameterDirection.Input;
                userIdparam.Value = name;
                cmd.Parameters.Add(userIdparam);
                SqlParameter passwordparam = new SqlParameter();
                userIdparam.ParameterName = "@Password";
                userIdparam.SqlDbType = SqlDbType.VarChar;
                userIdparam.Size = 32;
                userIdparam.Direction = ParameterDirection.Input;
                userIdparam.Value = password;
                cmd.Parameters.Add(passwordparam);
                SqlDataReader UserReader = null;
                try
                {
                    if (cnn.State == ConnectionState.Closed)
                        cnn.Open();
                    UserReader = cmd.ExecuteReader();
                    if (UserReader.Read())
                    {
                        Session["UserId"] = name;
                        Response.Redirect("~/DataReaderDemo.aspx");
                    }
                    else
                    {
                        Label1.Text = "用户名、密码不正确！";
                    }
                }
                catch (Exception ex)
                {
                    Response.Write("用户登录失败，错误原因：" + ex.Message);
                }
                finally
                {
                    if (UserReader.IsClosed == false)
                        UserReader.Close();
                    if (cnn.State == ConnectionState.Open)
                        cnn.Close();
                }
            }
        }

        protected void Button2_Click1(object sender, EventArgs e)
        {
            if (this.IsValid)
            {
                string strCnn = ConfigurationManager.ConnectionStrings["Student"].ConnectionString;
                SqlConnection cnn = new SqlConnection(strCnn);
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = cnn;
                string name = tbUserName.Text.Trim();
                string password = tbPwd.Text.Trim();
                password = FormsAuthentication.HashPasswordForStoringInConfigFile(password, "md5");
                cmd.CommandText = "insert into UserInfo(UserId,Password)values(N'" + name + "','" + password + "')";
                try
                {
                    cnn.Open();
                    cmd.ExecuteNonQuery();
                    Label1.Text = "用户添加成功！";
                }
                catch (Exception ex)
                {
                    Label1.Text = "用户添加失败，错误原因：" + ex.Message;
                }
                finally
                {
                    if (cnn.State == ConnectionState.Open)
                        cnn.Close();
                }
            }
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            if (this.IsValid)
            {
                string strCnn = ConfigurationManager.ConnectionStrings["Student"].ConnectionString;
                SqlConnection cnn = new SqlConnection(strCnn);
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = cnn;
                string name = tbUserName.Text.Trim();
                cmd.CommandText = "delete UserInfo where UserId='" + tbUserName.Text.Trim() + "'";
                try
                {
                    cnn.Open();
                    int deleteCount = cmd.ExecuteNonQuery();
                    if (deleteCount == 1)
                        Label1.Text = "用户删除成功！";
                    else
                    {
                        Label1.Text = "该用户记录不存在！";
                    }
                }
                catch (Exception ex)
                {
                    Label1.Text = "用户删除失败，错误原因：" + ex.Message;
                }
                finally
                {
                    if (cnn.State == ConnectionState.Open)
                        cnn.Close();
                }
            }
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            if (this.IsValid)
            {
                string strCnn = ConfigurationManager.ConnectionStrings["Student"].ConnectionString;
                SqlConnection cnn = new SqlConnection(strCnn);
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = cnn;
                string name = tbUserName.Text.Trim();
                string password = tbPwd.Text.Trim();
                password = FormsAuthentication.HashPasswordForStoringInConfigFile(password, "md5");
                cmd.CommandText = "update UserInfo set Password ='" + password + "'where UserId='" + name + "'";
                try
                {
                    cnn.Open();
                    int updateCount = cmd.ExecuteNonQuery();
                    if (updateCount == 1)
                        Label1.Text = "密码修改成功！";
                    else
                    {
                        Label1.Text = "该用户记录不存在！";
                    }

                }
                catch (Exception ex)
                {
                    Label1.Text = "密码修改失败，错误原因：" + ex.Message;
                }
                finally
                {
                    if (cnn.State == ConnectionState.Open)
                        cnn.Close();
                }
            }
        }
    }
}