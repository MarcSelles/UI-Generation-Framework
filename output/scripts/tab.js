function openVerlof(type, elmnt) {
    // Hide all elements with class="tabcontent" by default */
    var i, tabcontent, tablinks;
    tabcontent = document.getElementsByClassName("tabcontent");
    $(document.getElementById("defaultOpen")).css("background-color", "#555");
    for (i = 0; i < tabcontent.length; i++) {
        tabcontent[i].style.display = "none";
    }

    // Remove the background color of all tablinks/buttons
    tablinks = document.getElementsByClassName("tablink");

    
    // Show all information concerning "vakantieverlof"
    if(elmnt.value == "Vakantie"){
        document.getElementById("Vakantie").style.display = "block";

    } else {
        // Show the specific tab content
        document.getElementById(type).style.display = "block";
        $(elmnt).css("background-color", "#777");
    }
}

window.onload = function() {
    // Get the element with id="defaultOpen" and click on it
    document.getElementById("defaultOpen").click();
    $(document.getElementById("defaultOpen")).css("background-color", "#777");
}
