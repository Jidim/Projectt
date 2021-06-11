import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.12

Window {
    id: w
    width: 640
    height: 530
    visible: true
    title: qsTr("Trash utilization")
    Image {
        id: morg
        visible: true
        anchors.fill: parent
        source: "morgen.png"
    }
    function newGamef() {
        toolbar.i = 0;
        t.stop();
        trash.visible = false;
        start.visible = true;
    }

    function plus() {
        trash.color = helper.color3();
        if (t.k > 1) t.k--;
        toolbar.i++;
        trash.y = 50;

    }

    function utilization() {
        if (trash.y === w.height - dumpster.height - trash.height + 15)
        {
            if ((trash.color === dumpster.color) && (trash.x === dumpster.x + dumpster.width/2 - trash.width/2)) plus()
            else if ((trash.color === dumpster2.color) && (trash.x === dumpster2.x + dumpster2.width/2 - trash.width/2)) plus()
            else if ((trash.color === dumpster3.color) && (trash.x === dumpster3.x + dumpster3.width/2 - trash.width/2)) plus()
            else if ((trash.color === dumpster4.color) && (trash.x === dumpster4.x + dumpster4.width/2 - trash.width/2)) plus()
            else {
                trash.color = helper.color3();
                trash.y = 50;
            }
        }
    }

    function trim() {
        if (trash.color === "green") trash.trimer = "paper1.jpg"
        else if (trash.color === "black") trash.trimer = "food1.jpg"
        else if (trash.color === "blue") trash.trimer = "glass1.png"
        else return "plastik2.jpg"
    }

    Rectangle {
        id: start
        x: w.width/2 - width/2
        y: w.height/2 - height/2
        color:  "skyblue"
        height: 100
        width: 150
        Text {
            anchors.centerIn: parent
            font.pixelSize: 20
            text: "Старт"
        }
        MouseArea {
            anchors.fill: parent
            onClicked: {
                morg.visible = false;
                trash.color = helper.color3();
                trash.y = 50;
                trash.visible = true;
                parent.visible = false;
                t.start();
            }
        }
    }

    Toolbar {
        y: 0
        width: w.width
        id: toolbar
        onNewGame: {
            newGamef();
        }
        onQuitApp: {
            Qt.quit();
        }
        onHelpList: {
            if ((toolbar.i > 0) || (trash.y !== 50)) t.stop();
            h.visible = true
        }
    }

    Trash {
        visible: false;
        color: helper.color3()
        property string trimer: trim()
        Image {
            anchors.fill: parent
            source: "food1.jpg"
        }
        id: trash
        y: 50
        onCaugth: {
            utilization();
        }
    }

    Dumpster {
        x: w.width/4-w.width/8 - width/2
        id: dumpster
        color: "green"
        onClick: {
            trash.x = dumpster.x + dumpster.width/2 - trash.width/2
        }
        Image {
            id: green
            anchors.centerIn: parent
            source: "green.png"
            sourceSize.width: 160
        }
    }
    Dumpster {
        x: w.width/2-w.width/8 - width/2
        id: dumpster2
        color: "blue"
        Image {
            id: blue
            source: "blue.png"
            anchors.centerIn: parent
            sourceSize.width: 160
        }
        onClick: {
            trash.x = dumpster2.x + dumpster2.width/2 - trash.width/2
        }
    }
    Dumpster {
        x: w.width/4*3-w.width/8 - width/2
        id: dumpster3
        color: "orange"
        Image {
            id: orange
            source: "orange.png"
            anchors.centerIn: parent
            sourceSize.width: 160
        }
        onClick: {
            trash.x = dumpster3.x + dumpster3.width/2 - trash.width/2
        }
    }
    Dumpster {
        x: w.width-w.width/8 - width/2
        id: dumpster4
        color: "black"
        Image {
            id: black
            source: "black.jpg"
            anchors.centerIn: parent
            sourceSize.width: 160
        }
        onClick: {
            trash.x = dumpster4.x + dumpster4.width/2 - trash.width/2
        }
    }

    Timer {
        property int k: 20
        id: t
        repeat: true
        interval: k
        running: false
        onTriggered: {
            trash.y++;
        }
    }
    Helpmenu {
        id: h
        visible: false
        anchors.centerIn: parent
        onCloseManual: {
            visible = false;
            if ((toolbar.i > 0) || (trash.y !== 50)) t.start();
        }
    }
}
