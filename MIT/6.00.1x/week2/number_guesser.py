"""Solution for 'Guess my number' problem.
Note: the auto-grader wants the solution to be in a specific format and also
does not optimize so the previous guess needs to be in the new range."""

print('Please think of a number between 0 and 100!')
start = 0
end = 100
guess = (start + end) // 2
while True:
    print('Is your secret number', guess, '?')
    response = input("Enter 'h' to indicate the guess is too high. Enter 'l' to indicate the guess is too low. Enter 'c' to indicate I guessed correctly.").lower()
    if response == "c":
        print('Game over. Your secret number was:', guess)
        break
    elif response == 'h':
        end = guess
    elif response == 'l':
        start = guess
    else:
        print('Sorry, I did not understand your input.')
    guess = (start + end) // 2
