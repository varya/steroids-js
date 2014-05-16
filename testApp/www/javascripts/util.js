// util for the test app
//

var notification;

(function() {

var $notification,
    $notification__wrap,
    timerFlag,
    init;

notification = function(message)
{
    var initFirst = function() {
        $notification = $notification || $('.notification');
        $notification__wrap = $notification__wrap || $('.notification__wrap');
        $notification__wrap.on('click', hide);
        return true;
    }

    var hide = function(e) {
        e && e.stopPropagation();
        $notification.text('');
        $notification__wrap.addClass('notification__wrap--hidden');
        $notification__wrap.removeClass('notification__wrap--hiding');
        clearTimeout(timerFlag);
    }

    var hideWithAnimation = function(e) {
        e && e.stopPropagation();
        $notification__wrap.addClass('notification__wrap--hiding');
        setTimeout(function(){
            hide();
        }, 1000);
    }

    init = init || initFirst();

    $notification.text(message);
    $notification__wrap.removeClass('notification__wrap--hidden');
    timerFlag = setTimeout(function() {
        hideWithAnimation();
    }, 3000);
}

})();
