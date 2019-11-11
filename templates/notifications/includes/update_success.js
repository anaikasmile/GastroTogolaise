var updateSuccess = function (response) {
    var notification_box = $(nfBoxListClassSelector);
    console.log(notification_box);
    var notifications = response.notifications;
    var unread_count = response.unread_count;

    $.each(notifications, function (i, notification) {
        notification_box.prepend(notification.html);
           
    });

    console.log(response);

    if (unread_count > 0) {
        // Element where display count
        // Mine is like this:
        // <span class="label label-primary label-indicator animation-floating notification-counter"></span>
        $('.notif').show();

        $('.nf-count').show();
        $('.nf-count').text(unread_count);
    } else if (unread_count == 0) {
        $('.notif').hide();

        $('.nf-count').hide();

        $('.notification-box-list').html("");

    }

};



