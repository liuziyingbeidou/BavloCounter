/**
 * multiDialog
 * liuzy
 * 2015-10-30
 */

(function( $ ) {
	
}( jQuery ));

function openURL(url, title,width, height ) {
	var jwidth = 500,jheight = 560;
	var jtitle = "Bavlo-Window";
	if(title != undefined && title != "" && title != null){
		jtitle = title;
	}
	if(width != undefined  && width != "" && width != null){
		jwidth = width;
	}
	if(height != undefined  && height != "" && height != null){
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

function closeMultiDlg(){
	
	$(".ui-dialog-titlebar-close").trigger('click');
}