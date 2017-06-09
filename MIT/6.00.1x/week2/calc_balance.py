"""Solution for Problem 1 of Week 2 Problem Set - Paying off Debt on CC
Write a program to calculate the credit card balance after one year if a person
only pays the minimum monthly payment required by the credit card company each month.
"""

def calc_balance(balance, annual_interest, minimum_payment, months=12):
    """Return the balance at the end 12 months given starting balance, annual interesting
    and minimum_payment.
    """
    for _ in range(0, months):
        balance = balance - balance * minimum_payment
        balance = balance + balance * annual_interest/12
    return round(balance, 2)
