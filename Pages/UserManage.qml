import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import HuskarUI.Basic
import com.flight.db 1.0

import "../Components"


ColumnLayout{
    spacing:10
    //fillHeight: true
    //fillWidth: true

    Component.onCompleted: updateData()
    HusButton{
        id:update
        text:"刷新"
    }

    HusDivider{
        Layout.fillWidth: true
    }
    ListModel{
        id:userList
    }

    ListView{
        Layout.fillHeight: true
        Layout.fillWidth: true
        spacing: 5
        model: userList

        delegate: UserCard{
            required property var modelData
            height: 150
            user_data: {
                "uid":modelData.Uid,
                "username":modelData.User_name,
                "email":modelData.Email,
                "phone":modelData.phone,
                "idcard":modelData.idcard
            }
        }
    }

    function updateData()
    {
        let users=DBManager.queryAllUser()
        userList.clear()
        for(let i=0;i<users.length;i++)
        {
            userList.append(users[i])
        }
    }
}
