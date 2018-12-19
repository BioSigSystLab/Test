function plotMCC(step)
%Plot OOB MCC from the backward selection scheme. Find the best
%combination of features with the maximum MCC (smallest number of features
%with maximum MCC) and plot their feature importance.

for i=1:length(step)
    load(sprintf('RESULTS/RESALL_%d.mat',step(i)))
    MCC(i)=VAL;
end

figure;plot(step,MCC,'*-')
xlabel('Number of Features')
ylabel('OOB MCC')

[mm,ii]=max(MCC);
fprintf('\nOptimal Number of Features: %d - OOB MCC: %1.3f',step(ii),mm)

load(sprintf('RESULTS/RESALL_%d.mat',step(ii)))
figure;bar(deltaT)
ylabel('Feature Importance')
set(gca,'XtickLabel',FNAMS)
