import QtQuick
import QtQuick.Layouts
import HuskarUI.Basic
import QtQuick.Controls
import "../Components"

ColumnLayout{
    Layout.fillWidth: true
    Layout.fillHeight: true
    spacing: 10

    property var search_data: {
        "flight_id":"",
        "departure":"",
        "destination":"",
        "depart_time":""
    }

    // 航班号结果
    ListModel{
        id:flightList
    }

    HusMessage{
        id:order_message
        z:999
        Layout.fillWidth: true
        Layout.alignment: Qt.AlignHCenter | Qt.AlignTop
    }

    ListView{
        id:lv
        Layout.fillHeight: true
        Layout.fillWidth: true
        clip: true
        Layout.topMargin: 30
        spacing: 5
        model: flightList
        ScrollBar.vertical: ScrollBar{
            id:verticalScrollBar
            policy: ScrollBar.AlwaysOn
            size:lv.visibleArea.heightRatio
            position: lv.visibleArea.yPosition
            active: true
        }

        delegate: MyFavouriteFlightCard{
            required property var modelData
            height: 150
            card_data: {
                "flight_id":modelData.Flight_id,
                "departure":modelData.Departure,
                "destination":modelData.Destination,
                "depart_time":modelData.depart_time,
                "arrive_time":modelData.arrive_time,
                "price":modelData.price,
                "total_seats":modelData.total_seats,
                "remain_seats":modelData.remain_seats,
                "status":modelData.status
            }
        }
    }


    Item{
        Layout.fillHeight: true
        Layout.fillWidth: true
    }

    Connections{
        target: DBManager

        function onOperateResult(success,message){
            if(success){
                if(message.includes("创建订单成功")){
                    order_message.success("购买成功!");
                }
                else if(message.includes("取消收藏成功")){
                    order_message.success("取消收藏成功!");
                }
            }
            else{
                order_message.error(message);
            }
            if((message.includes("取消收藏成功") || message.includes("创建订单成功")) && success){
                get_favourite_flights();
            }
        }

        function onOrderCreatedFailed(message){
            if(message.includes("该航班已取消，无法购买")){
                    order_message.error("该航班已取消，无法购买");
                }
        }
    }

    Component.onCompleted: {
        get_favourite_flights();
    }

    function get_favourite_flights(){
        var flights = DBManager.queryCollectedFlights(DBManager.getCurrentUserId());
        flightList.clear();
        for(let i=0;i<flights.length;++i){
            flightList.append(flights[i]);
        }
    }

}
