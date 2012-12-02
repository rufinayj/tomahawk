import QtQuick 1.1
import tomahawk 1.0
import "tomahawkimports"

Item {
    id: root
    property int coverSize

    signal backClicked()

    Image {
        id: busyIndicator
        source: "../images/loading-animation.gif"
        anchors.centerIn: parent
        height: backButton.height
        width: height
        visible: mainView.loading
        RotationAnimation { target: busyIndicator; from: 360; to: 0; duration: 1500; running: visible; loops: Animation.Infinite }
    }

    CoverFlip {
        id: coverView
        anchors.fill: parent
        interactive: false

        backgroundColor: scene.color

        model: dynamicModel
        currentIndex: currentlyPlayedIndex

        onItemPlayPauseClicked: {
            mainView.playItem(index)
        }

        onItemClicked: {
            mainView.playItem(index)
        }

    }

    Item {
        anchors { top: parent.top; left: parent.left; bottom: parent.bottom }
        anchors.margins: titleText.height * 3
        width: scene.width / 2

        Column {
            anchors { left: parent.left; top: parent.top; right: parent.right }
            Text {
                id: titleText
                color: "white"
                font.pointSize: 18
                width: parent.width
                elide: Text.ElideRight
                text: mainView.title
            }
            Text {
                color: "white"
                font.pointSize: 14
                font.bold: true
                width: parent.width
                elide: Text.ElideRight
                opacity: .8
                text: generator.summary
            }
        }

    }
}

