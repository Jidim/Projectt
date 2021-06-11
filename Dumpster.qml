import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.12

Rectangle {
    signal click()
    id: dumpster
    x: w.width/2 - width/2
    y: w.height - height
    height: 120
    width: 100
    color: "orange"

    MouseArea {
        anchors.fill: parent
        onClicked: {
            parent.click();
        }
    }
}
