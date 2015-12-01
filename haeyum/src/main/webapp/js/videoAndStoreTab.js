$(document).ready(function() {
    $('.box-list-btn ul.tabs1').addClass('active').find('> li:eq(0) > a').addClass('current');

    $('.box-list-btn ul.tabs1 li a').click(function(g) {
      $('.box-list-btn ul.tabs1 li a').removeClass('current');

      $(this).addClass('current');
    });

});