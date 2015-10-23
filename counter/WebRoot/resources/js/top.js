function Show_Hidden(){
	var trid=document.getElementById("ed1");
	var tridd=document.getElementById("tr1");    
	if(tridd.style.display=="none"){
        trid.style.display='none';
        tridd.style.display='block';
    }else{
        tridd.style.display='none';
    }
}

function EditShow_Hidden(){
	var trid=document.getElementById("ed1");
	var tridd=document.getElementById("tr1");
    if(trid.style.display=="none"){
        tridd.style.display='none';
        trid.style.display='block';
    }else{
        trid.style.display='none';
    }
}

function PicShow_Hidden(){
	var picid=document.getElementById("pic");
    if(picid.style.display=="none"){
        picid.style.display='block';
    }else{
        picid.style.display='none';
    }
}

function Pic1Show_Hidden(){
	var picidd=document.getElementById("pic1");
	if(picidd.style.display=="none"){
        picidd.style.display='block';
    }else{
        picidd.style.display='none';
    }
}

function Pic2Show_Hidden(){
	var pic2id=document.getElementById("pic2");
	if(pic2id.style.display=="none"){
        pic2id.style.display='block';
    }else{
        pic2id.style.display='none';
    }
}

function KxsShow_Hidden(){
	var kxsid=document.getElementById("kxs");
	if(kxsid.style.display=="none"){
        kxsid.style.display='block';
    }else{
        kxsid.style.display='none';
    }	
	window.ontouchmove=function(e){
            e.preventDefault && e.preventDefault();
            e.returnValue=false;
            e.stopPropagation && e.stopPropagation();
            return false;
    }
}

	function shwoOrHidden(){
		if(document.getElementById("d1").style.display=='block'){
		document.getElementById("d1").style.display='none';
		}else if(document.getElementById("d1").style.display=='none'){
		document.getElementById("d1").style.display='block';
		}
	}
	
	function shwoOrHidden1(){
		if(document.getElementById("d2").style.display=='block'){
		document.getElementById("d2").style.display='none';
		}else if(document.getElementById("d2").style.display=='none'){
		document.getElementById("d2").style.display='block';
		}
	}
	
	function shwoOrHidden2(){
		if(document.getElementById("d3").style.display=='block'){
		document.getElementById("d3").style.display='none';
		}else if(document.getElementById("d3").style.display=='none'){
		document.getElementById("d3").style.display='block';
		}
	}
	
	function shwoOrHidden3(){
		if(document.getElementById("d4").style.display=='block'){
		document.getElementById("d4").style.display='none';
		}else if(document.getElementById("d4").style.display=='none'){
		document.getElementById("d4").style.display='block';
		}
	}
	
	function shwoOrHidden4(){
		if(document.getElementById("d5").style.display=='block'){
		document.getElementById("d5").style.display='none';
		}
	}
	
	function shwoOrHidden5(){
		if(document.getElementById("d6").style.display=='block'){
		document.getElementById("d6").style.display='none';
		}
	}
	
	function shwoOrHidden6(){
		if(document.getElementById("d7").style.display=='block'){
		document.getElementById("d7").style.display='none';
		}
	}
	
	function shwoOrHidden7(){
		if(document.getElementById("d8").style.display=='block'){
		document.getElementById("d8").style.display='none';
		}
	}
	
	function shwoOrHidden8(){
		if(document.getElementById("d9").style.display=='block'){
		document.getElementById("d9").style.display='none';
		}
	}
	
	
	
