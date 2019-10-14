//index.js
//获取应用实例
const app = getApp()
const cookieUtil = require('../../utils/cookie.js')
const authUtil = require('../../utils/auth.js')

Page({
  data: {
    motto: 'Hello World',
    userInfo: {},
    hasUserInfo: false,
    canIUse: wx.canIUse('button.open-type.getUserInfo'),
    message:"Hello World, Hello Django",
    array:[
      {message:"Hello World"},
      {message:"Hello Django"}
    ]
  },

  //事件处理函数
  bindViewTap: function() {
    wx.navigateTo({
      url: '../logs/logs'
    })
  },

  onLoad: function () {
    if (app.globalData.userInfo) {
      this.setData({
        userInfo: app.globalData.userInfo,
        hasUserInfo: true
      })
    } else if (this.data.canIUse){
      // 由于 getUserInfo 是网络请求，可能会在 Page.onLoad 之后才返回
      // 所以此处加入 callback 以防止这种情况
      app.userInfoReadyCallback = res => {
        this.setData({
          userInfo: res.userInfo,
          hasUserInfo: true
        })
      }
    } else {
      // 在没有 open-type=getUserInfo 版本的兼容处理
      wx.getUserInfo({
        success: res => {
          app.globalData.userInfo = res.userInfo
          this.setData({
            userInfo: res.userInfo,
            hasUserInfo: true
          })
        }
      })
    }
  },

  // getUserInfo: function(e) {
  //   console.log(e)
  //   app.globalData.userInfo = e.detail.userInfo
  //   this.setData({
  //     userInfo: e.detail.userInfo,
  //     hasUserInfo: true
  //   })
  // }
  updateData:function(){
    // 请求后台刷新数据
    var that = this
    var cookie = cookieUtil.getCookieFromStorage()
    var header = {}
    header.Cookie = cookie
    wx.showLoading({
      title: '加载中',
    })
    wx.request({
      url: app.globalData.serverUrl + app.globalData.apiVersion + '/service/weather',
      header:header,
      success:function(res){
        console.log("loading weather")
        console.log(res)
        that.setData({
          weatherData:res.data.data
        })
        wx.hideLoading()
      }
    })
    wx.request({
      url: app.globalData.serverUrl + app.globalData.apiVersion + '/service/constellation',
      header: header,
      success: function (res) {
        console.log("loading constellation")
        that.setData({
          constellationData: res.data.data
        })
        wx.hideLoading()
      }
    })
    wx.request({
      url: app.globalData.serverUrl + app.globalData.apiVersion + '/service/stock',
      header: header,
      success: function (res) {
        console.log("loading stock")
        that.setData({
          stockData: res.data.data
        })
        wx.hideLoading()
      }
    })
  },

  onPullDownRefresh:function(){
    var that = this

    var promise = authUtil.getStatus(app)

    promise.then(function(status){
      if (status) {
        that.setData({
          isAuthorized: true
        })
        that.updateData()
      } else {
        that.setData({
          isAuthorized: false
        })
        wx.showToast({
          title: '清先授权登录',
        })}
    })
  // }
    // var cookie = cookieUtil.getCookieFromStorage()
    // var header = {}
    // header.Cookie = cookie
    // wx.request({
    //   url:app.globalData.serverUrl + app.globalData.apiVersion + '/auth/status',
    //   header:header,
    //   success:function(res){
    //     var data = res.data.data
    //     if(data.is_authorized == 1){
    //       that.setData({
    //         isAuthorized:true
    //       })
    //       that.updateData()
    //     }else{
    //       that.setData({
    //         isAuthorized: false
    //       })
    //       wx.showToast({
    //         title: '清先授权登录',
    //       })
    //     }
    //   }
    // })
  }
})
