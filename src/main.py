import sys
import os
from PySide6.QtGui import QGuiApplication
from PySide6.QtQml import QQmlApplicationEngine


def main():
    """Application entry point."""
    app = QGuiApplication(sys.argv)
    
    # Locate QML directory relative to this file
    base_dir = os.path.dirname(os.path.abspath(__file__))
    qml_dir = os.path.join(base_dir, "../view")

    engine = QQmlApplicationEngine()

    engine.addImportPath(qml_dir)  # Allow QML engine to find our modules
    engine.addImportPath(os.path.join(qml_dir, "components"))
    # Load the main QML file
    engine.load(os.path.join(qml_dir, "MainView.qml"))

    if not engine.rootObjects():
        sys.exit(-1)
    sys.exit(app.exec())


if __name__ == "__main__":
    main()