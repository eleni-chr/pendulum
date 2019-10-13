function T = pendulum(L,a0)

% All arguments are scalars and a0 is a positive number less than pi. The
% function calculates the period T of a simple pendulum, which is the time
% required for a weight attached to a rod of length L and negligible weight
% to start from rest, swing with no friction under the influence of gravity
% from an initial angle a0, to –a0 and back to a0 again, as shown in the
% attached figure. The motion is determined by physics. The function starts
% its calculation with the pendulum angle, theta, equal to a0 and then
% calculates a sequence of decreasing pendulum angles, each at a time
% separated from the one before it by delta_t=1*10-6 s. It continues until
% the pendulum has passed its lowest point, at which theta=0. The elapsed
% time equals T/4. The calculation at each time step proceeds as follows:
% The angular acceleration alpha is set equal to -9.8.*sin(theta)./L. Then
% the angular velocity, omega, is increased by the product of the angular
% acceleration and delta_t. That new angular velocity is then used to
% obtain a new theta by adding the product of the angular velocity and
% delta_t to the old theta.

if L==0
    T=0;
else
    theta=a0; %angle (in units of radians).
    delta_t=1e-6; %time (in units of seconds).
    angles=0;
    omega=0; %angular velocity (in units of radians/s).
    while theta>0
        alpha=-9.8.*sin(theta)./L; %angular acceleration (in units of radians/s^2).
        % -9.8 isthe acceleration due to gravity (in units of m/s^2).
        omega=omega+(alpha.*delta_t);
        theta=theta+(omega.*delta_t);
        angles=[angles,theta];
    end
    T=(numel(angles)-1).*delta_t.*4;
end
end