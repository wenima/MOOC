# Hangman game
#

# -----------------------------------
# Helper code
# You don't need to understand this helper code,
# but you will have to know how to use the functions
# (so be sure to read the docstrings!)

import random
from collections import defaultdict
import string

WORDLIST_FILENAME = "../data/words.txt"

def loadWords():
    """
    Returns a list of valid words. Words are strings of lowercase letters.

    Depending on the size of the word list, this function may
    take a while to finish.
    """
    print("Loading word list from file...")
    # inFile: file
    inFile = open(WORDLIST_FILENAME, 'r')
    # line: string
    line = inFile.readline()
    # wordlist: list of strings
    wordlist = line.split()
    print("  ", len(wordlist), "words loaded.")
    return wordlist

def chooseWord(wordlist):
    """
    wordlist (list): list of words (strings)

    Returns a word from wordlist at random
    """
    return random.choice(wordlist)

# end of helper code
# -----------------------------------

# Load the list of words into the variable wordlist
# so that it can be accessed from anywhere in the program
wordlist = loadWords()

def isWordGuessed(secretWord, lettersGuessed):
    '''
    secretWord: string, the word the user is guessing
    lettersGuessed: list, what letters have been guessed so far
    returns: boolean, True if all the letters of secretWord are in lettersGuessed;
      False otherwise
    '''
    # using dicts for better time complexity
    # d = defaultdict(int) # turn secretWord into a dict of letters and occurences
    # for c in secretWord:
    #     d[c] += 1
    # lettersGuessed = set(lettersGuessed)
    # while d:
    #     try:
    #         d.pop(lettersGuessed.pop(), None)
    #     except:
    #         return False
    # return True
    return all(c in set(lettersGuessed) for c in set(secretWord))


def getGuessedWord(secretWord, lettersGuessed):
    '''
    secretWord: string, the word the user is guessing
    lettersGuessed: list, what letters have been guessed so far
    returns: string, comprised of letters and underscores that represents
      what letters in secretWord have been guessed so far.
    '''
    return ''.join([c if c in set(lettersGuessed) else '_ ' for c in secretWord])


def getAvailableLetters(lettersGuessed):
    '''
    lettersGuessed: list, what letters have been guessed so far
    returns: string, comprised of letters that represents what letters have not
      yet been guessed.
    '''
    return ''.join(sorted(set(string.ascii_lowercase) - set(lettersGuessed)))


def hangman(secretWord):
    '''
    secretWord: string, the secret word to guess.

    Starts up an interactive game of Hangman.

    * At the start of the game, let the user know how many
      letters the secretWord contains.

    * Ask the user to supply one guess (i.e. letter) per round.

    * The user should receive feedback immediately after each guess
      about whether their guess appears in the computers word.

    * After each round, you should also display to the user the
      partially guessed word so far, as well as letters that the
      user has not yet guessed.

    Follows the other limitations detailed in the problem write-up.
    '''
    secretWord, lettersGuessed = chooseWord(wordlist).lower(), []
    print("Welcome to the game Hangman!")
    print("I am thinking of a word that is {0} letters long".format(len(secretWord)))
    misses, cur_round = 0, 1
    while True:
        print("-----------")
        if isWordGuessed(secretWord, lettersGuessed):
            print("Congratulations, you won!".format(cur_round))
            break
        if misses == 8:
                print("Sorry, you ran out of guesses. The word was {0}.".format(secretWord))
                break
        print("You have {0} guesses left".format(8 - misses))
        print("Available letters: ", getAvailableLetters(lettersGuessed))
        letter = input("Please guess a letter: ")
        if letter.lower() in string.ascii_lowercase:
            if letter.lower() in lettersGuessed:
                print("Oops! You've already guessed that letter:", getGuessedWord(secretWord, lettersGuessed))
                continue
            lettersGuessed.append(letter.lower())
            if letter.lower() in secretWord: print("Good guess: ", getGuessedWord(secretWord, lettersGuessed))
        if letter.lower() not in secretWord:
            print("Oops! That letter is not in my word:", getGuessedWord(secretWord, lettersGuessed))
            misses += 1
        cur_round += 1
