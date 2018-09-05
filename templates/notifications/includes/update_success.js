var updateSuccess = function (response) {
    var notification_box = $(nfBoxListClassSelector);
    var notifications = response.notifications;
    $.each(notifications, function (i, notification) {
        notification_box.prepend(notification.html);
    });
};

// var $nf_count_badge = $('.your-nf-count-badge')
// $nf_count_badge.html(response.retrieved)