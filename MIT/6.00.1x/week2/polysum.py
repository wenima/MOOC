"""Solution for optional code challenge of Week in in MITx 6.00.1."""

from math import tan, pi

def polysum(n, s):
    """Return the sum of area and square of perimeter for a regular polygon of
    n sides and length of n s."""
    area = 0.25 * n * s**2 / tan(pi/n)
    perimeter = s * n
    return round(area + perimeter ** 2, 4)
