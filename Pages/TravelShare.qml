import QtQuick
import QtQuick.Layouts
import HuskarUI.Basic
import QtQuick.Controls
import QtQuick.Effects
import QtQml
import com.flight.db 1.0
import QtQuick.Dialogs
ColumnLayout{
    Layout.fillWidth: true
    Layout.fillHeight: true
    spacing: 10

    property var share_data: {
        "title":"114",
        "content":"514",
        "image_url":""
    }

    //写界面时可替换
    Button {
            text: "选择图片"
            //anchors.centerIn: parent
            onClicked: fileDialog.open()
    }

    //上传图片对话框
    FileDialog {
        id: fileDialog
        title: "选择图片文件"
        nameFilters: ["图片文件 (*.jpg *.png)"]
        onAccepted: {

            share_data.image_url=selectedFile
            let uid=DBManager.getCurrentUserId()
            DBManager.publishPostWithPath(share_data.title,share_data.content,uid,share_data.image_url)
            console.log(share_data.image_url)
        }
    }

    //测试拉取图片
    property var image_source:{
        "source":""
    }
    Button{
        text:"拉取图片"
        onClicked:{
            let mp=DBManager.queryPostDetail(2,DBManager.getCurrentUserId())
            let base=DBManager.blobToImage(mp["img_blob"],mp["img_format"])
            image_source.source=base
            test.source=image_source.source
            console.log(image_source.source)
        }
    }

    Image{
        //anchors.fill:parent
        id:test
        width:100
        height:100
        fillMode: Image.PreserveAspectCrop
        source: image_source.source

    }







}

