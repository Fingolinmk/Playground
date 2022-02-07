var coll = document.getElementsByClassName("collapsible");
var i;

for (i = 0; i < coll.length; i++) {
    coll[i].addEventListener("click", function () {
        this.classList.toggle("active");
        var content = this.nextElementSibling;
        if (content.style.maxHeight) {
            content.style.maxHeight = null;
        } else {
            content.style.maxHeight = content.scrollHeight + "px";
        }
    });
}

var slideIndex = 1;
showSlides(slideIndex);

// Next/previous controls
function plusSlides(n) {

    showSlides(slideIndex += n);

}

// Thumbnail image controls
function currentSlide(n) {
    showSlides(slideIndex = n);
}

function showSlides(n) {
    var i;
    var slides = document.getElementsByClassName("mySlides");
    var dots = document.getElementsByClassName("dot");

    if (n > slides.length) { slideIndex = 1 }
    if (n < 1) { slideIndex = slides.length }
    for (i = 0; i < slides.length; i++) {
        slides[i].style.display = "none";
    }
    for (i = 0; i < dots.length; i++) {
        dots[i].className = dots[i].className.replace(" active", "");
    }
    slides[slideIndex - 1].style.display = "block";
    dots[slideIndex - 1].className += " active";
}
var LastElm = "Undefined";
$(window).scroll(function () {
    var position = $(this).scrollTop();
    $('.header').each(function () {
        var target = $(this).offset().top;
        var id = $(this).attr('id');
        if (id) {
            if (position >= target) {
                if (LastElm !== "Undefined") {
                    if (LastElm.classList.contains('sidenav_a_active'))
                        LastElm.classList.remove("sidenav_a_active")
                }
                elm = document.getElementById(id + "_ref")
                elm.classList.add("sidenav_a_active")
                LastElm = elm;
            }


        }
    });
});
async function insertCode(url1, id) {
    console.log("insert code")
    const response = await fetch(url1);
    const data = await response.text();
    elm = document.getElementById(id);
    // lines = data.split("\n")
    // console.log(lines)
    const formattedData = data
        .replaceAll(/&/g, '&amp;')
        .replaceAll(/</g, '&lt;')
        .replaceAll(/>/g, '&gt;')
        .replaceAll(/"/g, '&quot;')
        .replaceAll(/'/g, '&#x27;')
        .replaceAll("\n", "<br>")
    elm.innerHTML = formattedData

}
window.addEventListener("load", function (event) {
    console.log("Alle Ressourcen haben das Laden beendet!");
});
insertCode("https://raw.githubusercontent.com/Fingolinmk/Playground/main/Code/Light/src/main.cpp", "includeContent");