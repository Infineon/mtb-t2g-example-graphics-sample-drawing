/*
This is a UI file (.ui.qml) that is intended to be edited in Qt Design Studio only.
It is supposed to be strictly declarative and only uses a subset of QML. If you edit
this file manually, you might introduce QML code that is not supported by Qt Design Studio.
Check out https://doc.qt.io/qtcreator/creator-quick-ui-forms.html for details on .ui.qml files.
*/

import QtQuick
import Constants

Rectangle {
    id: rectangle1
    width: Constants.width
    height: Constants.height
    color: "#d7f5ec"

    Rectangle {
        id: rectangle
        width: 416
        height: 256
        color: "#ffffff"
        radius: 0
        anchors.verticalCenter: parent.verticalCenter
        anchors.verticalCenterOffset: 49
        anchors.horizontalCenterOffset: -161
        anchors.horizontalCenter: parent.horizontalCenter
        gradient: Gradient {
            GradientStop {
                position: 0.0
                color: "#fb0404"
            }
            GradientStop {
                position: 0.5
                color: "#e3ffeb12"
            }
            GradientStop {
                position: 1.5
                color: "#02ff00"
            }
        }
        Image
        {
            id: iFX_LOGO_600
            width: 498
            height: 249
            anchors.verticalCenter: parent.verticalCenter
            source: "images/IFX_LOGO_600.png"
            anchors.verticalCenterOffset: 46
            anchors.horizontalCenterOffset: 302
            anchors.horizontalCenter: parent.horizontalCenter
            /* fillMode: Image.PreserveAspectFit */
        }
    }

    Text {
        id: _text
        x: 20
        y: 17
        text: qsTr("Graphics Sample Drawing ")
        font.pixelSize: 25
    }
}

