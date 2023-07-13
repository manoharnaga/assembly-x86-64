This assignment uses x86-64 instruction set.

This was done as a part of the course:-
### **Computer System Organisation course - Spring 2022**

---

## Problem 1

Given two numbers M and N compute the quotient and remainder for M/N. Do not use inbuilt div or similar operations.

### **Compilation Format:**
```sh
$ gcc Solutions/q1/q1.c Solutions/q1/q1.s
$ ./a.out
```

### Input/Output Format
- **INPUT**: M, N
- **OUTPUT**: q, r; where q is the quotient and r is the remainder.

### Sample Test Case
**Input**: 153 5 \
**Output**: 30 3 


<br>

## Problem 2

Given two numbers M and N calculate the greatest common divisor (GCD) of M and N.


### **Compilation Format:**
```sh
$ gcc Solutions/q2/q2.c Solutions/q2/q2.s
$ ./a.out
```

### Input/Output Format
- **INPUT** : N, M.
- **OUTPUT**: GCD(M, N)

### Sample Test Case
**Input** : 24 39 \
**Output**: 3 

<br>

## Problem 3

Given a number N check if it is a prime number.


### **Compilation Format:**
```sh
$ gcc Solutions/q3/q3.c Solutions/q3/q3.s
$ ./a.out
```

### Input/Output Format
- **INPUT** : N
- **OUTPUT**: TRUE, if the given number is a prime number, FALSE otherwise.

### Sample Test Case
**Input** : 13 \
**Output**: TRUE 




## Problem 4

Given a number N, find its largest prime factor.    


### **Compilation Format:**
```sh
$ gcc Solutions/q4/q4.c Solutions/q4/q4.s
$ ./a.out
```

### Input/Output Format
- **INPUT** : N
- **OUTPUT**: M, Where M is the largest prime factor of N

### Sample Test Case
**Input** : 24 \
**Output**: 3 

<br>



## Problem 5

Create a program to compute the square of the sum from 1 to n. Specifically, compute the square of integers from 1 to n and then sum the values.  


### **Compilation Format:**
```sh
$ gcc Solutions/q5/q5.c Solutions/q5/q5.s
$ ./a.out
```

### Input/Output Format
- **INPUT** : A single integer number N
- **OUTPUT**: M, where M is the sum of squares of natural numbers till N

### Sample Test Case
**Input** : 4 \
**Output**: 30 
