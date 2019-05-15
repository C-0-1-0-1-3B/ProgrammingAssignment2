## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
## This function creates a special matrix object that caches in memory its inverse (i.e. inverse matrix)
makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL
  set <- function(y) {
    x <<- y
    inv <<- NULL
  }
  get <- function() x
  setInverse <- function() inv <<- solve(x) #calculate the inverse
  getInverse <- function() inv
  list(set = set,
       get = get,
       setInverse = setInverse,
       getInverse = getInverse)
  
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
# m <- x$getmean()
# the matrix was converted to a data frame to avoid this error message
# "Error in x$getInverse : $ operator is invalid for atomic vectors"
inv <- x$getInverse()
#  if(!is.null(m)) {
  if(!is.null(inv)) {
    message("getting inverse matrix")
    return(inv)
  }
# m1 is a matrix
  m1 <- x$get()
#  m <- mean(data, ...)
  inv <- solve(m1)
#  x$setmean(m)
  x$setInverse (m1)
  m
}
