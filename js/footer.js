footer();

function footer() {
    let date = new Date();
    let year = date.getFullYear();
    document.getElementById("footer").innerHTML = "© " + year + " Burak Erol";
}
