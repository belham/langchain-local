import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parents[1] / "src"))

import pytest
from models.factory import get_model
from models.configs import get_model_config


def test_model_loading():
    """Models can be loaded from config"""
    model = get_model("llama2")
    assert model is not None
    assert model.provider == "ollama"


def test_basic_response():
    """Model gives a simple answer"""
    model = get_model("llama2")
    response = model.model("What is 2+2?")
    assert "4" in response.lower()


def test_config_loading():
    """Configurations load correctly"""
    config = get_model_config("llama2")
    assert config.model_name == "llama2"
    assert config.provider == "ollama"
    assert "temperature" in config.params


def test_invalid_model():
    """Invalid model names raise errors"""
    with pytest.raises(ValueError):
        get_model("nonexistent_model")
