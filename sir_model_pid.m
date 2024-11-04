function sir_model_pid()
    % Define scenarios with parameters
    scenarios = {
        'Moderate Conditions', 0.99, 0.01, 0.3, 0.1, 0.01, 0.2, 0.1, 0.05, 0.05;
        'Aggressive Spread', 0.99, 0.01, 0.6, 0.1, 0.005, 0.3, 0.15, 0.1, 0.05;
        'Slow Spread', 0.99, 0.01, 0.1, 0.05, 0.02, 0.1, 0.05, 0.02, 0.02;
        'No Vaccination', 0.99, 0.01, 0.25, 0.08, 0.0, 0.25, 0.1, 0.05, 0.05;
        'High Vaccination Rate', 0.99, 0.01, 0.3, 0.1, 0.1, 0.15, 0.05, 0.03, 0.03;
        'High Initial Infection', 0.6, 0.3, 0.35, 0.1, 0.02, 0.3, 0.1, 0.05, 0.05;
        'Fluctuating Transmission', 0.99, 0.01, 0.3, 0.1, 0.01, 0.25, 0.1, 0.08, 0.05
    };

    % Simulation time
    t = linspace(0, 160, 160);

    % Run each scenario and plot results
    for i = 1:size(scenarios, 1)
        scenario = scenarios(i, :);
        S0 = scenario{2};
        I0 = scenario{3};
        R0 = 1 - S0 - I0;
        beta = scenario{4};
        gamma = scenario{5};
        vaccination_rate = scenario{6};
        Kp = scenario{7};
        Ki = scenario{8};
        Kd = scenario{9};
        setpoint = scenario{10};

        % Initialize PID controller values
        integral = 0;
        previous_error = 0;

        S = S0; I = I0; R = R0;
        results = zeros(length(t), 4); % Columns for S, I, R, lockdown intensity

        for j = 1:length(t)
            time = t(j);

            % Adjust infection rate for "Fluctuating Transmission" scenario
            if strcmp(scenario{1}, 'Fluctuating Transmission')
                adjusted_beta = beta * (1 + 0.3 * sin(time / 20));
            else
                adjusted_beta = beta;
            end

            % Update lockdown intensity using the PID controller
            [lockdown_intensity, integral, previous_error] = pid_update(setpoint, I, Kp, Ki, Kd, integral, previous_error, 1);
            lockdown_intensity = max(0, min(lockdown_intensity, 1));
            new_beta = adjusted_beta * (1 - lockdown_intensity);

            % Solve the SIR model using Euler's method
            dS_dt = -new_beta * S * I + vaccination_rate * S;
            dI_dt = new_beta * S * I - gamma * I;
            dR_dt = gamma * I + vaccination_rate * S;

            S = S + dS_dt;
            I = I + dI_dt;
            R = R + dR_dt;

            results(j, :) = [S, I, R, lockdown_intensity];
        end

       % Plotting results for each scenario
            figure;
            plot(t, results(:, 2), 'r', 'DisplayName', 'Infected');
            hold on;
            plot(t, results(:, 4), 'b--', 'DisplayName', 'Lockdown Intensity');
            xlabel('Time');
            ylabel('Proportion of Population');
            title(['Disease Spread with PID Control (' scenario{1} ')']);
            legend show;
            hold off;
            pause; % Wait for user input before closing the figure

    end
end

% PID update function
function [output, integral, previous_error] = pid_update(setpoint, current_value, Kp, Ki, Kd, integral, previous_error, dt)
    error = setpoint - current_value;
    integral = integral + error * dt;
    derivative = (error - previous_error) / dt;
    output = Kp * error + Ki * integral + Kd * derivative;
    previous_error = error;
end
