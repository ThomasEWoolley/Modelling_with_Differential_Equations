ccc

l=3;
a=1;
b=3;

x=linspace(0,100,1e3);

f=l^3*x./(1+a*x).^b;
subplot(1,2,1)
plot(x,f)
hold on
plot(x,x)
axis equal

X(1)=1;
for i=1:100
    X(i+1)=l^3*X(i)./(1+a*X(i)).^b;
end
X(1:end-10)=[];
plot(X(1:end-1),X(2:end))
subplot(1,2,2)
plot(X)