"""
Liza Freed 
R Programming Coursera-- Assignment 2
Aug 23 1018
"""

## makeCacheMatrix: creates a special matrix object that can cache its inverse 

makeCacheMatrix <- function(x = matrix()) { 
  s <- NULL
  set <- function(y) {
    x <<- y
    s <<- NULL
  }
  get <- function() x
  setsolve <- function(solve) s <<- solve
  getsolve <- function() s
  list(set = set, get = get,
       setsolve = setsolve,
       getsolve = getsolve)
}


"""
This function computes the inverse of the special matrix
returned by makeCacheMatrix above. If the inverse has already been 
calculated (and the matrix has not changed), then the cachesolve should 
retrieve the inverse from the cache.
"""

cacheSolve <- function(x, ...) { 
  s <- x$getsolve()
  if(!is.null(s)) {
    message("Fetching cached inverse")
    return(s)
  }
  data <- x$get()
  s <- solve(data, ...)
  x$setsolve(s)
  return(s)
}
