
// 성별선택 이벤트
$(function() {
    // 성별선택 클릭 이벤트
    $(".male").on("click", function() {
        if(!$(".male").data("checked")) {
            $(".male").css({background: "azure", color: "rgb(26, 29, 41)"});
            $(".male").data("checked", true);
            $(".female").css({background: "rgb(26, 29, 41)", color: "#fff"});
            $(".female").data("checked", false);
            $(".gender-input").val('male');
        }
        
        else if($(".male").data("checked")) {
            $(".male").css({background: "rgb(26, 29, 41)", color: "#fff"});
            $(".male").data("checked", false);
        }
    });

    $(".female").on("click", function() {
        if(!$(".female").data("checked")) {
            $(".female").css({background: "azure", color: "rgb(26, 29, 41)"});
            $(".female").data("checked", true);
            $(".male").css({background: "rgb(26, 29, 41)", color: "#fff"});
            $(".male").data("checked", false);
             $(".gender-input").val('female');
        }
        else if($(".female").data("checked")) {
            $(".female").css({background: "rgb(26, 29, 41)", color: "#fff"});
            $(".female").data("checked", false);
        }
    });

    // 성별선택 마우스이벤트(over, out)
    /*$(".male").on("mouseover", function() {
        $(".male").css({background: "azure", color: "rgb(26, 29, 41)"});
    });

    $(".male").on("mouseout", function() {
        if(!$(".male").data("checked")) {
            $(".male").css({background: "rgb(26, 29, 41)", color: "#fff"});
        }
    });

    $(".female").on("mouseover", function() {
        $(".female").css({background: "azure", color: "rgb(26, 29, 41)"});
    });

    $(".female").on("mouseout", function() {
        if(!$(".female").data("checked")) {
            $(".female").css({background: "rgb(26, 29, 41)", color: "#fff"});
        }
    });*/
});


// 취향선택 이벤트
$(function() {
    $(".list-area").on("click", function() {
        if(!$(".list-area:eq(" + $(this).index() + ")").data("checked")) {
            $(".list-area:eq(" + $(this).index() + ")").css({background: "azure", color: "rgb(26, 29, 41)"});
            $(".list-area:eq(" + $(this).index() + ")").data("checked", true);
        }
        else if($(".list-area:eq(" + $(this).index() + ")").data("checked")) {
            $(".list-area:eq(" + $(this).index() + ")").css({background: "rgb(26, 29, 41)", color: "azure"});
            $(".list-area:eq(" + $(this).index() + ")").data("checked", false);
        }
    });

   /* $(".list-area").on("mouseover", function() {
        $(".list-area:eq(" + $(this).index() + ")").css({background: "azure", color: "rgb(26, 29, 41)"});
    });

    $(".list-area").on("mouseout", function() {
        if(!$(".list-area:eq(" + $(this).index() + ")").data("checked")) {
            $(".list-area:eq(" + $(this).index() + ")").css({background: "rgb(26, 29, 41)", color: "azure"});
        }
    });*/
});


// 기기선택 이벤트
/*$(function() {

    $(".list-item").on("click", function() {
        if(!$(".list-item:eq(" + $(this).index() + ")").data("checked")) {
            $(".list-item:eq(" + $(this).index() + ")").css({background: "steelblue", color: "rgb(26, 29, 41)", borderRadius: "10px"});
            $(".list-item:eq(" + $(this).index() + ")").data("checked", true);
        }
        else if($(".list-item:eq(" + $(this).index() + ")").data("checked")) {
            $(".list-item:eq(" + $(this).index() + ")").css({background: "rgb(26, 29, 41)", color: "#fff", borderRadius: "10px"});
            $(".list-item:eq(" + $(this).index() + ")").data("checked", false);
        }

    });

    $(".list-item").on("mouseover", function() {
        $(".list-item:eq(" + $(this).index() + ")").css({background: "steelblue", color: "rgb(26, 29, 41)", borderRadius: "10px"});
    });

    $(".list-item").on("mouseout", function() {
        if(!$(".list-item:eq(" + $(this).index() + ")").data("checked")) {
            $(".list-item:eq(" + $(this).index() + ")").css({background: "rgb(26, 29, 41)", color: "#fff", borderRadius: "10px"});
        }
    });
});*/


$(function() {

    $(".TV").on("click", function() {
        if(!$(".TV").data("checked")) {
            $(".TV").css({background: "steelblue", color: "rgb(26, 29, 41)", borderRadius: "10px"});
            $(".TV").data("checked", true);
            $(".COM").css({background: "rgb(26, 29, 41)", color: "#fff", borderRadius: "10px"});
            $(".TABLET").css({background: "rgb(26, 29, 41)", color: "#fff", borderRadius: "10px"});
            $(".CONSOLE").css({background: "rgb(26, 29, 41)", color: "#fff", borderRadius: "10px"});
            $(".device-input").val('TV');
        }
        else if($(".TV").data("checked")) {
            $(".TV").css({background: "rgb(26, 29, 41)", color: "#fff", borderRadius: "10px"});
            $(".TV").data("checked", false);
        }
    });

	$(".COM").on("click", function() {
        if(!$(".COM").data("checked")) {
            $(".COM").css({background: "steelblue", color: "rgb(26, 29, 41)", borderRadius: "10px"});
            $(".COM").data("checked", true);
            $(".TV").css({background: "rgb(26, 29, 41)", color: "#fff", borderRadius: "10px"});
            $(".TABLET").css({background: "rgb(26, 29, 41)", color: "#fff", borderRadius: "10px"});
            $(".CONSOLE").css({background: "rgb(26, 29, 41)", color: "#fff", borderRadius: "10px"});
            $(".device-input").val('COM');
        }
        else if($(".COM").data("checked")) {
            $(".COM").css({background: "rgb(26, 29, 41)", color: "#fff", borderRadius: "10px"});
            $(".COM").data("checked", false);
        }
    });
     $(".TABLET").on("click", function() {
        if(!$(".TABLET").data("checked")) {
            $(".TABLET").css({background: "steelblue", color: "rgb(26, 29, 41)", borderRadius: "10px"});
            $(".TABLET").data("checked", true);
            $(".COM").css({background: "rgb(26, 29, 41)", color: "#fff", borderRadius: "10px"});
            $(".TV").css({background: "rgb(26, 29, 41)", color: "#fff", borderRadius: "10px"});
            $(".CONSOLE").css({background: "rgb(26, 29, 41)", color: "#fff", borderRadius: "10px"});
            $(".device-input").val('TABLET');
        }
        else if($(".TABLET").data("checked")) {
            $(".TABLET").css({background: "rgb(26, 29, 41)", color: "#fff", borderRadius: "10px"});
            $(".TABLET").data("checked", false);
        }
    });    
     $(".CONSOLE").on("click", function() {
        if(!$(".CONSOLE").data("checked")) {
            $(".CONSOLE").css({background: "steelblue", color: "rgb(26, 29, 41)", borderRadius: "10px"});
            $(".CONSOLE").data("checked", true);
            $(".COM").css({background: "rgb(26, 29, 41)", color: "#fff", borderRadius: "10px"});
            $(".TABLET").css({background: "rgb(26, 29, 41)", color: "#fff", borderRadius: "10px"});
            $(".TV").css({background: "rgb(26, 29, 41)", color: "#fff", borderRadius: "10px"});
            $(".device-input").val('CONSOLE');
        }
        else if($(".CONSOLE").data("checked")) {
            $(".CONSOLE").css({background: "rgb(26, 29, 41)", color: "#fff", borderRadius: "10px"});
            $(".CONSOLE").data("checked", false);
        }
    });
});















