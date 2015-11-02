/**
 * 弹框JS
 */
(function( $ ){
    $(function() {
    	
    });
})( jQuery );
function loadExtentFile(filePath, fileType){
    if(fileType == "js"){
        var oJs = document.create_rElement('script');        
        oJs.setAttribute("type","text/javascript");
        oJs.setAttribute("src", filename);//文件的地址 ,可为绝对及相对路径
        document.getElementsByTagName_r("head")[0].appendChild(oJs);//绑定
    }else if(fileType == "css"){
        var oCss = document.create_rElement("link"); 
        oCss.setAttribute("rel", "stylesheet"); 
        oCss.setAttribute("type", "text/css");  
        oCss.setAttribute("href", filename);
        document.getElementsByTagName_r("head")[0].appendChild(oCss);//绑定
    }
}