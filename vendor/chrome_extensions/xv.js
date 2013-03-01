var BASE_URL="http://localhost:4567";
function notify(path,data,cb,err){
  var http=new XMLHttpRequest();
  http.open('post',BASE_URL+path,true);
  http.setRequestHeader("Content-Type","application/json");
  http.send(JSON.stringify(data));
  http.onreadystatechange=function(){
    if(http.readyState!=4)return;
    if(http.status==200){
      if(cb){
        var data=http.responseText;
        try{data=JSON.parse(data);}catch(e){}
        cb(data);
      }
    }else{
      if(err)err();
      else console.log('error',http.status);
    }
  }
}
function getUserInfo(){
  try{
    return JSON.parse(localStorage.user);
  }catch(e){}
}
function saveUserInfo(user){
  localStorage.user=JSON.stringify(user);
}
function notifyPageView(url){
  notify('/users/video_notify',{user:getUserInfo(),url:url},function(data){
    if(data.user)saveUserInfo(data.user);
    console.log(data)
  });
}

function openUserPage(cb){
  var user=getUserInfo();
  if(user)cb(BASE_URL+"users/"+user.uid);
  else{
    notify('/users/',null,function(user){
      saveUserInfo(user);
      cb(BASE_URL+"/users/"+user.uid);
    });
  }
}
