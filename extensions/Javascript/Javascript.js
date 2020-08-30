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

function game_end()
{
    window.close();
    return 1;
}

function splashscreen()
{
    window.document.getElementById("canvas").style.display = "block";
    window.document.getElementById("img-splash").style.display = "none";
    return 1;
}

function music_play(file)
{
    var music = window.document.getElementById("music");

    console.log("music load:" + file);
    music.src = "game/" + file;
    music.playbackRate = 1.0;
    music.currentTime = 0;
    music.loop = true;

    music.play().then(function() {
        console.log("success!");
    }).catch(function(error) {
        console.log(error);
    });
    return 1;
}

function music_pitch(pitch)
{
    var music = window.document.getElementById("music");
    music.playbackRate = pitch;
    return 1;   
}

function music_volume(volume)
{
    var music = window.document.getElementById("music");
    music.volume = volume;
    return 1;   
}

function music_stop()
{
    var music = window.document.getElementById("music");
    music.pause();
    return 1;
}

function music_playing()
{
    var music = window.document.getElementById("music");
    return !music.paused && music.duration > 0;
}