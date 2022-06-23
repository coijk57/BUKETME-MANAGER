$(function() {

    $(".basic").on("click", function() {
    console.log("basic1");
        if(!$(".basic").data("checked")) {
            $(".basic").css({border: "1px solid #f1592a", borderRadius: "10px"});
            $(".basic").data("checked", true);
            $(".standard").css("border","1px solid #fff");
            $(".premium").css("border","1px solid #fff");
            console.log("basic");
            $(".membership-input").val('basic');
        }
        else if($(".basic").data("checked")) {
            //$(".basic").css("border","1px solid #fff");
            $(".basic").data("checked", false);
        }
    });

	$(".standard").on("click", function() {
        if(!$(".standard").data("checked")) {
            $(".standard").css({border: "1px solid #f1592a", borderRadius: "10px"});
            $(".standard").data("checked", true);
            $(".basic").css("border","1px solid #fff");
            $(".premium").css("border","1px solid #fff");
          
            $(".membership-input").val('standard');
        }
        else if($(".standard").data("checked")) {
            $(".standard").css("border","1px solid #fff");
            $(".standard").data("checked", false);
        }
    });
     $(".premium").on("click", function() {
        if(!$(".premium").data("checked")) {
            $(".premium").css({border: "1px solid #f1592a", borderRadius: "10px"});
            $(".premium").data("checked", true);
            $(".basic").css("border","1px solid #fff");
            $(".standard").css("border","1px solid #fff");
            $(".membership-input").val('premium');
        }
        else if($(".premium").data("checked")) {
            $(".premium").css("border","1px solid #fff");
            $(".premium").data("checked", false);
        }
    });    
});


//            $(this).css("border", "1px solid #f1592a");
//                 $(this).css("border","1px solid #fff");
