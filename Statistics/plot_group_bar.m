nGroup = 62; % Number of group
nStack = 2; % Number of bars/group
% Generate some random data
se = rand(nStack, nGroup); % standard error
data = randn(nStack, nGroup); % averages
%% Working example  ("hold on" after calling bar())
figure;
% Plot individual bars
hBar = bar(data');
% Get x and y position of bars
ctr = zeros(nStack, nGroup);
ydt = zeros(nStack, nGroup);
for i = 1:length(hBar)
  ctr(i,:) = bsxfun(@plus, hBar(1).XData, [hBar(i).XOffset]');
  ydt(i,:) = hBar(i).YData;
end
disp(ctr); % Prints x positions (double numbers)
hold on;
% Plot error bars on top of individual bar plots
errorbar(ctr', ydt', se', 'o', 'marker', 'none', 'linewidth', 2);
hold off;
% %% Not Working example ("hold on" before calling bar())
% figure; % Create figure
% hold on;
% hBar = bar(data');
% ctr = zeros(nStack, nGroup);
% ydt = zeros(nStack, nGroup);
% for i = 1:length(hBar)
%   ctr(i,:) = bsxfun(@plus, hBar(1).XData, [hBar(i).XOffset]');
%   ydt(i,:) = hBar(i).YData;
% end 
% disp(ctr); % Prints x positions (rounded numbers)
% % Plot error bars on top of individual bar plots
% errorbar(ctr', ydt', se', 'o', 'marker', 'none', 'linewidth', 2);
% hold off;