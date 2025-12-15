import QtQuick
import QtQuick.Layouts
import HuskarUI.Basic

ColumnLayout {
    Layout.fillWidth: true
    Layout.fillHeight: true
    spacing: 30

    RowLayout {
        id: searchRow
        Layout.preferredHeight: 30
        //Layout.minimumHeight: 30
        Layout.maximumHeight: 30
        Layout.alignment: Qt.AlignHCenter
        Layout.fillWidth: true
        Layout.topMargin: 30
        spacing: 30

        HusInput {
            id: search_my_flight_input
            Layout.preferredWidth: 300
            Layout.maximumWidth: 300
            Layout.fillHeight: true
            radiusBg.all: 5
        }

        HusIconButton {
            id: search_my_flight_button
            Layout.preferredWidth: 75
            Layout.maximumWidth: 75
            Layout.fillHeight: true
            radiusBg.all: 5
            iconSource: HusIcon.SearchOutlined
            text: qsTr("搜索")
        }
    }

    // 第二个RowLayout
    RowLayout {
        id: rectangleRow
        Layout.preferredHeight: 30
        Layout.maximumHeight: 30
        Layout.fillWidth: true

        HusSelect{
            Layout.preferredWidth: 200
            Layout.maximumHeight: 200
            Layout.fillHeight: true
            clearEnabled: false
            model: [
                {value:"",label:qsTr("起始地")},
                {value:"北京",label:qsTr("北京")},
                {value:"上海",label:qsTr("上海")}
            ]
        }
        HusSelect{
            Layout.preferredWidth: 200
            Layout.maximumWidth: 200
            Layout.fillHeight: true
            clearEnabled: false
            model:[
                {value:"",label:qsTr("目的地")},
                {value:"北京",label:qsTr("北京")},
                {value:"上海",label:qsTr("上海")}
            ]
        }
        HusDateTimePicker{
            Layout.preferredWidth: 300
            Layout.maximumWidth: 300
            Layout.fillHeight: true
            placeholderText: qsTr("请选择始发时间")
            format: qsTr("yyyy-MM-dd hh:mm:ss")
        }
    }
    HusDivider{
        Layout.fillWidth: true
    }

    // 添加一个Spacer来占据剩余空间，确保两个RowLayout不会拉伸
    Item {
        Layout.fillHeight: true
        Layout.fillWidth: true
    }
}
