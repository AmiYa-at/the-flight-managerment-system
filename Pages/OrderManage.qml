import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import HuskarUI.Basic
import com.flight.db 1.0

import "../Components"

ColumnLayout{
    spacing:10
    Component.onCompleted: updateData()

    HusButton{
        id:updateButton
        text:"刷新"
        onClicked:{
            updateData()
        }
    }

    HusDivider{
        Layout.fillWidth: true
    }
    ListModel{
        id:orderList
    }

    ListView{
        Layout.fillHeight: true
        Layout.fillWidth: true
        spacing: 5
        model: orderList

        delegate: MyFlightCard{
            required property var modelData
            height: 150
            card_data: {
                "flight_id":modelData.flight_id,
                "departure":modelData.departure,
                "destination":modelData.destination,
                "depart_time":modelData.depart_time,
                "arrive_time":modelData.arrive_time,
                "price":modelData.price,
                "remain_seats":modelData.remain_seats,
                "status":modelData.f_status,
                "order_id":modelData.order_id
            }
        }
    }

    function updateData()
    {
        let orders=DBManager.queryAllOrders()
        orderList.clear()
        for(let i=0;i<orders.length;i++)
        {
            orderList.append(orders[i])
        }
    }

}
