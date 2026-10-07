function membership = membership_cold(T)

% COLD membership function
%
% 0% membership at 25°C
% 100% membership below 15°C
%
% Between 15°C and 25°C the membership decreases linearly.

if T <= 15

    membership = 1;

elseif T >= 25

    membership = 0;

else

    membership = (25 - T) / (25 - 15);

end

end
