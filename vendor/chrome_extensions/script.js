var notifyURL="http://localhost:4567";
function notify(path,data,cb,err){
  var http=new XMLHttpRequest();
  http.open('post',notifyURL+path,true);
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
//}}}}}end end end

console.log('start')

notify('/',{x:1,y:2,url:location.href},function(data){console.log(data)});
