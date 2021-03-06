# Function : makeCacheMatrix 
# For : Caching the inverse of a matrix

# Description : this function creates a special "Matrix" object that can 
# cache its inverse.
#

makeCacheMatrix <- function(x = matrix()) {
        
        m <- NULL
        set <- function(y) {
                x <<- y
                m <<- NULL
                
        }
        
        get <- function () x
        #set the Inverse of the matrix
        setinverse <- function(inverse) m <<- inverse
        #get the inverse of the matrix
        getinverse <- function() m
        
        list(set = set, get = get,
             setinverse = setinverse,
             getinverse = getinverse)
        
}


# Function : cacheSolve
# For : computes the inverse of "matrix" returned by makeCacheMatrix()

# Description : This fucntion computes the inverse of the special
# "matrix" returned by makeCacheMatrix() above. if the inverse has
# already been calculated (and the matrix has not changed), 
# then the cachesolve should retrieve the inverse from the cache.
#
cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        m <- x$getinverse()
        if(!is.null(m)) {
                message("getting cached data!")
                return(m)
                
        }
        data <- x$get()
        # if X is a square invertible matri, then solve(X) return
        # its inverse.
        m <- solve(data, ...)
        # set the inverse of matrix
        x$setinverse(m)
        # return m
        m
        
}
