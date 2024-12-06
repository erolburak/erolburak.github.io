setYear();

function setYear() {
    let date = new Date();
    let year = date.getFullYear();
    document.getElementById("year").innerHTML = "© " + year + " Burak Erol";
}
