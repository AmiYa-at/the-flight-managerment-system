import QtQuick 2.15
import QtQuick.Layouts
import QtQuick.Controls
import HuskarUI.Basic
import com.flight.globalVars
import com.flight.db 1.0

HusRectangle{
    width:parent.width
    height:parent.height
    color:HusTheme.darkMode?"#FF1F1F1F":"#FFE0E0E0"

    property var user_data:{
        "uid":"",
        "username":"",
        "email":"",
        "phone":"",
        "idcard":""
    }


    RowLayout{
        //fillHeight: true
        //fillWidth: true
        width:parent.width
        height:parent.height
        spacing:10
        HusText{
            id:uidText
            width:30
            text:"Uid："+user_data.uid
        }

        HusText{
            id:usernameText
            width:30
            text:"用户名："+user_data.username
        }

        HusText{
            id:emailText
            width:50
            text:"邮箱地址："+user_data.email
        }

        HusText{
            id:phoneText
            width:50
            text:"手机号码："+user_data.phone
        }

        HusText{
            id:idcardText
            width:50
            text:"身份证号码："+user_data.idcard
        }

        HusButton{
            id:deleteButton
            width:20
            text:"删除"
            colorBg: "red"
            onClicked: {
                DBManager.deleteUser(user_data.uid)
            }
        }
    }
}
