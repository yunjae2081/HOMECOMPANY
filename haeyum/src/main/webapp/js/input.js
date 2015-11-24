$(function () {
  $('input, textarea').each(function() {
        $(this).on('focus', function() {
          $(this).parent('.input').addClass('active');
        });

        $(this).on('blur', function() {
            if ($(this).val().length == 0) {
                $(this).parent('.input').removeClass('active');
            }
        });
        if ($(this).val() != '') $(this).parent('.input').addClass('active');
    });
});





$(document).ready(function() {

  // Default dropdown action to show/hide dropdown content
  $('.js-dropp-action').click(function(e) {
    e.preventDefault();
    $(this).toggleClass('js-open');
    $(this).parent().next('.dropp-body').toggleClass('js-open');
  });

  // Using as fake input select dropdown
  $('label').click(function() {
    $(this).addClass('js-open').siblings().removeClass('js-open');
    $('.dropp-body,.js-dropp-action').removeClass('js-open');
  });
  // get the value of checked input radio and display as dropp title
  $('input[name="lCategory"]').change(function() {
    var value = $("input[name='lCategory']:checked").val();
    switch(value) {
      case "1":
        value = "뷰티 & 패션"
        break;
      case "2":
        value = "교과목"
        break;
      case "3":
        value = "음악 & 공연"
        break;
      case "4":
        value = "IT"
        break;
      case "5":
        value = "미술 & 공예"
        break;
      case "6":
        value = "스포츠"
        break;
      case "7":
        value = "요리"
        break;
      case "8":
        value = "외국어"
        break;
      case "9":
        value = "게임"
        break;
      case "10":
        value = "Etc"
        break;
    }
    $('.js-value').text(value);
  });

});