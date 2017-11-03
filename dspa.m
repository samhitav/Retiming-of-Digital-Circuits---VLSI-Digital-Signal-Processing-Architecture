fp = fopen('dspa.txt','r');
file=fscanf(fp,'%d');
fclose(fp);
n=file(1);
i=2;
inp=inf(n);
for k=1:n+1
    inp(file(i),file(i+1))=file(i+2);
    i=i+3;
end    

D=zeros(n);
for k=1:n
    D(k,k)=file(i);
    i=i+1;
end

W = inf(n);
alpha=0;
for i =1:n
    for j=1:n
        if(i==j)
            W(i,j)=0;
            if D(i,j)>alpha
                alpha=D(i,j);
            end
        end
    end
end

%alpha = #;
for k=1:(n-1)
for i=1:n
    for j=1:n
        for l=1:n
        if (W(l,j)> W(l,i)+inp(i,j))
            W(l,j)=W(l,i)+inp(i,j);
        end
        if((inp(l,j)~=Inf)&&(D(i,j)<D(i,l)+D(j,j))&&(j~=l)&&(i~=j))
            D(i,j)=D(i,l)+D(j,j);
        end
        end
    end
end
end

alpha
Wr=inf(n+1);
for i=1:n
    for j=1:n
        if inp(i,j)~=inf
            Wr(j,i)=inp(i,j);
        end
        if D(i,j)>alpha
            Wr(j,i)=W(i,j)-1;
        end
    end
end
final=zeros(n+1,1);
for i=1:n+1
    for j=1:n+1
        if i==j || i==(n+1)
            Wr(i,j)=0;
        end
        if (final(j)> final(i)+Wr(i,j))
            final(j)=final(i)+Wr(i,j);
        end
    end
end
Answer=sprintf('Values of r for each node after retiming is \nr(1)=%d r(2)=%d r(3)=%d r(4)=%d',final(1),final(2),final(3),final(4))
inpf=inp;

for i=1:n
    for j=1:n
        if inp(i,j)~=inf
            if final(j)~=0
                inpf(i,j)=inpf(i,j)+final(j);
                for s=1:n
                    if inp(j,s)~=inf
                        inpf(j,s)=inpf(j,s)-final(j);
                    end
                end
            end
        end
    end
end
sprintf('The matrix showing weights of each existing edge of graph after retiming is')
inpf
                
            