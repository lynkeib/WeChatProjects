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

  // 请求后台,更新menu数据
  updateMenuData: function(){
    var that = this
    
    console.log(app.globalData)
    
    wx.request({
      url: app.globalData.serverUrl + app.globalData.apiVersion + '/service/menu',
      success: function(res){
        var menuData = res.data.data
        // console.log(res.data.data)
        that.setData({
          grids: menuData
        })
      }
    })
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
  }
});