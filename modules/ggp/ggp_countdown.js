
(function($) {

  Drupal.behaviors.ggp_board = {
    attach: function(context, settings) {
      $("#countdown").countdown({
              date: settings.ggp_countdown.date,
              format: "on"
      },
      function() {
              // callback function
      });
    }
  }


})(jQuery);