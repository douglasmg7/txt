Recursion
    Same operation is performed multiple times with differents inputs
    In very step we try to make the problem smaller
    We mandatorily need to have a base condition, which tells when to stop the recursion

Why should we learn recursion
    It makes the code easy to write (compared to interative) whenever a give problem can be broken down into similar sub-problems
    It is heavily used in data structures like Tree, Graphs, etc
    It is heavily used in techniques like "Divide and Conquer", "Greedy" and "Dynamic Programming"

Format of a recursive function
    Recursive case
        Case where the function recur.

    Base case
        Case where the function does not recur.
        Stop recursion.

Example:
SampleRecursion(parameter) {
    if (base case is satisfied) 
        return some case value
    else
        SampleRecursion(modified parameter)
}