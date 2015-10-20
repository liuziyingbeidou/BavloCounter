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
		}else if(document.getElementById("d3").style.display=='none'){
		document.getElementById("d4").style.display='block';
		}
	}
	
