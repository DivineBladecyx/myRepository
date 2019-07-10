function returnmain() {
    window.location.replace('/jsp/HomePage.jsp');
}

function car() {
    window.location.replace('/jsp/user/car.jsp');//管理员登录页面
}

function exit() {
    alert("注销成功！");
}

function UserRegister() {
    var div = document.getElementById("styleregister");
    div.style.display = "block";
    var div2 = document.getElementById("cover");
    div2.style.display = "block";
}

function UserLogin() {
    var div = document.getElementById("stylelogin1");
    div.style.display = "block";
    var div2 = document.getElementById("cover");
    div2.style.display = "block";
}

function ManagerLogin() {
    var div = document.getElementById("stylelogin2");
    div.style.display = "block";
    var div2 = document.getElementById("cover");
    div2.style.display = "block";
}