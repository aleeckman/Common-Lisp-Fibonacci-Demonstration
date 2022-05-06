# README
Student Name: Andrew Eeckman
Student ID: 914834317
Date: 11/17/21

## Input Instructions:
All inputs for both files must be hard-coded into the files themselves. In order to run and print the result of a given function, enter the following into the bottom of the desired file: (print (function_name parameter1 parameter2 ... parameterN))

## Functions
### Fibonacci: 
- nth-fib: Takes in a given number n and recursively calculates the nth number in Fibonacci sequence.
- fib: Takes in a given number n calls the helper-fib function to calculate the first n numbers of the Fibonacci sequence.
- helper-fib: Given a number n, the two-previously calculated numbers, as well as an index and an empty list, this function will recursively find the first n numbers of the Fibonacci sequence.
- fib-lt: Given a number n and optionally similar inputs to that of helper-fib (excluding a given index), this function recursively finds the numbers of the Fibonacci sequences that are less than a certain value. 

### Match:
- match: Taking in a given pattern and an assertion (match) sequence, this function actively compares the atom of each sequence to see if they match. Some special cases are handled, namely if the pattern sequence contains either an exclamation (!) point or an asterisk (*). An ! as one of the pattern's atom can stand in for up to 0 or more atoms in the assertion (match) sequence; this is solved recursively. If an * is found to exist in one of the pattern's atoms then that atom is subsequently turned into a string and then atomized into a list along with its assertion counterpart and then passed to the handle-ast function. If a pattern matches with a given assertion, then t (true) is returned, if not, then nil is returned. 
- handle-match: Taking in two normal atoms (i.e. ones which neither contain an * or are an !), it checks if they are equal. If they are, then t (true) is returned, if not, then nil is returned.
- handle-ast: Taking in the list versions of both a pattern's atom and an assertion's (match) atom, it checks in a similar way to the match function to check if they are both equal. In this function, the * characters acts in the same way as the ! symbol does in the match function. If the pattern atom matches the assertion's atom following the rules for *'s then a t (true) is returned, else a nil value.

## Test Cases:
The test cases used for both parts of this project are commented out at the bottom of each file. 

## References:
1. https://stackoverflow.com/questions/7459501/how-to-convert-a-string-to-list-using-clisp
2. https://www.tutorialspoint.com/lisp/lisp_cond_construct.htm
3. https://stackoverflow.com/questions/547436/whats-the-difference-between-eq-eql-equal-and-equalp-in-common-lisp
4. http://clhs.lisp.se/Body/f_null.htm
5. https://www.tutorialspoint.com/lisp/lisp_characters.htm
6. http://clhs.lisp.se/Body/f_coerce.htm
7. https://lispcookbook.github.io/cl-cookbook/strings.html
8. https://www.gnu.org/software/emacs/manual/html_node/eintr/Recursion-with-cond.html
