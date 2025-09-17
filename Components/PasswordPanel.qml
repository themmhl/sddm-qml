import QtQuick 2.12
import QtQuick.Controls 2.12
import QtGraphicalEffects 1.12
import QtQml.Models 2.12

Item {
    id: root
    property string text: ""
    signal accepted
    signal textChange
    onFocusChanged: if (focus)
                        textbox.forceActiveFocus()
    Rectangle {
        id: rootrect
        anchors.fill: parent
        color: "#19a8a8a8"
        //color: "#33BA68C8"
        radius: height / 2 //material you design guidelines
        border.width: 2
        border.color: "#BA68C8"

        TextInput {
            id: textbox
            text: root.text
            //placeholderText: "wus ur password gng?"
            anchors.centerIn: parent
            anchors.fill: parent
            color: "white"
            font.pointSize: 14
            horizontalAlignment: TextInput.AlignHCenter
            verticalAlignment: TextInput.AlignVCenter
            z: 2
            echoMode: TextInput.Password
            passwordCharacter: "•"
            passwordMaskDelay: 1000
            onAccepted: root.accepted()
            onFocusChanged: {
                if (focus) {
                    mouseincolor.running = true
                    rootrect.color.a = 0.18
                    rootrect.border.width = 5
                } else {
                    mouseincolor.running = false
                    rootrect.border.color = "#BA68C8"
                    rootrect.border.width = 2
                    rootrect.color.a = 0.1
                }
            }
            onTextChanged: {
                root.text = text
                root.textChange()
            }
        }
        SequentialAnimation {
            id: mouseincolor
            PropertyAnimation {
                target: rootrect
                property: "border.color.hsvHue"
                from: 0.5
                to: 0.9
                duration: 1250
            }
            PropertyAnimation {
                target: rootrect
                property: "border.color.hsvHue"
                from: 0.9
                to: 0.5
                duration: 1250
            }
            loops: Animation.Infinite
        }
        PropertyAnimation {
            id: mousein
            target: rootrect
            property: "color.a"
            from: 0.1
            to: 0.18
            duration: 150
        }

        PropertyAnimation {
            id: mouseout
            target: rootrect
            property: "color.a"
            from: 0.18
            to: 0.1
            duration: 150
        }


        /*
        RectangularShadow {
            anchors.fill: rootrect
            offset.x: 0
            offset.y: 0
            radius: rootrect.radius
            blur: 10
            spread: 5
            color: Qt.lighter(rootrect.color, 1.3)
        }
*/
        MouseArea {
            id: mouse
            hoverEnabled: true
            cursorShape: Qt.IBeamCursor
            anchors.fill: parent
            onEntered: if (!textbox.focus)
                           mousein.start()
            onExited: if (!textbox.focus)
                          mouseout.start()
        }
    }
}
