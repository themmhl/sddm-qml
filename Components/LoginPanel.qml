import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12

Item {
    property var user: "jeff" //you can use the userPanel to show and change your users via: userPanel.username
    property var password: passwordField.text
    property var session: sessionPanel.session
    property var inputHeight: Screen.height * config.LoginScale * 0.25
    property var inputWidth: Screen.width * config.LoginScale
    SessionPanel {
        id: sessionPanel
        visible: false
    }

    Component.onCompleted: {
        passwordField.forceActiveFocus()
    }
    anchors.horizontalCenter: parent.horizontalCenter
    anchors.bottom: parent.bottom
    anchors.bottomMargin: 16
    height: 64
    //height: 100
    width: 300

    //  anchors.bottom: root.bottom
    PasswordPanel {
        id: passwordField

        height: 64
        //height: 100
        width: 300
        opacity: 0
        Behavior on opacity {
            NumberAnimation {
                duration: 1000
            }
        }
        onTextChange: {
            opacity = 1
        }
        onAccepted: {
            sddm.login(user, password, session)
            //sddm.login("jeff", "password", "Hyprland")
        }
    }

    Connections {
        target: sddm
        function onLoginSucceeded() {
            coverScreen.start()
        }
        function onLoginFailed() {
            passwordField.text = ""
        }
    }
}
