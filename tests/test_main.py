import sys
from pathlib import Path

ROOT_DIR = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT_DIR))

import src.main as main


def test_get_qml_dir():
    expected = (ROOT_DIR / "view").resolve()
    assert Path(main.get_qml_dir()).resolve() == expected
    assert expected.is_dir()
