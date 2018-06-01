function output = get_frequency_bands(IAF)

output = zeros(6,2);

%We use the order delta, theta, alpha_low, alpha_high, beta, gamma
output(1,:) = [IAF-7, IAF-6]; %delta
output(2, :) = [IAF-6, IAF-2]; %theta
output(3, :) = [IAF-2, IAF]; %alpha_low
output(4, :) = [IAF, IAF+2]; %alpha_high
output(5, :) = [IAF+2, IAF+16]; %beta
output(6, :) = [IAF+16, IAF+30]; %gamma

% output(1,:) = [1, 4]; %delta
% output(2, :) = [4, 8]; %theta
% output(3, :) = [8, 10]; %alpha_low
% output(4, :) = [10, 12]; %alpha_high
% output(5, :) = [12, 30]; %beta
% output(6, :) = [30, 40]; %gamma

end