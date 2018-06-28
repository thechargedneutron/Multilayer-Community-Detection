%applying omst


avg_AUNEW_thres = zeros(size(avg_AUNEW));
avg_AUOLD_thres = zeros(size(avg_AUOLD));
avg_OC_thres = zeros(size(avg_OC));

for i=1:14
    for j=1:3
        [~, avg_AUNEW_thres(:, :, i, j), ~, ~, ~, ~] = threshold_omst_gce_wd(avg_AUNEW(:, :, i, j), 0);
    end
end

for i=1:16
    for j=1:3
        [~, avg_AUOLD_thres(:, :, i, j), ~, ~, ~, ~] = threshold_omst_gce_wd(avg_AUOLD(:, :, i, j), 0);
    end
end

for i=1:16
    for j=1:3
        [~, avg_OC_thres(:, :, i, j), ~, ~, ~, ~] = threshold_omst_gce_wd(avg_OC(:, :, i, j), 0);
    end
end

save avg_AUNEW_thres.mat avg_AUNEW_thres;
save avg_AUOLD_thres.mat avg_AUOLD_thres;
save avg_OC_thres.mat avg_OC_thres;

