// pages/homepage/homepage.js

const app = getApp()
const cookieUtil = require('../../utils/cookie.js')

Page({

  /**
   * 页面的初始数据
   */
  data: {

  },

  onReadCookies: function (){
    console.log(app.globalData.serverUrl + app.globalData.apiVersion + "/auth/test")
    wx.request({
      url: app.globalData.serverUrl + app.globalData.apiVersion + "/auth/test",
      method: "GET",
      success: function(res){
        var cookie = cookieUtil.getSessionIDFromResponse(res)
        console.log(cookie)
        cookieUtil.setCookieToStorage(cookie)

        var newCookie = cookieUtil.getCookieFromStorage()
        var header = {}
        header.Cookie = newCookie
        wx.request({
          url: app.globalData.serverUrl + app.globalData.apiVersion + "/auth/test2",
          method:"GET",
          header:header,
          success: function(res){

          }
        })
      }
    })
  },


  authorize: function(){
    var that = this
    wx.login({
      success: function(res){
        var code = res.code
        var appId = app.globalData.appId
        var nickname = app.globalData.userInfo.nickName
        that.setData({
          hasUserInfo:true,
          isLogin:true,
          userInfo: app.globalData.userInfo
        })
        console.log('in success', app.globalData.userInfo.nickName)
        wx.request({
          method:"POST",
          url: app.globalData.serverUrl + app.globalData.apiVersion + "/auth/authorize",
          data:{
            code:code,
            appId: appId,
            nickname: nickname
          },
          header: {
            'content-type':"application/json"
          },
          success:function(res){
              wx.showToast({
                title:"授权成功"
              })
              var cookie = cookieUtil.getSessionIDFromResponse(res)
              cookieUtil.setCookieToStorage(cookie)
              console.log(cookie)
          }
        })
      }
    })
  },

  onAuthorizeConfirm: function(res){
    var userInfo = res.detail.userInfo
    app.globalData.userInfo = userInfo
    console.log(res.detail.userInfo)
    console.log('global', app.globalData.userInfo)
    this.authorize()
  },

  onNavigatorTap:function(event){
    var cookie = cookieUtil.getCookieFromStorage()
    if (cookie.length == 0){
      wx.showToast({
        title: '尚未授权',
        icon: 'none'
      })
      return
    }

    console.log(event.currentTarget.dataset.type)
    var navigatorType = event.currentTarget.dataset.type

    if (navigatorType == 'focusCity'){
      navigatorType = 'city'
    } else if (navigatorType == 'focusStock'){
      navigatorType = 'stock'
    }else{
      navigatorType = 'constellation'
    }

    var url = '../picker/picker?type=' + navigatorType
    wx.navigateTo({
      url: url,
    })
  },

  logout: function(){
    var that = this
    var cookies = cookieUtil.getCookieFromStorage()
    var header = {}
    header.Cookie = cookies
    wx.request({
      url:app.globalData.serverUrl + app.globalData.apiVersion + '/auth/logout',
      method:"GET",
      header:{
        header:header
      },
      success: function(res){
        that.setData({
          isLogin:false,
          userInfo:null,
          hasUserInfo:false
        }),
        cookieUtil.setCookieToStorage(' ')
        app.setAuthStatus(false)
      } 
    })
  },

  getStatusFromRemote: function(){
    var that = this
    var cookie = cookieUtil.getCookieFromStorage()
    var header = {}
    header.Cookie = cookie
    wx.request({
      url : app.globalData.serverUrl + app.globalData.apiVersion + '/auth/status',
      method :"GET",
      header:header,
      success:function(res){
        if (res.data.data.is_authorized==1){
          console.log("登录状态")
        }else{
          console.log('Session过期，未登录状态')
        }
      }
    })
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {

  },

  /**
   * 生命周期函数--监听页面初次渲染完成
   */
  onReady: function () {

  },

  /**
   * 生命周期函数--监听页面显示
   */
  onShow: function () {

  },

  /**
   * 生命周期函数--监听页面隐藏
   */
  onHide: function () {

  },

  /**
   * 生命周期函数--监听页面卸载
   */
  onUnload: function () {

  },

  /**
   * 页面相关事件处理函数--监听用户下拉动作
   */
  onPullDownRefresh: function () {

  },

  /**
   * 页面上拉触底事件的处理函数
   */
  onReachBottom: function () {

  },

  /**
   * 用户点击右上角分享
   */
  onShareAppMessage: function () {

  }
})