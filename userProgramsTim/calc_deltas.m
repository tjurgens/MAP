function mFeature = calc_deltas(mFeature,iDeltaOrder)
% mFeature is the feature matrix 
% iDeltaOrder = 1 (for calculation of deltas)
%             = 2 (for addition calculation of acceleration coefficients)
% -------------------------------------------------------------------------

if ~exist('iDeltaOrder','var')
  iDeltaOrder = 2;
end

if iDeltaOrder > 0
  [nInternalFeatureRows nInternalFeatureCols] = size(mFeature);

  dummyFeatureSet = zeros(nInternalFeatureRows,nInternalFeatureCols+6);
  dummyFeatureSet(:,4:end-3) = mFeature;

  newInternalFeature = zeros(2*nInternalFeatureRows,nInternalFeatureCols);
  newInternalFeature(1:nInternalFeatureRows,:) = mFeature;
  firstSum  = dummyFeatureSet(:,1:end-2) - dummyFeatureSet(:,3:end);
  firstSum  = firstSum(:,3:end-2);
  secondSum = 2 * dummyFeatureSet(:,1:end-4) - dummyFeatureSet(:,5:end);
  secondSum = secondSum(:,2:end-1);
  thirdSum  = 3 * dummyFeatureSet(:,1:end-6) - dummyFeatureSet(:,7:end);

  newInternalFeature(nInternalFeatureRows+1:end,:) = (firstSum +secondSum + thirdSum);

  mFeature = newInternalFeature;

  if iDeltaOrder > 1
      [nInternalFeatureRows nInternalFeatureCols] = size(mFeature);

      dummyFeatureSet = zeros(nInternalFeatureRows,nInternalFeatureCols+4);
      dummyFeatureSet(:,3:end-2) = mFeature;

      newInternalFeature = zeros(3*nInternalFeatureRows/2,nInternalFeatureCols);
      newInternalFeature(1:nInternalFeatureRows,:) = mFeature;
      firstSum  = dummyFeatureSet(nInternalFeatureRows/2+1:end,1:end-2) - dummyFeatureSet(nInternalFeatureRows/2+1:end,3:end);
      firstSum  = firstSum(:,2:end-1);
      secondSum  = 2 * dummyFeatureSet(nInternalFeatureRows/2+1:end,1:end-4) - dummyFeatureSet(nInternalFeatureRows/2+1:end,5:end);
      newInternalFeature(nInternalFeatureRows+1:end,:) = (firstSum + secondSum);

      mFeature = newInternalFeature;
  end
end     
