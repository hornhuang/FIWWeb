<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">   
    <title>J2EE 实验一</title>
    <link href="../css/login.css" rel="stylesheet">
</head>
<body>

   
    <script type="text/javascript" src="../javascript/login.js"></script>
    <div id="container">

        <div id="mainContent">

            <div class="h2Div">

                <h2 >HTML基础--注册表单</h2>

            </div>
            
            <div>
                
                <form action="login.jsp" method="POST">
   
                    <table class="loginTable">
                
                        <tr>
                            <td >登陆名称:</td>
                            <td >
                                <input class="inputType" type="text" id="name" name="name">
                            </td>
                        </tr>
                        
                        <tr>
                            <td>登陆密码:</td>
                            <td>
                                <input class="inputType" type="password" id="password" name="password">
                            </td>
                        </tr>
                        
                        <tr>
                            <td>密码确认:</td>
                            <td>
                                <input class="inputType" type="password" id="confirm_password" name="confirm_password">
                            </td>
                        </tr>
                        
                        <tr>
                            <td>密码保护问题:</td>
                            <td>
                                <select class="inputType" id="password_save_problem" name="password_save_problem"> 
                                    <option class="inputType" value="0">你的宠物叫什么名字？</option> 
                                    <option class="inputType" value="1">你生日是什么时候？</option> 
                                    <option class="inputType" value="2">你的故乡在哪？</option> 
                                    <option class="inputType" value="3">你父母亲的名字？</option> 
                                </select> 
                            </td>
                        </tr>
                        
                        <tr>
                            <td>问题答案:</td>
                            <td>
                                <input class="inputType" type="text" id="password_save_problem_answer" name="password_save_problem_answer">
                            </td>
                        </tr>
                        
                        <tr>
                            <td>性别:</td>
                            <td >
                                <label><input type="radio" name="sex" id="sex" value="男生">男生</label>
                                <label><input type="radio" name="sex" id="sex" value="女生">女生</label>
                            </td>
                        </tr>
                        
                        <tr>
                            <td colspan="2" style="text-align: center">
                                <input class="inputType" type="submit" value="提 交" onclick="return check()">
                                <input class="inputType" type="reset"  value="重 填" onclick="return reflesh()">
                            </td>
                        </tr>

                    </table>

                </form>

            </div>
            
            <div class="h2Div">
                <h2>Huangyuanhao@github.com</h2>
            </div>

        </div>

    </div>



</body>
</html>