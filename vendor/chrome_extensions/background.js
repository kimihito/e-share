
chrome.browserAction.onClicked.addListener(function(tab){
  console.log(123);
  openUserPage(function(url){
    chrome.tabs.create({'url':url});
  });
});
