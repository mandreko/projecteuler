require 'matrix'

FIB_MATRIX = Matrix[[1,1],[1,0]]
def fibonacci(n)
  (FIB_MATRIX**(n-1))[0,0]
end