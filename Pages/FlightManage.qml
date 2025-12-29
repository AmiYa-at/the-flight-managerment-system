import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import HuskarUI.Basic
import com.flight.db 1.0
import "../Components"
ColumnLayout{
    Layout.fillHeight: true
    Layout.fillWidth: true
    spacing:10
    HusDivider{
        Layout.fillWidth: true
    }
    ListModel{
        id:flightList
    }
    ListView{
        Layout.fillHeight: true
        Layout.fillWidth: true
        spacing: 5
        model: flightList

        delegate: FlightManageCard{
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

    //更新数据函数
    function updateData()
    {
        flightList.clear()
        let flights=DBManager.queryAllFlights()
        for(let i=0;i<flights.length;i++)
        {
            flightList.append(flights[i])
        }
    }

    //初始化
    Component.onCompleted: updateData()
}
