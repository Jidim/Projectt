import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Layouts 1.12

Rectangle {
    signal caugth
    id: trash
    height: 60
    width: 120
    x: w.width/2 - width/2
    onYChanged: {
        caugth();
    }

}
