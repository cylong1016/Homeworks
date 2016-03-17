function hide(el, offset) {
    var opacity = el.style.opacity||1;
    setTimeout(function() {
        el.style.opacity = String(parseFloat(opacity) - offset);
        parseFloat(el.style.opacity) > 0 && hide(el,offset);
    }, 20);
}

