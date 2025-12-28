import QtQuick
import QtQuick.Layouts
import HuskarUI.Basic


ColumnLayout{
    function handle()
    {
        let orders=DBManager.queryMyOrders(DBManager.getCurrentUserId())
    }
}
