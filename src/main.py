import os
import sys


def get_qml_dir() -> str:
    """Return the absolute path to the bundled QML directory."""
    base_dir = os.path.dirname(os.path.abspath(__file__))
    return os.path.abspath(os.path.join(base_dir, "../view"))


def main():
    """Application entry point."""
    # Import Qt modules only when running the application so tests do not
    # require PySide6 to be installed.
    from PySide6.QtGui import QGuiApplication
    from PySide6.QtQml import QQmlApplicationEngine

    app = QGuiApplication(sys.argv)
    
    # Locate QML directory relative to this file
    qml_dir = get_qml_dir()

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