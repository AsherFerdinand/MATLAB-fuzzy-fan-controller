function membership = membership_warm(T)

% WARM membership function
%
% Maximum membership at 25°C.
% Zero membership at 15°C and 35°C.

if T <= 15

    membership = 0;

elseif T < 25

    membership = (T - 15) / (25 - 15);

elseif T < 35

    membership = (35 - T) / (35 - 25);

else

    membership = 0;

end

end
