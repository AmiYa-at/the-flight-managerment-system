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

    HusMessage{
        id:send_message
        z:999
        width:parent.width
        Layout.alignment: Qt.AlignHCenter | Qt.AlignTop
    }

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
                fileDialog.open()
                console.log("haji")
            }
        }
        HusAvatar{
            id:userImage
            size:100
            anchors.centerIn: parent
            imageSource:DBManager.blobToImage(DBManager.getUserAvatarBlob(DBManager.getCurrentUserId()),DBManager.getUserAvatarFormat(DBManager.getCurrentUserId()))
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
            Layout.preferredWidth: 300
            Layout.maximumWidth: 300
            text:DBManager.getCurrentUserName()
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
            Layout.preferredWidth: 300
            Layout.maximumWidth: 300
            text:DBManager.getCurrentUserEmail()
            placeholderText: "请输入邮箱地址"
        }
    }


    //手机号展示
    RowLayout{
        Layout.fillHeight: true
        Layout.fillWidth: true
        spacing:10
        HusText{
            text:"手机号:"
            font.pointSize: 12
        }
        HusInput{
            id:phoneInput
            Layout.preferredWidth: 300
            Layout.maximumWidth: 300
            text:DBManager.getCurrentUserPhone()
            placeholderText: "请输入手机号"
        }
    }

    //身份证号展示
    RowLayout{
        Layout.fillHeight: true
        Layout.fillWidth: true
        spacing:10
        HusText{
            text:"身份证号:"
            font.pointSize: 12
        }
        HusInput{
            id:idcardInput
            Layout.preferredWidth: 300
            Layout.maximumWidth: 300
            text:DBManager.getCurrentUserIdCard()
            placeholderText: "请输入身份证号"
        }
    }

    //上传头像照片
    FileDialog {
        id: fileDialog
        title: "选择图片文件"
        nameFilters: ["图片文件 (*.jpg *.png)"]
        onAccepted: {
            DBManager.uploadUserAvatar(DBManager.getCurrentUserId(),selectedFile)
            userImage.imageSource=DBManager.blobToImage(DBManager.getUserAvatarBlob(DBManager.getCurrentUserId()),DBManager.getUserAvatarFormat(DBManager.getCurrentUserId()))
        }
    }

    HusButton{
        id:button_save
        text:"保存"
        onClicked: saveData()

    }

    Item {
        Layout.fillHeight: true
        Layout.fillWidth: true
    }

    Connections{
        target: DBManager

        function onOperateResult(success,message){
            if(!success && message.includes("更新用户名失败")){
                send_message.error("用户名已存在");
                usernameInput.text = DBManager.getCurrentUserName();
            }
            else if(!success && message.includes("用户名不能为空")){
                send_message.error("用户名不能为空");
                usernameInput.text = DBManager.getCurrentUserName();
            }
            else if(success && message.includes("用户名更新成功")){
                send_message.success("用户名更新成功");
                usernameInput.text = DBManager.getCurrentUserName();
            }
        }

        function onUserEmailUpdated(success,message){
            if(!success && message.includes("更改失败：邮箱格式错误！")){
                send_message.error("邮箱格式错误");
                emailInput.text = DBManager.getCurrentUserEmail();
            }
            else if(!success && message.includes("邮箱不能为空")){
                send_message.error("邮箱不能为空");
                emailInput.text = DBManager.getCurrentUserEmail();
            }
            else if(success && message.includes("邮箱更新成功")){
                send_message.info("邮箱更新成功");
                emailInput.text = DBManager.getCurrentUserEmail();
            }
        }

        function onUserPhoneUpdated(success,message){
            if(!success && message.includes("手机号不能出现非数字")){
                send_message.error("手机号不能出现非数字");
                phoneInput.text = DBManager.getCurrentUserPhone();
            }
            else if(success && message.includes("手机号更新成功")){
                send_message.info("手机号更新成功");
                phoneInput.text = DBManager.getCurrentUserPhone();
            }
        }

        function onUserIdCardUpdated(success,message){
            if(!success && message.includes("身份证号非法")){
                send_message.error("身份证号非法");
                idcardInput.text = DBManager.getCurrentUserIdCard();
            }
            else if(success && message.includes("身份证号更新成功")){
                send_message.info("身份证号更新成功");
                idcardInput.text = DBManager.getCurrentUserIdCard();
            }
        }
    }





    //查询并关系用户数据
    function updata()
    {
        usernameInput.text=DBManager.getCurrentUserName()
        emailInput.text=DBManager.getCurrentUserEmail()
        phoneInput.text=DBManager.getCurrentUserPhone()
        idcardInput.text=DBManager.getCurrentUserIdCard()
    }

    //保存上传信息
    function saveData()
    {
        //非法检测（写了

        if(usernameInput.text==="")
        {
            send_message.error("用户名不能为空！");
            return ;
        }
        else{
            DBManager.updateUserName(usernameInput.text)
        }

        if(emailInput.text==="")
        {
            send_message.error("邮箱不能为空！");
            return ;
        }
        else{
            DBManager.updateUserEmail(emailInput.text)
        }

        DBManager.updateUserIdCard(idcardInput.text)
        DBManager.updateUserPhone(phoneInput.text)
    }
}
