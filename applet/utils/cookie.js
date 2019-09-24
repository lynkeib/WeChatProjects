const key = 'cookie'

function getSessionIDFromResponse(res){
  console.log('check cookies', res)
  var cookie = res.header['Set-Cookie']
  console.log('get cookie from response: ' + cookie)
  return cookie
}

function setCookieToStorage(cookie){
  try{
    wx.setStorageSync(key, cookie)
  }catch(e){
    console.log(e)
  }
}

function getCookieFromStorage(){
  var value = wx.getStorageSync(key)
  return value
}

module.exports = {
  getSessionIDFromResponse: getSessionIDFromResponse,
  setCookieToStorage: setCookieToStorage,
  getCookieFromStorage: getCookieFromStorage
}