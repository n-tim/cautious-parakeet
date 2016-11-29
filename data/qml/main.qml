import QtQuick.Controls 1.1
import QtQuick 2.2
import QtQml 2.2


ApplicationWindow {
    visible: true

    width: 400
	height: 300
		
	TextArea {
		anchors {
			top: parent.top
			bottom: exitButton.top
			left: parent.left
			right: parent.right
		}
		text: appHelper.getHelloString();
	}

	Button {
		id: exitButton
		text: "exit"
		onClicked: {
			Qt.quit();
		}

		height: 30

		anchors {
			bottom: parent.bottom
			left: parent.left
			right: parent.right
		}
	}
}