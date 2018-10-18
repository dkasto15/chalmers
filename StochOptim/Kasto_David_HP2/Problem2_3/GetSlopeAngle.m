function alpha = GetSlopeAngle(x, iSlope, iDataSet)

if (iDataSet == 1) % Training
 if (iSlope == 1) 
   alpha = 4 + sin(x/100) + cos(sqrt(2)*x/50);
 elseif (iSlope == 2)
   alpha = 5 + 3.9*sin(x/75) - cos(sqrt(2)*x/100);
 elseif (iSlope == 3)
   alpha = 5.5 - x/600 + 2.5*sin(x/100) + 3*cos(sqrt(2)*x/100);
 elseif (iSlope == 4)
   alpha = 5.1 + 2*sin(x/65) + 3*cos(sqrt(5)*x/100);
 elseif (iSlope == 5)
   alpha = 6 + 3*sin(x/75) + 2*cos(sqrt(4)*x/75);
 elseif (iSlope == 6)
   alpha = 4 + 4*sin(x/450) - cos(sqrt(2)*x/100);
 elseif (iSlope == 7)
   alpha = 2 + x/250 - sin(x/50) + 2*cos(sqrt(3)*x/80);
 elseif (iSlope == 8)
   alpha = 5 - 2*sin(x/75) + cos(sqrt(1.5)*x/50);
 elseif (iSlope == 9)
   alpha = 4.9 + 2.5*sin(x/50) + 2.5*cos(sqrt(5)*x/500);
 elseif (iSlope== 10)
   alpha = 4 + 2*sin(x/50) + cos(sqrt(2)*x/100);
 end 
elseif (iDataSet == 2) % Validation
 if (iSlope == 1) 
   alpha = 6 - sin(x/100) + cos(sqrt(3)*x/50);
 elseif (iSlope == 2) 
   alpha = 2.5 + sin(x/55) + cos(sqrt(6)*x/56);
 elseif (iSlope == 3) 
   alpha = 4.7 + 2*sin(x/350) - 3*cos(sqrt(2)*x/80);
 elseif (iSlope == 4) 
   alpha = 5.9 -x/800 - 1.4*sin(x/72) + 3.2*cos(sqrt(2)*x/90);
 elseif (iSlope == 5) 
   alpha = 5 + sin(x/50) + cos(sqrt(5)*x/50);
 end 
elseif (iDataSet == 3) % Test
 if (iSlope == 1) 
   alpha = 6 - sin(x/100) - cos(sqrt(7)*x/50);
 elseif (iSlope == 2)
   alpha = 1 + (x/200) + sin(x/40) + cos(sqrt(5)*x/180);
 elseif (iSlope == 3)
   alpha = 6.5 - (x/400) + sin(x/170) + 2.5*cos(sqrt(9)*x/320);
 elseif (iSlope == 4)
   alpha = 5 + (x/700) - 4*sin(x/800) + cos(sqrt(2)*x/50);
 elseif (iSlope == 5)
   alpha = 4 + (x/1000) + sin(x/70) + cos(sqrt(7)*x/100);
 end
end