var events={};
var BASE_URL="http://e-share.dev";

function post(path,data,cb,err){
  var http=new XMLHttpRequest();
  http.open('post',BASE_URL+path,true);
  http.setRequestHeader("Content-Type","application/json");
  http.send(JSON.stringify(data));
  http.onreadystatechange=function(){
    if(http.readyState!=4)return;
    if(200<=http.status&&http.status<300){
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
  try{return JSON.parse(localStorage.user);}catch(e){}
}
function saveUserInfo(user){
  localStorage.user=JSON.stringify(user);
}

function openWindow(url){
  chrome.tabs.create({'url':url});
}

events.notify_page_view=function(url){
  var viewdata={url:url};
  var user=getUserInfo();
  if(user){viewdata.uid=user.uid;viewdata.token=user.token}
  post('/watch_histories.json',viewdata,function(data){
    if(data.user)saveUserInfo(data.user);
    console.log(data);
  });
}
 
function openUserPage=function(){
  var user=getUserInfo();
  if(user)openWindow(BASE_URL+"/users/"+user.uid);
  else{
    post('/users.json',null,function(user){
      saveUserInfo(user);
      openWindow(BASE_URL+"/users/"+user.uid);
    });
  }
}


chrome.extension.onRequest.addListener(function(message,sender,callback){
  var ev=events[message.event];
  if(ev)ev(message.data)
});

chrome.browserAction.onClicked.addListener(function(tab){
  openUserPage();
});
