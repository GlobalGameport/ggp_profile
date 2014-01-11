
(function($) {
	Drupal.ggp_board = {};


	Drupal.behaviors.ggp_board = {
		attach: function(context, settings) {
			var fids = (settings.ggp_board.ids != 0) ? '&forumids='+settings.ggp_board.ids : '';
			if($("#latestposts").data('run') != true) {
				$.ajax({
					type: "GET",
					url: document.location.protocol+'//'+settings.ggp_board.board_url+'/external.php?type=js&lastpost=true'+fids,
					dataType: "script",
					//scriptCharset: 'ISO-8859-1',
					success: function(s) {
						$(threads).each(function(i, e) {
							if (i <= settings.ggp_board.maxposts) {
								var latestpost = $('<a>').addClass('latestposts').attr('href', document.location.protocol+'//'+settings.ggp_board.board_url+'/showthread.php?t=' + e.threadid ).attr('target', '_blank');
								var wrapper = $('<span>').addClass('latestposts-wrapper');
								var title1 = new String();
								title1 = e.title;
								if (title1.length > 41){
										title1 = title1.slice(0,40) + "...";
								}
								var title = $('<span>').addClass('title').text(title1);
								var date = $('<span>').addClass('desc').text(e.threaddate + ' um ' + e.threadtime + ' Uhr, von ' + e.poster);
								wrapper.append(title);
								wrapper.append(date);
								latestpost.append(wrapper);
								$("#latestposts").append(latestpost);
							}
						});
						$("#latestposts").data('run', true);
						var path = (settings.ggp_board.more == "") ? '/index.php' : '/forumdisplay.php?'+settings.ggp_board.more;
						var uri = document.location.protocol+'//'+settings.ggp_board.board_url + path;
						$("#latestposts").append($('<span>').html('<a href="'+uri+'">Mehr...</a>'));

					}
				});
			}
		}
	}


})(jQuery);
