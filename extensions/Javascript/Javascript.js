/**
 * Author: Fatima Aurelia
 * Date: 01/22/2017
 * Version: 1.0
 */
function show_modal(title, content, close)
{
    window.document.getElementById("modal-title").innerHTML = title;
    window.document.getElementById("modal-content").innerHTML = content;
    window.document.getElementById("modal-close").innerHTML = close;
    window.document.getElementById("modal-game").classList.add('open');
    return 1;
}

function hide_modal()
{
    window.document.getElementById("modal-game").classList.remove('open');
    return 1;
}

function splashscreen()
{
    window.document.getElementById("canvas").style.display = "block";
    window.document.getElementById("img-splash").style.display = "none";
    return 1;
}