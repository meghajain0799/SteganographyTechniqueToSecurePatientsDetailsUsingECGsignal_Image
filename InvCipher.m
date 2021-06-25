function Out = InvCipher(w,In)
%AES-256 inverse cipher
%Impliments FIBS-197, key is 256-bit hexidecimal input, 
% message (In) is 128-bit hexidecimal.
%David Hill
%Version 1.0.1
%12-21-2019
state=reshape(In,4,[]);
state=AddRoundKey(state,w(:,57:60));
for k=14:-1:2
    state=InvShiftRows(state);
    state=InvSubBytes(state);
    state=AddRoundKey(state,w(:,4*(k-1)+1:4*k));
    state=InvMixColumns(state);
end
state=InvShiftRows(state);
state=InvSubBytes(state);
state=AddRoundKey(state,w(:,1:4));
Out=state(:)';
end