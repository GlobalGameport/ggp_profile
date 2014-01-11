(function($) {
	Drupal.ggp_theme_menu = {};
	Drupal.ggp_theme_menu.animation = {show:{}, hide:{}, count:0};

	Drupal.behaviors.ggp_theme_menu = {
		attach: function (context, settings) {
			// Sanitize by removing "expanded" on menus already marked "collapsed".
			$('li.collapsed.expanded').removeClass('expanded');

			$('ul.menu li:not(.leaf) span').click(
					function() {
						$(this).toggleClass('collapse expand').next().next().slideToggle('fast');
						$(this).parent('li').toggleClass('collapsed expanded');
						Drupal.ggp_theme_menu.cookieSet();
					}
				);
		}
	};

	/**
	 * Saves the dhtml_menu cookie.
	 */
	 Drupal.ggp_theme_menu.cookieSet = function() {
	   var collapsed = new Array();
	   var expanded = new Array();
	   $('li.collapsed').each(function() {
	     collapsed.push(this.id);
	   });
	   $('li.expanded').each(function() {
	     expanded.push(this.id);
	   });
	   document.cookie = 'Drupal.collapsed_menus=' + collapsed.join(',') + ';path=/';
	   document.cookie = 'Drupal.expanded_menus=' + expanded.join(',') + ';path=/';
	 }

	 Drupal.behaviors.backstretch = {
	 	attach: function (context, settings) {
	 		if (typeof settings.ggp_theme != 'undefined') {
	 			$.backstretch(settings.ggp_theme.background);
	 	  }
	 	}
	 };
})(jQuery);
