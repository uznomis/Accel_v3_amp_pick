function [log_x,log_y] = extractAmpFromEventsDBAccel(eventsDB, Accel)
y2 = Accel(:,9);    % I picked the y channel of accel 2 (9th column in Accel)
amp = eventsDB.startEnd(:,2);
amp_demean = abs(amp - mean(y2));
log_amp_demean = log(amp_demean)./log(10);
h = histogram(log_amp_demean);
y = zeros(1,length(h.Values));
for i = 1:length(h.Values)
    y(i) = sum(h.Values(i:end));
end
log_x = h.BinEdges(1:end - 1);
log_y = log(y)./log(10);
figure;
scatter(log_x,log_y);
y