 var params={};
 params.mainGemPrice=0;
 params.zuanshiGemPrice=0;
 params.kzsGemPrice=0;
 params.kpsGemPrice=0;
 params.lzGemPrice=0;
 params.inlayPrice=0;
 params.chainPrice=0;
 $(function(){
	 $(".mainGem_btn").click(function(){
		 if($(".mainGem").css("display")=='none'){
			 $(".mainGem").show();
		 }else{
			 $(".mainGem").hide();
			 params.mainGemPrice=0;
		 }
	 })
/*	 $(".partsGem_btn").click(function(){
		 if($(".partsGem").css("display")=='none'){
			 $(".partsGem").show();
		 }else{
			 $(".partsGem").hide();
			 params.inlayPrice=0;
		 }
	 })*/
	 $(".zuanshiGem_btn").click(function(){
		 if($(".zuanshiGem").css("display")=='none'){
			 $(".zuanshiGem").show();
		 }else{
			 $(".zuanshiGem").hide();
			 params.zuanshiGemPrice=0;
		 }
	 })
	 $(".kzsGem_btn").click(function(){
		 if($(".kzsGem").css("display")=='none'){
			 $(".kzsGem").show();
		 }else{
			 $(".kzsGem").hide();
			 params.kzsGemPrice=0;
		 }
	 })
	 $(".kpsGem_btn").click(function(){
		 if($(".kpsGem").css("display")=='none'){
			 $(".kpsGem").show();
		 }else{
			 $(".kpsGem").hide();
			 params.kpsGemPrice=0;
		 }
	 })
	 $(".lzGem_btn").click(function(){
		 if($(".lzGem").css("display")=='none'){
			 $(".lzGem").show();
		 }else{
			 $(".lzGem").hide();
			 params.lzGemPrice=0;
		 }
	 })
	 
 })
 function h(str){
	 if("chain"==str){
		 params.chainPrice=0; 
	 }else if("mainGem"==str){
		 params.mainGemPrice=0;
	 }else if("partsGem"==str){
		 params.inlayPrice=0;
	 }else if("zuanshiGem"==str){
		 params.zuanshiGemPrice=0;
	 }else if("kzsGem"==str){
		 params.kzsGemPrice=0;
	 }else if("kpsGem"==str){
		 params.kpsGemPrice=0;
	 }else if("lzGem"==str){
		 params.lzGemPrice=0;
	 }
	 var value=$("."+str+"_btn").val();
	 $("."+str+"_btn").val(value.replace('取消','增加'));
	 $("."+str).hide();
 }
 
