function membership = membership_hot(T)

% HOT membership function
%
% Zero membership below 25°C.
% Full membership above 35°C.

if T <= 25

    membership = 0;

elseif T >= 35

    membership = 1;

else

    membership = (T - 25) / (35 - 25);

end

end
