var CSRF_TOKEN=$("meta[name=csrf-token]").attr("content")
function csrf(hash){
  hash.authentication_token=CSRF_TOKEN;
  return hash;
}

//$(".fav_button").live('click',favClick);
function favClick(){
  var $this=$(this);
  var id=$this.attr("data-video-id");
  if($this.hasClass("faved")){
    $this.removeClass("faved");
    $.post('/favorite_videos/'+id,csrf({action:'destroy',_method:'delete'}));
  }else{
    $.post('/favorite_videos.json',csrf({id:id}));
    $this.addClass("faved");
  }
}


$(function(){$(".fav_button").click(favClick)})
