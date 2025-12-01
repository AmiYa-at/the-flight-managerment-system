import the_flight_managerment_system 1.0
import QtQuick
import HuskarUI.Basic
import QtQuick.Controls 2.15
import QtQuick.Layouts
import QtQuick.Effects
import QtQml

ApplicationWindow{
    id:contorlWindow
    visible:false

    Loader{
        id:windowLoader
        source:"Login.qml"
    }
}
