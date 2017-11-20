<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Web.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 30%;
            margin-right: 0px;
        }
        .auto-style3 {
            width: 76px;
        }
        .auto-style4 {
            width: 76px;
            height: 23px;
        }
        .auto-style5 {
            height: 23px;
        }
        .auto-style6 {
            height: 23px;
            width: 144px;
        }
        .auto-style7 {
            width: 144px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table class="auto-style1">
            <tr>
                <td class="auto-style3">聊天室</td>
            </tr>
            <tr>
                <td class="auto-style4">用户名：</td>
                <td class="auto-style6">
                    <asp:TextBox ID="tbUserName" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style5">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="tbUserName" ErrorMessage="用户名不能为空"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">密码：</td>
                <td class="auto-style7">
                    <asp:TextBox ID="tbPwd" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="tbPwd" ErrorMessage="密码不能为空"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td colspan="3">
                    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="登录" />
                    <asp:Button ID="Button2" runat="server" OnClick="Button2_Click1" Text="添加" />
                    <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="删除" />
                    <asp:Button ID="Button4" runat="server" OnClick="Button4_Click" Text="修改" />
                    <br />
                    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
