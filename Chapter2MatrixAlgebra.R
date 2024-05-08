########################################################
#Chapter 2: Matrix Algebra
#(Chapter 4:Basic Linear Algebra,  Zelterman's textbook)
#####################################################
#Keep in mind: R is case sensitive! So, b and B are two different variables in R.

#constructing a vector
b<-c(3,0,5,10) # c for combine, assigning the vector to a name 'b'
b
print(b)

x <- seq(1,8,2) #seq(from, to, by)
x

y<--2:5
y

#forming a matrix
#matrix() function fills the columns first. 
m=matrix(2 : 17, nrow=4, ncol=4) #matrix(data, nrow=, ncol=)
m

#if you want to fill rows first, then
m2=matrix(1 : 16, nrow=4, ncol=4, byrow=TRUE) 
m2

#To extract a row, column or an (i,j) element 
m2[2,] #extracting second row
m2[, 3] #extracting third column
m2[2,3] #extracting (2,3) element in the matrix
m2[3, 2:4] #extracting 3rd row and 2nd through 4th column

#diag() function has several distinct usages. It can be used to construct a 
#diagonal matrix or extract diagonal elements from a matrix. 

diag(3,4,4) # a 4x4 diagonal matrix with all diagonal elements=3
diag(3) # a 3x3 identity matrix
diag(1:4) ## a diagonal matrix with diagonal elements 1,2,3,4
diag(m2) #extracting diagonal elements of matrix m2

#See page 25, Zelterman for generating random numbers from various distributions
set.seed(123)

A=matrix(runif(9,0,1), 3,3) #generating 9 random numbers from Uniform(0,1), then forming matrix A
B=matrix(rnorm(9,0,1), 3,3)#generating 9 random numbers from Normal(0,1).

A * B # element-wise multiplication, A and B have to be of same dimension

A %*% B #matrix multiplication, A and B have to be conformable for matrix multiplication

b=c(2,-1,2)
solve(A,b) #solving system of linear equations Ax=b

d1=det(A) # determinant of A
d1

solve(A) # inverse of a non-singular square matrix A



A %*% solve(A) #produces identity matrix
solve(A)%*%A #produces identity matrix
diag(A) #extracting diagonal elements of A
sum(diag(A)) # trace of A


eigen(A) # to obtain eigenvalues and eigenvectors of A
eigen(A)$values #getting only eigenvalues
eigen(A)$vectors #getting only eigenvectors

#Verifying det(A)=product of eigenvalues of A
#trace(A)=sum(diag(A))= sum of eigenvalues of A

d2=prod(eigen(A)$values) #gives determinant of A
d2
det(A)

sum(eigen(A)$values)
sum(diag(A))

##Special note
#Suppose Z is an arbitrary n by m matrix. Then, Z'Z is symmetric 
#and non-negative definite or positive definite depending on the sign of 
#eigenvalues.

z=matrix(1:6, 3, 2)
A=t(z)%*%z #a 2x2 symmetric positive definite or non-negative definite matrix
A


Lambda=eigen(A)$values# shows A is positive definite since each lambda>0
Lambda

P=eigen(A)$vectors # an orthogonal matrix of eigenvectors of A
P


all.equal(P%*%t(P), t(P)%*%P)

sdc.A=P %*% diag(Lambda) %*% t(P) #spectral decomposition of A
sdc.A

all.equal(A, sdc.A) #checking if A (original matrix) and sdc.A are the same

#generalized inverse of matrix A
gen.inv.A = P %*%solve(diag(Lambda)) %*%t(P)

#alternately, to use ginv() function from package MASS 
#install.packages("MASS")
require(MASS)
ginv(A)


#square root matrix
sq.root.A=P%*%diag(sqrt(Lambda))%*%t(P)
sq.root.A

