  
  // Ajouter  function like
$(document).ready(function() {
    $('.like').click(function() {
    var pk;
        pk = $(this).attr('data-recipe-pk');
        $.get('/recipe/like/', {
            recipe_pk: pk
        }, function(data) {
            $('#count-like-'+pk).html(data);
            
        });
        return false;
    });

});


$(document).ready(function() {
    $('.likepost').click(function() {
    var pk;
        pk = $(this).attr('data-post-pk');
        $.get('/blog/like/', {
            post_pk: pk
        }, function(data) {
            $('#count-like-'+pk).html(data);
            
        });
        return false;
    });

});

$(document).ready(function() {
    $('.likevideo').click(function() {
    var pk;
        pk = $(this).attr('data-video-pk');
        $.get('/video/like/', {
            video_pk: pk
        }, function(data) {
            $('#count-like-'+pk).html(data);
            
        });
        return false;
    });

});

