import QtQuick 2.15
import QtQuick.Layouts
import HuskarUI.Basic

Item {
    id:shared_card_template

    //暴露给外部传递的动态数据
    property var card_data:{
        "id": 0,
        "title": "灰灰意识新奇",
        "content": "卧槽元神？？？？",
        "image_url": ""
    }

    HusCard{
        id:card
        width: 450
        height: parent.height
        anchors.centerIn: parent
        title: qsTr(card_data.title)
        coverSource: card_data.image_url
        coverFillMode: Image.PreserveAspectFit
        bodyDescription: qsTr(card_data.content)
        colorBodyDescription: HusTheme.darkMode === HusTheme.Dark? "#FFFFFF" : "#000000"
        actionDelegate: Item {
            height: 470
            width: parent.width

            HusDivider{
                id:divider
                width: parent.width
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 40
            }

            RowLayout{
                height: 27
                width: parent.width
                anchors.bottom: parent.bottom
                Item {
                    Layout.preferredWidth: parent.width/2
                    Layout.fillHeight: true

                    HusIconText{
                        anchors.centerIn: parent
                        iconSource: HusIcon.LikeOutlined
                        iconSize: 30
                    }
                }
                Item {
                    Layout.preferredWidth: parent.width/2
                    Layout.fillHeight: true

                    HusDivider{
                        width: 1
                        height: parent.height
                        anchors.verticalCenter: parent.verticalCenter
                        orientation: Qt.Vertical
                    }
                    HusIconText{
                        anchors.centerIn: parent
                        iconSource: HusIcon.HeartOutlined
                        iconSize: 30
                    }
                }
            }
        }
    }
}
