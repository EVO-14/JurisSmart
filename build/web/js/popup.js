function showPopup(message) {
    var popup = document.createElement('div');
    popup.className = 'custom-popup';
    popup.innerHTML = '<div class="popup-content">' + message + '</div>';
    document.body.appendChild(popup);

    setTimeout(function () {
        popup.style.opacity = '0';
        setTimeout(function () {
            popup.remove();
        }, 300);
    }, 5000);
}
showPopup("Dados Incorretos!");