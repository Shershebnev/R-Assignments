## Following functions cache the matrix invert 

## Produce a list of 4 methods: set - set the matrix, get - return the matrix,
## setinvert - set invert of the matrix, getinvert - return the invert

makeCacheMatrix <- function(x = matrix()) {
    
    ## (matrix) -> list of methods
    ##
    ## > b <- makeCacheMatrix(matrix(c(1, 2, 3, 4), nrow = 2, ncol = 2))
    ## > b$get()
    ##      [,1] [,2]
    ## [1,]    1    3
    ## [2,]    2    4
    
    invert <- NULL
    set <- function(y){
        x <<- y
        invert <<- NULL
    }
    get <- function() x
    setinvert <- function(solve) invert <<- solve
    getinvert <- function() invert
    list(set = set, get = get,
          setinvert = setinvert,
          getinvert = getinvert)
}


## Calculate invert of the matrix, if it's the first time run
## Otherwise return invert stored in cache 

cacheSolve <- function(x, ...) {
    
    ## (list of methods) -> matrix
    ##
    ## > b <- makeCacheMatrix(matrix(c(1, 2, 3, 4), nrow = 2, ncol = 2))
    ## c <- cacheSolve(b)
    ## > c
    ##      [,1] [,2]
    ## [1,]   -2  1.5
    ## [2,]    1 -0.5
    ## 
    ## > b$get() %*% c
    ##      [,1] [,2]
    ## [1,]    1    0
    ## [2,]    0    1
    ##
    ## Hooray, everything works. Now you can go on a drinking spree ^_^
    
    invert <- x$getinvert()
    if(!is.null(invert)){
        message("Getting cached data")
        return(invert)
    }
    data <- x$get()
    invert <- solve(data, ...)
    x$setinvert(invert)
    invert
}