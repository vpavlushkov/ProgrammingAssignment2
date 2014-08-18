### Description

This document demonstrates how the functions defined in cachematrix.R file could/should be used and could be used as a reference for those functions.

### Execution

```R
    > source("cachematrix.R")
    > a <- makeCacheMatrix(matrix(c(1,2,3,5), nrow = 2, ncol = 2))
    > a$get()
         [,1] [,2]
    [1,]    1    3
    [2,]    2    5
    > a$getInverse() ## The inverse of a is still unknown
    NULL
    > cacheSolve(a)
         [,1] [,2]
    [1,]   -5    3
    [2,]    2   -1
    > cacheSolve(a)
    getting inverse matrix from cache
         [,1] [,2]
    [1,]   -5    3
    [2,]    2   -1
    > a$getInverse() ## Now inverse of a is already cached
         [,1] [,2]
    [1,]   -5    3
    [2,]    2   -1
    > a$set(matrix(c(10, 20, 30, 45), nrow = 2, ncol = 2))
    > a$getInverse()
    NULL
    > cacheSolve(a)
               [,1]        [,2]
    [1,] -0.3000000  0.20000000
    [2,]  0.1333333 -0.06666667
    > a$getInverse()
               [,1]        [,2]
    [1,] -0.3000000  0.20000000
    [2,]  0.1333333 -0.06666667
```