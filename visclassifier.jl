function visclassifier(fun,xTr,yTr;w=[],b=0);
# visualize decision boundary
# Define the symbols and colors we'll use in the plots later
symbols = ["ko","kx"];
mycolors = [0.5 0.5 1; 1 0.5 0.5];
classvals=unique(yTr);

figure("Linear Classifier Visualization");
clf();
xkcd(false);
# call perceptron to find w from data


# Generate the plot
res=300;
xrange = linspace(minimum(xTr[:,1]),maximum(xTr[:,1]),res);
yrange = linspace(minimum(xTr[:,2]),maximum(xTr[:,2]),res);
pixelX=repmat(xrange',length(yrange),1);
pixelY=repmat(yrange, 1,length(xrange));
xTe=[pixelX[:] pixelY[:]];

testpreds=fun(xTe);
Z = zeros(res,res);
Z[:]+=testpreds[:];
Z[1,1]=1; # this is to scale the colors correctly
contourf(pixelX, pixelY, sign(Z));
ColorMap(mycolors);
hold(true);
 for c = 1:2
    idx = find(yTr.==classvals[c]);
    hp=plot(xTr[idx,1], xTr[idx,2], symbols[c]);
 end
 if !isempty(w)
     α=-b/sum(w.^2);
     quiver(w[1]*α,w[2]*α,w[1]*(2*α),w[2]*(2*α),linewidth=2,color=[0,1,0]);
end;
 axis("equal");
 grid(false);
 axis("tight");
end;