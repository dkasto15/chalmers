function alpha = GetSlopeAngle(x, iSlope, iDataSet)

if (iDataSet == 1)   % Training
    
     % Constant: uniform random number between 4 an 6
     % Amplitudes: uniform random numbers between 0 and 3
     % Periocicity: uniform random numbers between 30 and 200
     % Phase: Random number between 0 and 2*pi
     C = [5.7075    5.3660    4.9136    5.9866    5.4631    5.2949    4.5824    4.2032    5.2345    5.9906];
     A1 = [1.8515    0.6449    1.0643    2.9193    0.4261    0.1466    1.6742    0.8385    2.7860    1.2856];
     A2 = [2.6355    2.7697    2.4480    0.2394    2.6520    0.3721    2.2640    2.8530    1.9602    2.9968];
     L1 = [119.7975  195.8810   83.3295   73.0889   75.1140   54.0797  123.4042  110.7784   32.0938  139.1525];
     L2 = [101.3302  164.1668  168.8795   33.8321   57.9278   39.5301   34.3021  134.1443   45.0179  150.7443];
     phase1 = [1.6466    3.7834    5.0749    2.6501    1.9860    1.4106    3.5933    3.0623    0.1508    4.5690];
     phase2 = [4.8578    2.7075    0.0831    3.4105    3.8316    1.2111    4.4909    5.8885    0.9975    3.2380];

     alpha = 0.5*(C(iSlope) + A1(iSlope)*cos(x./L1(iSlope) + phase1(iSlope)) ...
             + A2(iSlope)*cos(x./L2(iSlope) + phase2(iSlope)));
     
elseif (iDataSet == 2)                            % Validation
    C = [5.2650    4.1852    5.9339    5.6976    4.5678    5.1923    4.9271    4.3387    5.3411    4.9344];
    A1 = [2.7629    2.3946    0.3910    0.8020    1.8252    1.4478    0.7907    1.6780    2.5644    2.4024];
    A2 = [0.6741    0.7919    1.5773    1.1643    0.9492    2.5961    0.2652    1.1504    1.6247    0.4718];
    L1 = [88.0172  106.0284  148.9997  153.5479   32.0053   33.5403   64.7890   85.9191  125.5073  116.3533];
    L2 = [93.6284   95.2754  125.4955  121.8747   89.1473  149.9056  113.6902  170.6376  108.8370  172.1230];
    phase1 = [1.1631    0.6257    0.9913    2.4900    1.0804    0.2277    5.9488    1.0557    4.6854    6.2437];
    phase2 = [1.3659    0.7427    3.6399    5.2159    3.4237    5.3534    5.4269    0.9736    2.6919    3.1208];

     alpha = 0.5*(C(iSlope) + A1(iSlope)*cos(x./L1(iSlope) + phase1(iSlope)) ...
             + A2(iSlope)*cos(x./L2(iSlope) + phase2(iSlope)));
elseif (iDataSet == 3)                           % Test
    C = [5.0192    4.1967    5.7959    4.1100    5.4698    4.3181    5.5857    4.4332    5.1541    4.1126];
    A1 = [2.4093    0.5730    1.5166    2.7033    2.7161    0.3806    0.7499    1.1940    2.0330    0.8297];
    A2 = [2.3418    0.7315    2.0937    2.9211    2.8283    1.2751    0.0923    2.3852    1.0018    2.0223];
    L1 = [196.7515   58.6599   90.4522   35.1649   47.4189  132.4569  177.3261  192.9987  181.8446  148.9697];
    L2 = [115.6132  123.1435  153.0222  131.9083   56.0980  114.6437  112.1731  193.3306  113.4799  116.5240];
    phase1 = [5.6115    3.6557    6.1251    5.9547    2.4127    2.0965    2.5519    4.7868    1.9406    4.4325];
    phase2 = [3.8455    0.6122    3.8308    3.9052    0.5636    2.3102    5.9921    1.9913    2.9104    1.0494];
    alpha = 0.5*(C(iSlope) + A1(iSlope)*cos(x./L1(iSlope) + phase1(iSlope)) ...
             + A2(iSlope)*cos(x./L2(iSlope) + phase2(iSlope)));
end