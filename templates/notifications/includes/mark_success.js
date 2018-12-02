var markSuccess = function (response, notification) {
    //console.log(response);
    if (response.action == 'read') {
        var mkClass = readNotificationClass;
        var rmClass = unreadNotificationClass;
        var action = 'unread';
        $('.unread').html("");

    } else {
        mkClass = unreadNotificationClass;
        rmClass = readNotificationClass;
        action = 'read';
    }
    //console.log(notification.closest(nfClassSelector));
    notification.closest(nfSelector).removeClass(rmClass).addClass(mkClass);
    notification.attr('data-mark-action', action);

    toggle_text = notification.attr('data-toggle-text') || 'Mark as ' + action;
    //notification.attr('data-toggle-text', notification.html());
    //notification.html(toggle_text);
    
    
    //$nf_count_badge.html(response.retrieved)
};
