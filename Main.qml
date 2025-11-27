import QtQuick
import QtQuick.Controls

Window {
    id:login_form
    width: 800
    height: 450
    visible: true
    //不允许改变窗口大小
    maximumHeight: 450
    minimumHeight: 450
    maximumWidth: 800
    minimumWidth: 800
    title: qsTr("登录")

    //动态背景
    Rectangle{
        id:background
        color:"Orange"
        x:400
        y:0
        z:1
        width:400
        height:450
        //初始状态为登录界面
        state:"login"

        //announcement是用于login和register
        Text{
            id:announcement
            anchors.centerIn: parent
            font.pointSize: 24
            text: qsTr("欢迎回来\n让我们继续前行")
            color: "white"
            visible: true
        }
        //admin_anouncement是用于admin_login
        Text{
            id:admin_anouncement
            anchors.top: parent.top
            anchors.horizontalCenter: parent.horizontalCenter
            font.pointSize: 24
            text: qsTr("管理员登录")
            color: "white"
            visible: false
        }

        //共三个状态：登录界面、注册界面、管理员登录界面
        states:[
            State{
                name:"login"
                PropertyChanges{
                    target:background
                    color:"Orange"
                    x:400
                    y:0
                    width:400
                    height:450

                }
                PropertyChanges{
                    target:announcement
                    text: qsTr("欢迎回来\n让我们继续前行")
                }
                PropertyChanges{
                    target:admin_anouncement
                    visible: false
                }
            },
            State{
                name:"register"
                PropertyChanges{
                    target:background
                    color:"Green"
                    x:0
                    y:0
                    width:400
                    height:450
                }
                PropertyChanges{
                    target:announcement
                    text: qsTr("初次见面\n让我们一起出发")
                }
                PropertyChanges{
                    target:admin_anouncement
                    visible: false
                }
            },
            State{
                name:"admin_login"
                PropertyChanges{
                    target:background
                    color:"LightBlue"
                    x:0
                    y:0
                    width:800
                    height:450
                }
                PropertyChanges{
                    target:announcement
                    visible: false
                }
                PropertyChanges{
                    target:admin_anouncement
                    visible: true
                }
            }
        ]


        //改变状态
        transitions: [
            Transition {
                from: "*"
                to: "register"
                ColorAnimation{target:background; property: "color"; duration: 300; }
                NumberAnimation{target:background; property: "x"; duration: 300; easing: Easing.InOutQuad; }
                NumberAnimation{target:background; property: "y"; duration: 300; easing: Easing.InOutQuad;}
                NumberAnimation{target:background; property: "width"; duration: 300; easing: Easing.InOutQuad; }
                NumberAnimation{target:background; property: "height"; duration: 300; easing: Easing.InOutQuad; }
            },
            Transition {
                from: "*"
                to: "login"
                ColorAnimation{target:background; property: "color"; duration: 300; }
                NumberAnimation{target:background; property: "x"; duration: 300; easing: Easing.InOutQuad; }
                NumberAnimation{target:background; property: "y"; duration: 300; easing: Easing.InOutQuad;}
                NumberAnimation{target:background; property: "width"; duration: 300; easing: Easing.InOutQuad; }
                NumberAnimation{target:background; property: "height"; duration: 300; easing: Easing.InOutQuad; }
            },
            Transition {
                from: "*"
                to: "admin_login"
                ColorAnimation{target:background; property: "color"; duration: 300; }
                NumberAnimation{target:background; property: "x"; duration: 300; easing: Easing.InOutQuad; }
                NumberAnimation{target:background; property: "y"; duration: 300; easing: Easing.InOutQuad;}
                NumberAnimation{target:background; property: "width"; duration: 300; easing: Easing.InOutQuad; }
                NumberAnimation{target:background; property: "height"; duration: 300; easing: Easing.InOutQuad; }
            }
        ]

    }

    TextField{
        id:username
        placeholderText: qsTr("请输入用户名")
        font.pointSize: 15
        x:110
        y:120
        width:200
        background: Rectangle{
            color: "white"
            radius: 5
            border.width: 1
        }

        states:[
            State{
                name:"login"
                PropertyChanges{
                    target:username
                    x:110
                    y:120
                }
            },
            State{
                name:"register"
                PropertyChanges{
                    target:username
                    x:510
                    y:120
                }
            },
            State{
                name:"admin_login"
                PropertyChanges{
                    target:username
                    x:300
                    y:150
                }
            }
        ]

        transitions:[
            Transition{
                from: "*"
                to: "login"
                NumberAnimation{target:username; property: "x"; duration: 300; easing: Easing.InOutQuad; }
                NumberAnimation{target:username; property: "y"; duration: 300; easing: Easing.InOutQuad; }
            },
            Transition{
                from: "*"
                to: "register"
                NumberAnimation{target:username; property: "x"; duration: 300; easing: Easing.InOutQuad; }
                NumberAnimation{target:username; property: "y"; duration: 300; easing: Easing.InOutQuad; }
            },
            Transition{
                from: "*"
                to: "admin_login"
                NumberAnimation{target:username; property: "x"; duration: 300; easing: Easing.InOutQuad; }
                NumberAnimation{target:username; property: "y"; duration: 300; easing: Easing.InOutQuad; }
            }
        ]
    }

    TextField{
        id:password
        placeholderText: qsTr("请输入密码")
        font.pointSize: 15
        x:110
        y:180
        width:200
        background: Rectangle{
            color: "white"
            radius: 5
            border.width: 1
        }
        echoMode: TextInput.Password

        states:[
            State{
                name:"login"
                PropertyChanges{
                    target:password
                    x:110
                    y:180
                }
            },
            State{
                name:"register"
                PropertyChanges{
                    target:password
                    x:510
                    y:180
                }
            },
            State{
                name:"admin_login"
                PropertyChanges{
                    target:password
                    x:300
                    y:210
                }
            }
        ]

        transitions:[
            Transition{
                from: "*"
                to: "login"
                NumberAnimation{target:password; property: "x"; duration: 300; easing: Easing.InOutQuad; }
                NumberAnimation{target:password; property: "y"; duration: 300; easing: Easing.InOutQuad; }
            },
            Transition{
                from: "*"
                to: "register"
                NumberAnimation{target:password; property: "x"; duration: 300; easing: Easing.InOutQuad; }
                NumberAnimation{target:password; property: "y"; duration: 300; easing: Easing.InOutQuad; }
            },
            Transition{
                from: "*"
                to: "admin_login"
                NumberAnimation{target:password; property: "x"; duration: 300; easing: Easing.InOutQuad; }
                NumberAnimation{target:password; property: "y"; duration: 300; easing: Easing.InOutQuad; }
            }
        ]
    }

    Button{
        id:login_button
        text: qsTr("登录")
        x:110
        y:300
        z:2
        width:200
        height:40
        background: Rectangle{
            color: "white"
            radius: 5
            border.width: 1
        }



        onClicked: {
            if(background.state=="login"||background.state=="admin_login")
            {
                console.log("login")
            }
            else
            {
                background.state="login"
                username.state="login"
                password.state="login"
            }

        }


    }

    Button{
        id:register_button
        text: qsTr("注册")
        x:510
        y:300
        z:2
        width:200
        height:40
        background: Rectangle{
            color: "white"
            radius: 5
            border.width: 1
        }

        onClicked: {
            if(background.state=="register"||background.state=="admin_login")
            {
                console.log("register")
            }
            else
            {
                background.state="register"
                username.state="register"
                password.state="register"
            }
        }


    }


    Button{
        id:admin_login_button
        text: qsTr("管理员登录")
        x:0
        y:0
        z:2
        width:100
        height:40
        background: Rectangle{
            color: "white"
            radius: 5
            border.width: 1
        }

        onClicked:{
            if(background.state!="admin_login")
            {
                background.state="admin_login"
                username.state="admin_login"
                password.state="admin_login"
                admin_login_button.text="返回"
                password.z=2
                username.z=2
            }
            else
            {
                background.state="login"
                username.state="login"
                password.state="login"
                admin_login_button.text="管理员登录"
                password.z=0
                username.z=0
            }
        }
    }
}

