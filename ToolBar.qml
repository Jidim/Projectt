import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.12

RowLayout {
    signal newGame()
    signal quitApp()
    signal helpList()

    property int i: 0

    Button {
        text: "Новая игра"
        onClicked: {
            newGame();
        }
    }
    TextField {
        id: score
        y: 0
        x: w.width/2 - width/2
        Layout.fillWidth: true
        text: i
    }
    Button {
        text: "Помощь"
        onClicked: {
            helpList();
        }
    }
    Button {
        text: "Выход"
        onClicked: {
            quitApp();
        }
    }
}
