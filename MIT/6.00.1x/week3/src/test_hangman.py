"""Tests for Hangman program presented as a coding challenge for Week 3 of MITx 6.00.1x."""

import pytest


WORD_GUESS = [
('apple', ['e', 'i', 'k', 'p', 'r', 's'], False),
('apple', ['e', 'i', 'x', 'p', 'l', 'a'], True),
]

@pytest.mark.parametrize('s, l, result', WORD_GUESS)
def test_isWordGuessed(s, l, result):
    """Test isWordGuessed return correct result."""
    from hangman import isWordGuessed
    assert isWordGuessed(s, l) == result
