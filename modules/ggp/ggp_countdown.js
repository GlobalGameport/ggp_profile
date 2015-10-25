
(function($) {

  Drupal.behaviors.ggp_countdown = {
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
