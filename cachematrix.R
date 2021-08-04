## Now this function will create a matrix object
## Later on we are using this different object than usual to cache it's inverse

makeCacheMatrix <- function(x = matrix()) {

  inv <- NULL
  set <- function(y){
    x <<- y
    inv <<- NULL
  }


  get <- function() x
  setInverse <- function(solveMatrix) inv <<- solveMatrix
  getInverse <- function() inv
  list(set = set, get = get, setInverse = setInverse, getInverse = getInverse)
	

}

##Now the above function will return the matrixObject.
##On that returned matrix it compute inverse like-
##It will first check if the inverse has already been calculated for the same data
##If it is it would just retrieve from cache
##Else it will calculate.



cacheSolve <- function(x, ...) {
	
  inv <- x$getInverse()
  if(!is.null(inv)){
    message("It was stored already.")
    return(inv)
  }


  data <- x$get()
  inv <- solve(data)
  x$setInverse(inv)
  inv  

	
}
