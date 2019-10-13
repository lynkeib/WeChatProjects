const app = getApp()

Page({
  data: {
    grids: [{
      "name":"应用1"
    },{
      "name":"应用2"
    }]
  },
  // 生命周期函数-监听加载页面
  onLoad: function (options) {
    this.updateMenuData()
  },

  fillIconData: function(menuData){

    var pathPrefix = '../../resources/icons/application/'
    for (var index = 0; index < menuData.length; index++){
      var item = menuData[index]
      switch (item.app.application){
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
    
    if (!app.globalData.auth.isAuthorized) {
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
            var menuData = res.data.data

            if (res.data.data) {
              menuData = res.data.data
              menuData = that.fillIconData(menuData)
            } else {
              wx.showToast({
                title: '用户暂无应用，请点击添加！',
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

  onNavigatorTap: function(e){
    var index = e.currentTarget.dataset.index
    var appItem = this.data.grids[index]
    // console.log(this.data.grids[index])
    // console.log()
    if (appItem.app.application != 'constellation' & appItem.app.application != 'joke'){
    wx.navigateTo({
      url: '../' + appItem.app.application + '/' + appItem.app.application
      })}
      else{
      wx.navigateTo({
        url: '../service/service?type=' + appItem.app.application
      })
      }
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
  },

  moreApp: function () {
    console.log('moreApp')
    if (!app.globalData.auth.isAuthorized) {
      wx.showToast({
        title: '请先登录',
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
      title: '加载中',
    })
    this.updateMenuData()
    wx.hideLoading()
  }
});