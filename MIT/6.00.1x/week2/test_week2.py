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


@pytest.mark.parametrize('a, b, result', TEST_GCD)
def test_iter_gcd(a, b, result):
    """Test iter_gcd returns correct gcd."""
    from gcd_iter_vs_recur import iter_gcd
    assert iter_gcd(a, b) == result
