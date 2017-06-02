function l2distance(X,Z=[])
# function D=l2distance(X,Z)
#
# Computes the Euclidean distance matrix.
# Syntax:
# D=l2distance(X,Z)
# Input:
# X: nxd data matrix with n vectors (columns) of dimensionality d
# Z: mxd data matrix with m vectors (columns) of dimensionality d
#
# Output:
# Matrix D of size nxm
# D(i,j) is the Euclidean distance of X(:,i) and Z(:,j)
#
# call with only one input:
# l2distance(X)=l2distance(X,X)
#

if(isempty(Z));
    ## fill in code here
    ##<<kqw
    (n,d)=size(X);
    s1=sum(X.^2,2);
    #D=(-2.*X'*X+repmat(s1,n,1)+repmat(s1',1,n));
    D1=broadcast(+,s1',-2.*X*X');
    D=broadcast(+,s1',D1);
    D[1:n+1:end]=0; # overwrite diagonal with zeros (overcoming precision problems)
    D=sqrt(max(D,0));
    ##>>kqw
else  # case when there are two inputs (X,Z)
        ## fill in code here
    ##<<kqw
    (d,n)=size(X);
    m=size(Z,2);
    s1=sum(X.^2,2);
    s2=sum(Z.^2,2);
    D=broadcast(+,s1,broadcast(+,s2',-2.*X*Z'));
    D=sqrt(max(D,0));
    ##>>kqw
end;
    return(D);
end;