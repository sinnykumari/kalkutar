import QtQuick 2.2
import QtQuick.Window 2.1
import QtQuick.Controls 1.2
import QtQuick.Controls.Styles 1.2
import QtQuick.Layouts 1.1

Window {
    id: root
    visible: true
    property bool equalpressed: false
    property string result

    ColumnLayout {
        id: foo
        anchors { fill: parent; margins: 20 }
        spacing: 10

        TextArea {
            id: textArea
            Layout.preferredHeight: 256
            Layout.fillWidth: true
            text: ""
        }

        GridLayout {
            id: grid
            Layout.fillHeight: true
            Layout.fillWidth: true
            columns: 4

            Button {
                id: button0
                text: "0"; Layout.fillWidth: true; Layout.fillHeight: true
                onClicked: digitPress(text)
            }
            Button {
                id: button1
                text: "1"; Layout.fillWidth: true; Layout.fillHeight: true
                onClicked: digitPress(text)
            }
            Button {
                id: button2
                text: "2"; Layout.fillWidth: true; Layout.fillHeight: true
                 onClicked: digitPress(text)
            }
            Button {
                id: buttoncancel
                text: "cancel"; Layout.fillWidth: true; Layout.fillHeight: true
                onClicked: {
                    if (equalpressed) {
                        textArea.text = ""
                        equalpressed = false
                    }
                    textArea.remove(0, textArea.length)
                }
            }
            Button {
                id: button3
                text: "3" ; Layout.fillWidth: true; Layout.fillHeight: true
                onClicked: digitPress(text)
            }
            Button {
                id: button4
                text: "4"; Layout.fillWidth: true; Layout.fillHeight: true
                onClicked: digitPress(text)
            }
            Button {
                id: button5
                text: "5"; Layout.fillWidth: true; Layout.fillHeight: true
                onClicked: digitPress(text)
            }
            Button {
                id: buttondel
                text: "DEL"; Layout.fillWidth: true; Layout.fillHeight: true

                onClicked: {
                    if (equalpressed) {
                        textArea.text = ""
                        equalpressed = false
                    }
                    textArea.remove(textArea.length -1, textArea.length)
                }
            }
            Button {
                id: button6
                text: "6"; Layout.fillWidth: true; Layout.fillHeight: true
                onClicked: digitPress(text)
            }
            Button {
                id: button7
                text: "7"; Layout.fillWidth: true; Layout.fillHeight: true
                onClicked: digitPress(text)
            }
            Button {
                id: button8
                text: "8"; Layout.fillWidth: true; Layout.fillHeight: true
                onClicked: digitPress(text)
            }
            Button {
                id: button9
                text: "9"; Layout.fillWidth: true; Layout.fillHeight: true
                onClicked: digitPress(text)
            }
            Button {
                id: buttonplus
                text: "+"; Layout.fillWidth: true; Layout.fillHeight: true
                onClicked: operatorPress(text)
            }
            Button {
                id: buttonminus
                text: "-"; Layout.fillWidth: true; Layout.fillHeight: true
                onClicked: operatorPress(text)
            }
            Button {
                id: buttonmul
                text: "*"; Layout.fillWidth: true; Layout.fillHeight: true
                onClicked: operatorPress(text)
            }
            Button {
                id: buttondiv
                text: "/"; Layout.fillWidth: true; Layout.fillHeight: true
                onClicked: operatorPress(text)
            }

            Button {
                id: buttondec
                text: "."; Layout.fillWidth: true; Layout.fillHeight: true; Layout.columnSpan: 2
                onClicked: {
                    if (equalpressed) {
                        textArea.text = result
                        equalpressed = false
                    }
                    if (!isDecimalAvailable(textArea.text)) {
                        textArea.text = textArea.text + buttondec.text
                    }
                }
            }
            Button {
                id: buttonequal
                text: "="; Layout.fillWidth: true; Layout.fillHeight: true; Layout.columnSpan: 2
                onClicked:{
                    equalpressed = true
                    result = eval(textArea.text)
                    textArea.append(result)
                }
            }

        }
    }

    function isLastCharOperator(lastChar) {
        if (lastChar === "+" || lastChar === "-" ||
                lastChar === "*" || lastChar === "/") {
            return true
        } else {
            return false
        }
    }

    function isDecimalAvailable(textData) {
        if (textData.indexOf(".") > -1) {
            return true
        } else {
            return false
        }
    }

    function digitPress(digit) {
        if (equalpressed) {
            textArea.text = ""
            equalpressed = false
        }
        textArea.text = textArea.text + digit
    }

    function operatorPress(text) {
        if (equalpressed) {
            textArea.text = result
            equalpressed = false
        }
        var lastChar =  textArea.getText(textArea.length - 1, textArea.length)
        if (root.isLastCharOperator(lastChar)) {
            textArea.remove(textArea.length - 1, textArea.length)
            textArea.insert(textArea.length , text)
        } else {
                textArea.text = textArea.text + text
        }
    }
}
