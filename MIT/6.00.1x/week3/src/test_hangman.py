"""Tests for Hangman program presented as a coding challenge for Week 3 of MITx 6.00.1x."""

import pytest


WORD_GUESS = [
('apple', ['e', 'i', 'k', 'p', 'r', 's'], False),
('apple', ['e', 'i', 'x', 'p', 'l', 'a'], True),
]

LETTERS_GUESSED = [
('apple', ['e', 'i', 'k', 'p', 'r', 's'], '_ pp_ e'),
('apple', ['m', 'n', 'x', 'o'], '_ _ _ _ _ '),
]

AVAIL_LETTERS = [
(['e', 'i', 'k', 'p', 'r', 's'], 'abcdfghjlmnoqtuvwxyz'),
]

@pytest.mark.parametrize('s, l, result', WORD_GUESS)
def test_isWordGuessed(s, l, result):
    """Test isWordGuessed return correct result."""
    from hangman import isWordGuessed
    assert isWordGuessed(s, l) == result


@pytest.mark.parametrize('s, l, result', LETTERS_GUESSED)
def test_getGuessedWord(s, l, result):
    """Test getGuessedWord return correct result."""
    from hangman import getGuessedWord
    assert getGuessedWord(s, l) == result

@pytest.mark.parametrize('s, result', AVAIL_LETTERS)
def test_getAvailableLetters(s, result):
    """Test getGuessedWord return correct result."""
    from hangman import getAvailableLetters
    assert getAvailableLetters(s) == result
