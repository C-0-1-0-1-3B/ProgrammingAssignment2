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
  setInverse <- function() inv <<- solve(x) 
  getInverse <- function() inv
  list(set = set,
       get = get,
       setInverse = setInverse,
       getInverse = getInverse)
  
}


## ---This function effectively gets a inverse matrix, BUT
## ---This function does NOT work in 'recovering' a cached Inverse Matrix
## ---Basically, I COULD NOT DO IT.
## ---I used inv <<- inv, but that is it. Not sure what this actually did.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
# m <- x$getmean()
# "Error in x$getInverse : $ operator is invalid for atomic vectors"
#inv <- x$getInverse()
#inv <- solve(x)   
#  if(!is.null(m)) {
  if(!is.null(inv)) {
    message("getting inverse matrix")
#    return(inv)
    inv <<- inv
  }
# m1 is a matrix
#  m1 <- x$get()
#  m <- mean(data, ...)
#  inv <- solve(x)
#  x$setmean(m)
#  x$setInverse (m1)
  inv
}

# ----------------- How to run this ----------------------------
# > source("cacheMatrix.R")
# > cm <- makeCacheMatrix()
# > cm$set(matrix(1:4, nrow = 2, ncol = 2))
# > cm$get()
# [,1] [,2]
# [1,]    1    3
# [2,]    2    4
# > cm$setInverse()
# > cm$getInverse()
# [,1] [,2]
# [1,]   -2  1.5
# [2,]    1 -0.5

# -------------- Using cacheSolve----------------------------
# > source("cacheMatrix.R")
# > cacheSolve(matrix(1:4, nrow = 2, ncol = 2))
# getting inverse matrix
# [,1] [,2]
# [1,]   -2  1.5
# [2,]    1 -0.5