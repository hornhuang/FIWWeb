function check() {
    var name = document.getElementById("name")
    var password = document.getElementById("password")
    var confirmPassword = document.getElementById("confirm_password")
    var passwordSaveProblemAnswer = document.getElementById("password_save_problem_answer")
    var sex = document.getElementsByName("sex")

    if(name.value.length!=9) {
        alert("用户名必须为九位");
        return false;
    }

    if(password.value.length<6) {
        alert("请输入六位以上密码");
        return false;
    }

    if(password.value != confirmPassword.value) {
        alert("两次输入密码不一样");
        return false;
    }

    if(passwordSaveProblemAnswer.value=="") {
        alert("回答不能为空");
        return false;
    }

    if(!sex[0].checked && !sex[1].checked) {
        alert("请选择性别")
        return false;
    }

    return true;
}

function reflesh() {
    var name = document.getElementById("name")
    var password = document.getElementById("password")
    var confirmPassword = document.getElementById("confirm_password")
    var passwordSaveProblem = document.getElementById("password_save_problem")
    var passwordSaveProblemAnswer = document.getElementById("password_save_problem_answer")
    var sex = document.getElementById("sex")

    name.value = "";
    password.value = "";
    confirmPassword.value = "";
    passwordSaveProblem.value = 0;
    passwordSaveProblemAnswer.value = "";
    sex[0].check = false;
    sex[1].check = false;

    return false;
}