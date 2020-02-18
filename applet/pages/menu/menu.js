const cookieUtil = require('../../utils/cookie.js')

const app = getApp()

Page({
  data: {
    grids: null,
  },
  // 生命周期函数-监听加载页面
  onLoad: function (options) {
    this.updateMenuData()
  },

  fillIconData: function(menuData){

    var pathPrefix = '../../resources/icons/application/'
    for (var index = 0; index < menuData.length; index++){
      var item = menuData[index]
      switch (item.application){
        case 'weather':
          item.icon = pathPrefix + 'application-weather.png'
          console.log(item.icon)
          break
        case 'stock':
          item.icon = pathPrefix + 'application-stock.png'
          break
        case 'joke':
          item.icon = pathPrefix + 'application-joke.png'
          break
        case 'constellation':
          item.icon = pathPrefix + 'application-constellation.png'
          break
        case 'backup':
          item.icon = pathPrefix + 'application-images.png'
          break
      }
    }
    return menuData
  },

  // 请求后台,更新menu数据
  updateMenuData: function(){
    var that = this
    
    console.log(app.globalData)
    
    if (!app.getAuthStatus) {
      wx.request({
        url: app.globalData.serverUrl + app.globalData.apiVersion + '/service/menu/list',
        header: {
          'content-type': 'application/json' // default value
        },

        success(res) {
          var menuData = res.data.data
          menuData = that.fillIconData(menuData)
          // set menu Data
          that.setData({
            grids: menuData,
          })
        }
      })
    } else{
        var cookie = cookieUtil.getCookieFromStorage()
        var header = {}
        header.Cookie = cookie
        wx.request({
          url: app.globalData.serverUrl + app.globalData.apiVersion + '/service/menu/user',
          header: header,
          success: function(res){
            var menuData = []
            
            if (res.data.data) {
              menuData = res.data.data
              console.log('menuData after having user', menuData)
              menuData = that.fillIconData(menuData)
            } else {
              wx.showToast({
                title: 'There is no application right now, please add one！',
                icon: 'none'
              })
            }
            console.log(menuData)
            // console.log(res.data.data)
            that.setData({
              grids: menuData
            })
        }
      })
    }
  },

  // onNavigatorTap: function(e){
  //   var index = e.currentTarget.dataset.index
  //   var appItem = this.data.grids[index]
    // console.log(this.data.grids[index])
    // console.log()
    // if (appItem.app.application != 'constellation' & appItem.app.application != 'joke'){
    // wx.navigateTo({
    //   url: '../' + appItem.app.application + '/' + appItem.app.application
    //   })}
    //   else{
    //   wx.navigateTo({
    //     url: '../service/service?type=' + appItem.app.application
    //   })
    //   }
    // if (appItem.app.application=='weather'){
      
    //   wx.navigateTo({
    //     url: '../weather/weather'
    //   })
    // }
    // if (appItem.app.application == 'backup') {
    //   // consule.log(appItem)
    //   wx.navigateTo({
    //     url: '../backup/backup'
    //   })
    // }
  // },

  onNavigatorTap: function (e) {
    var index = e.currentTarget.dataset.index
    var item = this.data.grids[index]
    if (item.application == 'weather') {
      wx.navigateTo({
        url: '../weather/weather',
      })
    } else if (item.application == 'backup') {
      wx.navigateTo({
        url: '../backup/backup',
      })
    } else if (item.application == 'stock') {
      wx.navigateTo({
        url: '../stock/stock'
      })
    } else if (item.application == 'joke') {
      wx.navigateTo({
        url: '../service/service?type=joke'
      })
    } else if (item.application == 'constellation') {
      wx.navigateTo({
        url: '../service/service?type=constellation',
      })
    }
  },

  moreApp: function () {
    console.log('moreApp')
    console.log('moreAPP calling', app.globalData)
    if (!app.getAuthStatus) {
      console.log(app.globalData)
      wx.showToast({
        title: 'Please login first',
        icon: 'none'
      })
      return
    }
    wx.navigateTo({
      url: '../applist/applist?userMenu=' + JSON.stringify(this.data.grids),
    })
  },

  onPullDownRefresh: function () {
    wx.showLoading({
      title: 'Loading',
    })
    console.log('Updating Menu')
    this.updateMenuData()
    wx.hideLoading()
  }
});