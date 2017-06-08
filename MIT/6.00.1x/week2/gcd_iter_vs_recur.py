def iter_gcd(a, b):
    '''
    a, b: positive integers

    returns: a positive integer, the greatest common divisor of a & b.
    '''
    def isprime(n):
        if n % 2 == 0 or n == 1:
            return False
        return all(n % i for i in range(3, int(n**0.5) + 1, 2))
    if isprime(a) or isprime(b): return 1
    smaller = a if a < b else b
    for div in range(smaller, 1, -1):
        if a % div == 0 and b % div == 0:
            return div


def recur_gcd(a, b):
    '''
    a, b: positive integers

    returns: a positive integer, the greatest common divisor of a & b.
    '''
    if b == 0:
        return a
    return recur_gcd(b, a % b)
