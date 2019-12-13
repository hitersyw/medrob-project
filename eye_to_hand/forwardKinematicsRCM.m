classdef forwardKinematicsRCM
    % from distributed/dVKinematics.cpp
   properties
       t = zeros(36); % data structure to save data
   end
   methods (Static)
      function [x, y, z] = ee_position(q1, q2, q3, q4, q5, q6)
          
          t(2) = sin(q1);
          t(3) = cos(q1);
          t(4) = cos(q4);
          t(5) = sin(q2);
          t(6) = sin(q4);
          t(7) = cos(q5);
          t(8) = t(3) * t(6);
          t(9) = t(2) * t(4) * t(5);
          t(10) = t(8) + t(9);
          t(11) = cos(q2);
          t(12) = sin(q5);
          t(25) = q3 - 1.56e-2;
          t(26) = t(2) * t(6);
          t(28) = t(3) * t(4) * t(5);
          t(27) = t(26) - t(28);
          
          % computing coordinates
          x = t(10) * t(12) * (-9.1e-3) + t(2) * t(7) * t(11) * 9.1e-3 + t(2) * t(11) * t(25);
          y = - t(5) * t(7) * 9.1e-3 - t(5) * t(25) - t(4) * t(11) * t(12) * 9.1e-3;
          z = t(12) * t(27) * (-9.1e-3)- t(3) * t(7) * t(11) * 9.1e-3 - t(3) * t(11) * t(25);
      end
   end
end