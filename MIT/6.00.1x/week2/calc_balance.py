"""Solution for Problem 1 of Week 2 Problem Set - Paying off Debt on CC
Write a program to calculate the credit card balance after one year if a person
only pays the minimum monthly payment required by the credit card company each month.
"""

def calc_balance_mp(balance, annual_interest, minimum_payment, months=12):
    """Return the balance at the end 12 months given starting balance, annual interesting
    and minimum_payment.
    """
    for _ in range(0, months):
        balance = balance - balance * minimum_payment
        balance = balance + balance * annual_interest/12
    return round(balance, 2)


def calc_monthly_payment_full(start_balance, annual_interest, months=12):
    """Retun the monthly payment to be made to pay the full balance after n months."""
    b = start_balance
    out = []
    for i in range(months):
        b = b + b * (annual_interest/months)
        p = b / months
        out.append(p)
    payment = sum(out) // len(out)
    payment += abs(payment % 10 - 10)
    best_payment = check_payment(start_balance, annual_interest, payment)
    return int(best_payment)

def check_payment(start_balance, annual_interest, payment, months=12):
    """Return best payment by approximating closest to 0 from given payment
    in multiples of 10.
    """
    while True:
        b = start_balance
        for i in range(months):
            b = b - payment
            b = b + (b * annual_interest / months)
        if b < 0:
            best_payment = payment
            payment -= 10
        else: return best_payment

def calc_monthly_payment_full_bisetional(start_balance, annual_interest, months=12):
    """Return the exact monthly payment per made to pay off a balance after 12 months."""
    start = (start_balance + start_balance * annual_interest) / 12
    end = start_balance / 12
    while True:
        payment = end + (start - end) / 2
        b = start_balance
        for i in range(months):
            b = b - payment
            b = b + (b * annual_interest / months)
        if round(b, 2) == 0.00:return round(payment, 2)
        if b < 0:
            print(b)
            start = payment
        elif b > 0:
            print(b)
            end = payment
