import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQml.Models 2.12

import "components"

Item {
    id: root
    height: Screen.height
    width: Screen.width
    Component.onCompleted: {
        passwordField.forceActiveFocus()
    }
    Image {
        id: background
        anchors.fill: parent
        fillMode: Image.PreserveAspectCrop
        source: config.Background
        asynchronous: false
        cache: true
        mipmap: true
        clip: true
    }

    Text {
        id: clockLabel
        text: Qt.formatTime(new Date(), "hh\nmm")
        font.pointSize: 320
        color: "#BB9AF7"
        font.family: "Space Grotesk Bold" //config.Font //change dis mf to some real good shit twin.
        //also the height of space between hh and mm is too much
        //preciate it gng
        //font.weight: 800
        font.bold: true
        horizontalAlignment: Text.AlignHCenter
        anchors.centerIn: parent
        anchors.verticalCenterOffset: -64
        lineHeight: 0.64
        Timer {
            interval: 1000
            running: true
            repeat: true
            onTriggered: clockLabel.text = Qt.formatTime(new Date(), "hh\nmm")
        }
    }

    // Date
    Text {
        text: Qt.formatDate(new Date(), "dddd, MMMM d")
        font.pointSize: 18
        color: "#BB9AF7"
        font.family: config.Font
        horizontalAlignment: Text.AlignHCenter
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.topMargin: 120
        anchors.top: clockLabel.bottom
    }

    // Username / Password Login Panel
    LoginPanel {
        id: loginPanel
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 16
        height: 64
        //height: 100
        width: 300
    }
}
