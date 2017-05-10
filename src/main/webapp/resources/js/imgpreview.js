
this.imagePreview = function(cls, base){	
	console.log('imagePreview init');
		xOffset = -5; //-20
		yOffset = 5;  // 40
		
    $(cls).on('mouseenter',function(e,a,b,c,d){
    	//console.log(e,a,b,c,d);
        //this.t = this.title;
        //this.title = "";
	    var c = (this.t != "") ? "<br/>" + this.t : "";
        $(base).append("<p id='preview'><img src='"+ $(this).data('img') +"' alt='Image preview' />"+ c +"</p>");
        $("#preview")
            .css("top",(e.pageY - xOffset) + "px")
            .css("left",(e.pageX + yOffset) + "px")
            .fadeIn("slow");
    }/*,
	
    function(){
        // this.title = this.t;
        $("#preview").remove();

    }*/
    ).on('mouseleave',function(e,a,b,c,d){
    	//console.log(e,a,b,c,d);
        // this.title = this.t;
        $("#preview").remove();

    }).on('mousemove',function(e,a,b,c,d){
    	//console.log(e,a,b,c,d);
        var horisonEndPos = e.pageX+$('#preview').outerWidth(true);
        var vertiEndPos = e.pageY+$('#preview').outerHeight(true);
        
        var broWidth = $(window).width();
        var broHeight = $(window).height();
        
        if(horisonEndPos>broWidth){
            $("#preview")
            //.css("top",(e.pageY - xOffset) + "px")
            .css("left",(e.pageX + yOffset-(horisonEndPos-broWidth)) + "px")
            .fadeIn("slow");
        } else {
            $("#preview")
            //.css("top",(e.pageY - xOffset) + "px")
            .css("left",(e.pageX + yOffset) + "px")
            .fadeIn("slow");
        }
        
        if(vertiEndPos>broHeight){
            $("#preview")
            .css("top",(e.pageY + xOffset-(vertiEndPos-broHeight)) + "px")
            //.css("left",(e.pageX + yOffset-(horisonEndPos-broWidth)) + "px")
            //.fadeIn("slow");
        } else {
            $("#preview")
            .css("top",(e.pageY - xOffset) + "px")
            //.css("left",(e.pageX + yOffset) + "px")
            //.fadeIn("slow");
        }
        
    });
};