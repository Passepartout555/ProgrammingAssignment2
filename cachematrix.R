## Coursera - Programming in R - Programming Assignment
## Two functions, makeCacheMatrix and cacheSolve that demonstrate the usage of
## Lexical Scoping within R
## HERE: The inverted matrix is returned - calculated or retrieved from cache if already
## calculated before (aka cached). 
## For this assignment, we assume that the matrix supplied is always invertible.
##                                                                                        ##
## makeCacheMatrix: 
## This function creates a special "matrix" object that can cache its inverse.

makeCacheMatrix <- function(xMatrix = matrix()) {
  
    invMatrix <-NULL
    # The set portion here prepares the matrices
    set <-function(yMatrix) {
        xMatrix <<- yMatrix   # Get the matrix to work with
        invMatrix <<- NULL    # Nothing ???solved??? yet
        }
    # Read the data

    get <- function() xMatrix 
  
    # The actual solving of the matrix 
    # Assume it can be solved (!) for the exercise
    setmatrix <- function(solve) invMatrix <<- solve
    # And then return the (probably cached) results
    getmatrix <- function() invMatrix
  
    list(set=set, 
         get=get,
         setmatrix=setmatrix,
         getmatrix=getmatrix)
}

## cacheSolve:
## This function computes the inverse of the special "matrix" returned by 
## makeCacheMatrix above. If the inverse has already been calculated 
## (and the matrix has not changed), then the cachesolve should retrieve 
## the inverse from the cache.
## Computing the inverse of a square matrix can be done with the 
## solve function in R. 

cacheSolve <- function(x, ...) {
    invMatrix <- x$getmatrix()
    # Has this been done before? Cache?
    if (!is.null(invMatrix)) {
        message("Getting matrix from cache ???")
    return(invMatrix)
    }
  
    # Bad luck ??? nothing in here, so calculate!
    matrix <- x$get()
    invMatrix <- solve(matrix, ...)
    x$setmatrix(invMatrix)  # Write it to the cache
    return(invMatrix)
}
