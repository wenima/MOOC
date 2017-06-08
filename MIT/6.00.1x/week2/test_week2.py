"""Tests for coding assignments of Week 2 of MIT6.00.1x."""

import pytest


TEST_GCD = [
(150, 190, 10),
(84, 28, 28),
(456, 437, 19),
(70, 70, 70),
(33, 33, 33),
(66, 69, 3),
(168, 252, 84),
(21, 161, 7),
(11, 12, 1),
(198, 396, 198),
]

TEST_IS_IN = [
('a', '', False),
('v', 'chhjkpvwwxz', True),
('j', 'bj', True),
('o', 'behlottvw', True),
('r', 'bdgiilpvwx', False),
('i', 'aahiiikmmnnnoqwxz', True),
('k', 'aabcdggppx', False),
]


@pytest.mark.parametrize('a, b, result', TEST_GCD)
def test_iter_gcd(a, b, result):
    """Test iter_gcd returns correct gcd by using iteration."""
    from gcd_iter_vs_recur import iter_gcd
    assert iter_gcd(a, b) == result


@pytest.mark.parametrize('a, b, result', TEST_GCD)
def test_recur_gcd(a, b, result):
    """Test recur_gcd returns correct gcd by using recursion."""
    from gcd_iter_vs_recur import recur_gcd
    assert recur_gcd(a, b) == result

@pytest.mark.parametrize('a, b, result', TEST_IS_IN)
def test_is_in(a, b, result):
    """Test is_in returns correct result."""
    from is_in import is_in
    assert is_in(a, b) == result
