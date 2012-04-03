function merge4features2pic(filename)

path = ['.' filesep 'investigateFeatures' filesep];

load([path filename]);

figure(50);
subplot(2,2,1), imagesc(aspectrum), axis xy
xlabel('time (10 ms steps)')
ylabel('(low) frequencies (high)')
subplot(2,2,2), imagesc(ANsmooth), axis xy
xlabel('time (10 ms steps)')
ylabel('(low) frequencies (high)')
subplot(2,2,3), imagesc(ANtiming), axis xy
xlabel('time (10 ms steps)')
ylabel('(low) frequencies (high)')
subplot(2,2,4), imagesc(ZCPA1), axis xy
xlabel('time (10 ms steps)')
ylabel('(low) frequencies (high)');

subarrange(50,2,2)
