"""Module contains all code samples from the practice part of the lecture in Week 3."""

def odd_tuple(t):
    """Returns a tuple of every odd index."""
    return t[::2]

"""Write a procedure, called how_many, which returns the sum of the number of values
associated with a dictionary."""

def how_many(d):
    """Return the sum of all values in the dict."""
    return sum(len(v) for v in d.values())

"""Write a procedure, called biggest, which returns the key corresponding to the
entry with the largest number of values associated with it. If there is more than
one such entry, return any one of the matching keys."""

def biggest(d):
    """Return the key from a dictionary which has the largest number of values
    by sorting it and then popping off he first element which is a tuple holding
    the key and the values and returning only the key.
    """
    return sorted(d.items(), key=lambda x: len(x[1])).pop()[0] if d else None
