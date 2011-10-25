$("ul#demo_menu1").sidebar({
            position:"left", open:"click",
            events:{
                item : {
                    enter : function(){
                        $(this).find("a").animate({color:"darkblue"}, 350);
                    },
                    leave : function(){
                        $(this).find("a").animate({color:"white"}, 350);
                    }
                }
            }
 });
 
 
 


	
	

