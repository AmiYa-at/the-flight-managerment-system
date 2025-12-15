import QtQuick 2.15

Item {
    id:flight_information_card

    property var card_data:{
        "flight_id":"",
        "departure":"",
        "destination":"",
        "depart_time":"",
        "arrive_time":"",
        "price":0,
        "total_seats":0,
        "remain_seats":0
    }
}
