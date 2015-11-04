/**
 * multiDialog
 * liuzy
 * 2015-10-30
 */

(function( $ ) {
	
}( jQuery ));

function openURL(url, title,width, height ) {
	var jwidth = 500,jheight = 400;
	var jtitle = "Bavlo-Window";
	if(title != undefined){
		jtitle = title;
	}
	if(width != undefined){
		jwidth = width;
	}
	if(height != undefined){
		jheight = height;
	}
	api = $.fn.MultiDialog({
		dialog: {
			title: jtitle,
			resizeOnWindowResize: true,
			resizeAccordingToViewport: true,
			width:jwidth,
			height:jheight
		}
	});
	api.openLink({
		href: url,
		type: "iframe"
	});
}

