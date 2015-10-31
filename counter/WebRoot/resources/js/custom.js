var WS = function(opt){

	var regexp = opt.regexp || /\S/,
		el = $(opt.el), 
			list = el.val().split(','),
			holder = $('<span class="words-split"></span>'),
			add = $('<div class="kezi"><a href="javascript:void(0)" class="words-split-add">+刻字</a></div>');

	for (var i = 0; i < list.length; i++) {
		holder.append( $('<a href="javascript:void(0)" class="fm-button">'+list[i]+'<em> </em></a>') );
	}

	el.hide().after( holder );
	holder.after(add);

	holder.on('click','a>em',function(){	//刪除
		$(this).parent().remove();
		el.val( holder.text().match(/\S+/g).join(',') )
	});
	
	add.on('click',function(){				//添加预处理
		$(this).hide();
		$(".zhanwei").append( $('<span class="lbl-input" contenteditable="true"/>') )
	});
	
	$(".zhanwei").on('blur','.lbl-input',function(){	//验证添加字段
		var t = $(this),v = t.text();
		if(v){
			t.remove();
			add.show();
			holder.append( $('<a href="javascript:void(0)" class="fm-button">'+v+'<em> </em></a>') );
			el.val( holder.text().match(/\S+/g).join(',') );
		}else{
			t.remove();
			add.show();
		}
	});
	
	holder.on('keydown','.lbl-input',function(e){
		switch(e.keyCode){
			case 13:
			case 27: $(this).trigger('blur');
		}
	});

}

WS({el:'#staticPath',regexp:/\w+\.\w+/});