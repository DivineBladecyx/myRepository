function book_action() {
    alert("已提交！")
}

function bookLogin() {
    var div = document.getElementById("stylebook");
    div.style.display = "block";
    var div2 = document.getElementById("cover");
    div2.style.display = "block";
}

function bookRemoval() {
    var div = document.getElementById("stylebookremoval");
    div.style.display = "block";
    var div2 = document.getElementById("cover");
    div2.style.display = "block";
}

function returnAddBook() {
    window.location.replace('/jsp/manager/AddBook.jsp');
}

function returnManager() {
    window.location.replace('/jsp/manager/Manager.jsp');
}