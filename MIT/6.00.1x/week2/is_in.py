"""Solution to finding a character in a string without using a built-in FUNCTION
recursively."""

def is_in(char, s):
    '''
    char: a single character
    aStr: an alphabetized string

    returns: True if char is in aStr; False otherwise
    '''
    if len(s) == 0: return False
    if len(s) <= 1:
        return char == s
    mid = len(s) // 2
    if char == s[mid]: return True
    if char < s[mid]:
        return is_in(char, s[:mid])
    else:
        return is_in(char, s[mid:])
