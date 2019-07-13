
$(document).ready(function() {
    document.getElementById("form").addEventListener("submit", function(e) {
        var input = document.getElementById("q").value;
        if (input == "") {
            e.preventDefault();
            alert("Search query my not be blank.");
            return false;
        }
    });
});