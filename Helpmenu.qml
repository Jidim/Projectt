import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.12

Dialog {
    id: helpmenu
    signal closeManual()
    ColumnLayout {
        Text {
            text: qsTr("Зелёный контейнер предназначен для утилизации стекла\n")
            color: "green"
        }
        Text {
            text: qsTr("Чёрный контейнер предназначен для утилизации пищевых продуктов\n")
            color: "black"
        }
        Text {
            text: qsTr("Оранжевый контейнер предназначен для утилизации пластика и металла\n")
            color: "orange"
        }
        Text {
            text: qsTr("Синий контейнер предназначен для утилизации макулатуры\n")
            color: "blue"
        }
        Button {
            text: "Закрыть справку"
            onClicked: {
                closeManual();
            }
        }
    }
}
