const coolUtil = require('cookie.js')

// auth logic

function buildHeader(){
  var cookie = coolUtil.getCookieFromStorage()
  var header = {}
  header.Cookie = cookie
  return header
}

/**
 * Query Status
 * 
 * @param app global unique app instance
 */
function getStatus(app){
  var url = app.globalData.serverUrl + app.globalData.apiVersion + '/auth/status'
  
  var header = buildHeader()
  var promise = new Promise(function(resolve, reject){
    wx.request({
      url: url,
      header: header,
      success: function(res){
        console.log('res in auth', res)
        if(res.data.data.is_authorized){
          resolve(true)
        }else{
          resolve(false)
        }
      }
    })
  })
  return promise
}

module.exports = {
  getStatus: getStatus
}