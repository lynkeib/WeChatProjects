const app = getApp()
const imageUrl = app.globalData.serverUrl + app.globalData.apiVersion + '/service/image'

Page({
  data: {
    // 需要上传的图片
    needUploadFiles: [],
    // backupedFiles每个元素四个字段 name, md5, path, isDownloaded
    // 已下载的备份图片
    downloadedBackupedFiles: []
  },

  // 选择图片上传
  chooseImage: function (e) {
    var that = this;
    wx.chooseImage({
      sizeType: ['original', 'compressed'], // 可以指定是原图还是压缩图，默认二者都有
      sourceType: ['album', 'camera'], // 可以指定来源是相册还是相机，默认二者都有
      success: function (res) {
        // 返回选定照片的本地文件路径列表，tempFilePath可以作为img标签的src属性显示图片
        that.setData({
          needUploadFiles: that.data.needUploadFiles.concat(res.tempFilePaths)
        });
      }
    })
  },

  onLoad: function () {
    this.downloadAllFromRemote()
  },

  // 下载所有的已备份图片
  downloadAllFromRemote: function () {
    var that = this
    wx.request({
      url: app.globalData.serverUrl + app.globalData.apiVersion + '/service/image/list',
      method: 'GET',
      success: function (res) {
        var imageList = res.data.data
        for (var i = 0; i < imageList.length; i++) {
          var imageItem = imageList[i]
          that.downloadFile(imageItem)
        }
      }
    })
  },

  // 长按确认函数
  longTapConfirm: function (e) {
    var that = this
    var confirmList = ["Delete"]
    wx.showActionSheet({
      itemList: confirmList,
      success: function (res) {
        if (res.cancel) {
          return
        }
        var imageIndex = e.currentTarget.dataset.index
        var imageItem = that.data.downloadedBackupedFiles[imageIndex]
        var newList = that.data.downloadedBackupedFiles
        console.log('new List', newList)
        newList.splice(imageIndex, 1)
        console.log('after new List', newList)
        that.setData({
          downloadedBackupedFiles: newList
        })
        that.deleteBackup(imageItem)
      }
    })
  },

  // 长按删除待上传图片
  longTapConfirmWaiting:function(e){
    var that = this
    var confirmList = ["Delete"]
    wx.showActionSheet({
      itemList: confirmList,
      success: function(res){
        if(res.cancel){
          return
        }
        var imageIndex = e.currentTarget.dataset.index
        var imageItem = that.data.needUploadFiles[imageIndex]
        var newList = that.data.needUploadFiles
        newList.splice(imageIndex, 1)
        that.setData({
          needUploadFiles: newList
        })

      }
    })
  },

  // 上传图片文件
  uploadFiles: function () {
    var that = this
    that.setData({
      newBackupedFiles: []
    })
    for (var i = 0; i < this.data.needUploadFiles.length; i++) {
      var file = this.data.needUploadFiles[i]
      wx.uploadFile({
        url: app.globalData.serverUrl + app.globalData.apiVersion + '/service/image',
        filePath: file,
        name: 'test',
        success: function (res) {
          var res = JSON.parse(res.data)
          var md5 = res.data[0].md5
          var name = res.data[0].name
          var newImageItem = {
            "md5": md5,
            "name": name
          }
          that.downloadFile(newImageItem)
        }
      })
    }
    wx.showToast({
      title: 'Uploded',
    })
    this.setData({
      needUploadFiles: []
    })
  },

  // 下载图片
  downloadFile: function (imgItem) {
    var that = this
    var downloadUrl = imageUrl + '?md5=' + imgItem.md5
    wx.downloadFile({
      url: downloadUrl,
      method:"GET",
      success: function (res) {
        var filepath = res.tempFilePath
        console.log('filepath', filepath)
        var newDownloadedBackupedFiles = that.data.downloadedBackupedFiles
        imgItem.path = filepath
        newDownloadedBackupedFiles.unshift(imgItem)
        that.setData({
          downloadedBackupedFiles: newDownloadedBackupedFiles
        })
        console.log('newDOwnload', newDownloadedBackupedFiles)
      }
    })
  },

  // 删除图片
  deleteBackup: function (imgItem) {
    console.log('delete a backup file.' + imgItem)
    wx.request({
      url: imageUrl + '?md5=' + imgItem.md5,
      method: 'DELETE',
      success: function (res) {
        console.log(res)
        wx.showToast({
          title: 'Deleted',
        })
      }
    })
  },
});