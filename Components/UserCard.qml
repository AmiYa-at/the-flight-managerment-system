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
    radius:10

    property var user_data:{
        "uid":"",
        "username":"",
        "email":"",
        "phone":"",
        "idcard":""
    }

    ColumnLayout {
        width: parent.width
        height: parent.height
        spacing: 20

        // 第一行：基本信息
        RowLayout {
            Layout.fillWidth: true
            spacing: 40

            ColumnLayout {
                Layout.preferredWidth: parent.width * 0.3
                spacing: 8

                HusText {
                    id: uidText
                    width: parent.width
                    text: "Uid：" + user_data.uid
                    font.pixelSize: 14
                }

                HusText {
                    id: usernameText
                    width: parent.width
                    text: "用户名：" + user_data.username
                    font.pixelSize: 14
                }
            }

            ColumnLayout {
                Layout.preferredWidth: parent.width * 0.4
                spacing: 8

                HusText {
                    id: emailText
                    width: parent.width
                    text: "邮箱地址：" + user_data.email
                    font.pixelSize: 14
                }

                HusText {
                    id: phoneText
                    width: parent.width
                    text: "手机号码：" + user_data.phone
                    font.pixelSize: 14
                }
            }
        }

        // 第二行：身份证信息
        RowLayout {
            Layout.fillWidth: true
            spacing: 40

            ColumnLayout {
                Layout.preferredWidth: parent.width * 0.7
                spacing: 8

                HusText {
                    id: idcardText
                    width: parent.width
                    text: "身份证号码：" + user_data.idcard
                    font.pixelSize: 14
                }
            }
        }

        // 第三行：操作按钮（居中对齐）
        RowLayout {
            Layout.fillWidth: true
            Layout.alignment: Qt.AlignHCenter

            HusButton {
                id: deleteButton
                Layout.preferredWidth: 120
                Layout.preferredHeight: 40
                text: "删除"
                colorBg: "red"
                font.pixelSize: 14

                onClicked: {
                    DBManager.deleteUser(user_data.uid)
                }
            }
        }

        // 添加一些空白区域
        Item {
            Layout.fillHeight: true
        }
    }


}
