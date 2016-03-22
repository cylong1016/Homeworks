function hide(el, offset) {
    var opacity = el.style.opacity||1;
    setTimeout(function() {
        el.style.opacity = String(parseFloat(opacity) - offset);
        parseFloat(el.style.opacity) > 0 && hide(el,offset);
    }, 20);
}

function del(id, hint, url) {
	$.ajax({
		type:"post",
		url:url,
		data:{//设置数据源 
			id: id
		},
		dataType:"json",
		success:function(data){
			var d = eval("(" + data + ")");
			hint.text(d.message);
			hint.css("visibility", "visible");
			hint.fadeIn("fast");
			hint.fadeOut(3000);	// 几秒后消失
			$("#" + id).hide(1000);
		},
		error:function(){
			alert("系统异常，请稍后重试！");
		}
	})
}

function upd(data, hint, url) {
	$.ajax({
		type : "post",
		url : url,
		data : data,
		cache : false,
		dataType : "json",
		success : function(data) {
			var d = eval("(" + data + ")");
			hint.text(d.message);
			hint.css("visibility", "visible");
			hint.fadeIn("fast");
			hint.fadeOut(3000);	// 几秒后消失
			window.location.reload(); //刷新当前页面.
		},
		error : function(data) {
			alert("系统异常，请稍后重试！");
		}
	});  
}

function msghint(message, hint) {
	hint.text(message);
	hint.css("visibility", "visible");
	hint.fadeIn("fast");
	hint.fadeOut(3000);	// 几秒后消失
}