## Functions makeCacheMatrix and cacheSolve defined below are made as providing
## solution for R Programming course. They are basically trivial modifications
## from makeVector and cachemean provided in the assignment description. 
## Please refer to Verification.md for details on how the functions operate.

## makeCacheMatrix defines new pseudo-matrix object which extends standard
## matrix object by caching inverse of that matrix. The functions inside
## makeCacheMatrix are doing the following operations:
## set() -- initializes pseudo-matrix with unknown inverse
## get() -- returns the matrix from pseudo-matrix object
## setInverse() -- stores provided inverse-matrix value for later use
## getInverse() -- returnes the value of inverse matrix that is stored in cache

makeCacheMatrix <- function(x = matrix()) {
  inverseMatrix <- NULL
  set <- function(y) {    ## matrix initialization
    x <<- y
    inverseMatrix <<- NULL
  }
  get <- function() {     ## returning the matrix
    x
  }
  setInverse <- function(inverse) { ## storing inverse-matrix value into cache
    inverseMatrix <<- inverse
  }
  getInverse <- function() { ## obtaining the cached inverse-matrix value
    inverseMatrix
  }
  list(set = set, get = get, setInverse = setInverse, getInverse = getInverse)
}

## cacheSolve takes provided object x and verifies if the matrix inside that
## object has its inverse already calculated. If it is the case, it prints out
## the message and returns inverseMatrix right away. If inverse matrix was not
## calculated before, it gets calculated assuming that the matrix is invertable,
## stored into x object for later reference and returned as a result of
## cacheSolve.

cacheSolve <- function(x, ...) {
  ## checking if inverse-matrix value is already available in cache 
  inverseMatrix <- x$getInverse()
  if(!is.null(inverseMatrix)) {
    message("getting inverse matrix from cache")
    return(inverseMatrix)
  }
  
  ## calculating the inverse of matrix inside x
  matrixData <- x$get()
  inverseMatrix <- solve(matrixData)
  x$setInverse(inverseMatrix)
  inverseMatrix
}