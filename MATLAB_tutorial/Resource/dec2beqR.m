function [beq,E,B] = d2beqR(d,L)
% Binary equivalent decimal (beq) representation of a decinal (d)
% using L=1+E+B bit Representation using Rounding operation: 
%  [beq,E,B] = d2beqR(d,L)
%   d can be scalar or vector or matrix. 
%   L must be greater than the number of integer bits required.

dm = abs(d);
 E = max(max(0,fix(log2(dm(:)+eps)+1))); % Integer bits
if (E >= L)
     errmsg = [' *** L must be greater than ',num2str(E),' ***'];
     error(errmsg);
end 
B = L-1-E; % Fractional bits
beq = round(dm./(2^E).*(2^(L-1))); % Rounding to L bits
beq = sign(d).*beq*(2^(-B)); % 1+E+B bit representation