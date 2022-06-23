
$(function() {
	let favorites = $(".mypage-input").val().split(',');
	
	
	favorites.forEach(favorite=>
		$("#list-area-" + favorite).css({"background-color": "red"})
	);
	
    $(".list-area").on("click", function() {
    	let area = $(this)[0];
    	
    	
    	if(favorites.includes($(this).attr('id').split('-')[2])){ // 포함이 되어있어있는지 아닌지
    		$(this).css({"background-color": "rgb(26, 29, 41)"});
    		
    		favorites.splice(favorites.indexOf($(this).attr('id').split('-')[2]),1);
    	}else{
    		$(this).css({"background-color": "red"});
	    	favorites.push($(this).attr('id').split('-')[2]);
    	}
    	
    	$(".mypage-input").val(favorites);
    	
    	
    	
    	/*if($(".favorite-input").val() == ''){
    	$(".favorite-input").val($(this).attr('id').split('-')[2]);
    	}
    	else{
    	$(".favorite-input").val(
    	$(".favorite-input").val() + "," + $(this).attr('id').split('-')[2]);
    	}
    
        if(!$(".basic").data("checked")) {
            // $(".basic").css({border: "1px solid #f1592a", borderRadius: "10px"});
            
            $("#card-basic").css({"background-color": "red"});
            $("#card-standard").css({"background-color": "rgb(26, 29, 41)"});
            $("#card-premium").css({"background-color": "rgb(26, 29, 41)"});
            $(".basic").data("checked", true);
            $(".standard").data("checked", false);
            $(".premium").data("checked", false);
            //$(".standard").css("border","1px solid #fff");
            //$(".premium").css("border","1px solid #fff");
            console.log("basic");
            $(".membership-input").val('basic');
        }
        else if($(".basic").data("checked")) {
            //$(".basic").css("border","1px solid #fff");
            $(".basic").data("checked", false);
        }*/
    });
});
