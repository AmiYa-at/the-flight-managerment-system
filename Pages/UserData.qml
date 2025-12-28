import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import HuskarUI.Basic
import com.flight.db 1.0

ColumnLayout{
    Layout.fillWidth: true
    Layout.fillHeight: true
    spacing: 10

    HusRectangle{
        id:imageContainer
        height:110
        width:110
        color: hoverHandler.hovered ? "#FF999999" : "transparent"
        border.width: 0
        //anchors.horizontalCenter: parent.horizontalCenter
        HoverHandler{
            id:hoverHandler
            target: parent
        }
        TapHandler{
            target:parent
            onTapped: {
                console.log("haji")
            }
        }
        HusAvatar{
            id:userImage
            size:100
            anchors.centerIn: parent
            //imageSource:
        }
    }

    //用户名展示
    RowLayout{
        Layout.fillHeight: true
        Layout.fillWidth: true
        spacing :10
        HusText{
            text:"用户名:"
            font.pointSize: 12
        }
        HusInput{
            id:usernameInput
            width:200
            text:qsTr(DBManager.getCurrentUserName())
            placeholderText: "请输入用户名"

        }
    }

    //邮箱展示
    RowLayout{
        Layout.fillHeight: true
        Layout.fillWidth: true
        spacing:10
        HusText{
            text:"邮箱地址:"
            font.pointSize: 12
        }
        HusInput{
            id:emailInput
            width:200
            text:qsTr(DBManager.getCurrentUserEmail())
            placeholderText: "请输入邮箱地址"
        }
    }

    HusButton{
        id:button_save
        text:"保存"
        onClicked: saveData()

    }






    //查询并关系用户数据
    function updata()
    {
        usernameInput.text=qsTr(DBManager.getCurrentUserName())
        emailInput.text=qsTr(DBManager.getCurrentUserEmail())
    }

    //保存上传信息
    function saveData()
    {
        update()
    }
}
