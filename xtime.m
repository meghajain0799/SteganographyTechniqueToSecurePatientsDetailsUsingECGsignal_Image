function a = xtime(x,c)
a=0;
if bitget(x,1)
    a=c;
%     disp(a);
end
x=bitshift(x,-1);
% disp(x)
while x>0
    c=bitshift(c,1);
   %disp(c)
    if bitget(c,9)
        c=bitset(c,9,0);
       % disp(c)
        c=bitxor(c,27);
        %disp(c)
    end
    if bitget(x,1)
        a=bitxor(a,c);
%         disp(a)
    end
    x=bitshift(x,-1);
    %disp(x)
end
end