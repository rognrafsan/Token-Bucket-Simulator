// Extended Token Bucket Simulation with Detailed Visualization and Metrics

// Main simulation function with added parameters and detailed output
function [output_traffic, token_availability, overflow_count, underflow_count] = token_bucket_simulation(bucket_size, initial_token_rate, time_duration, bursty_traffic, variable_token_rate)
    // Simulates a token bucket algorithm with enhanced features:
    // - bucket_size: Maximum tokens the bucket can hold
    // - initial_token_rate: Starting rate of token addition per time unit
    // - time_duration: Total duration of the simulation
    // - bursty_traffic: Array of input traffic data over time
    // - variable_token_rate: Optional array of token rates over time for dynamic rates
    
    // Initialize variables
    current_tokens = bucket_size;                    // Start with a full bucket
    output_traffic = zeros(1, time_duration);        // Output traffic array
    token_availability = zeros(1, time_duration);    // Token availability tracking
    overflow_count = 0;                              // Counter for token overflow instances
    underflow_count = 0;                             // Counter for token depletion instances

    disp("Starting Extended Token Bucket Simulation...");
    disp("Bucket Size: " + string(bucket_size));
    disp("Initial Token Rate: " + string(initial_token_rate));
    disp("Time Duration: " + string(time_duration));

    // Simulation loop
    for t = 1:time_duration
        // Determine token rate at time t (dynamic or static)
        if variable_token_rate(t) <> -1 then
            token_rate = variable_token_rate(t);
        else
            token_rate = initial_token_rate;
        end

        // Add tokens, respecting bucket size limit
        previous_tokens = current_tokens;
        current_tokens = min(current_tokens + token_rate, bucket_size);
        if current_tokens > bucket_size then
            overflow_count = overflow_count + 1;
        end

        disp("Time " + string(t) + ": Tokens before traffic processing: " + string(current_tokens));

        // Check if enough tokens are available for current bursty traffic
        if bursty_traffic(t) <= current_tokens then
            output_traffic(t) = bursty_traffic(t);
            current_tokens = current_tokens - bursty_traffic(t);
            disp("  Full transmission allowed: " + string(output_traffic(t)) + " tokens left: " + string(current_tokens));
        else
            output_traffic(t) = current_tokens;
            current_tokens = 0;
            underflow_count = underflow_count + 1;
            disp("  Partial transmission: " + string(output_traffic(t)) + " tokens depleted to zero.");
        end

        // Log token availability at each step
        token_availability(t) = current_tokens;
    end

    disp("Simulation Complete.");
    disp("Total Overflow Instances: " + string(overflow_count));
    disp("Total Underflow Instances: " + string(underflow_count));
endfunction

// Helper function to plot input vs output traffic
function plot_traffic_vs_output(time_duration, bursty_traffic, output_traffic)
    // Plot input bursty traffic and shaped output traffic
    t = 1:time_duration;
    subplot(4, 1, 1);
    plot(t, bursty_traffic, 'r-', t, output_traffic, 'b-', "LineWidth", 2);
    title("Bursty Input Traffic vs. Shaped Output Traffic");
    xlabel("Time");
    ylabel("Data Rate");
    legend(["Input", "Output"], "location", "northwest");
endfunction

// Helper function to plot token availability
function plot_token_availability(time_duration, token_availability)
    // Plot token availability over time
    t = 1:time_duration;
    subplot(4, 1, 2);
    plot(t, token_availability, 'g-', "LineWidth", 2);
    title("Token Availability Over Time");
    xlabel("Time");
    ylabel("Tokens Available");
    legend("Tokens");
endfunction

// Helper function to plot compliance ratio
function plot_compliance_ratio(bursty_traffic, output_traffic, time_duration)
    // Plot compliance ratio (output/input)
    compliance_ratio = output_traffic ./ bursty_traffic;
    t = 1:time_duration;
    subplot(4, 1, 3);
    plot(t, compliance_ratio, 'b-', "LineWidth", 2);
    title("Rate Compliance of Shaped Output Traffic");
    xlabel("Time");
    ylabel("Compliance Ratio");
    legend("Compliance Ratio");
endfunction

// Helper function to plot overflow and underflow counts
function plot_overflow_underflow(overflow_count, underflow_count)
    // Display overflow and underflow instances as a bar chart
    subplot(4, 1, 4);
    bar([overflow_count, underflow_count], "stacked");
    title("Token Overflow and Underflow Instances");
    xticks(1:2);
    xticklabels(["Overflow", "Underflow"]);
    ylabel("Count");
endfunction

// Function to display summary metrics
function display_summary_metrics(overflow_count, underflow_count, output_traffic, bursty_traffic)
    // Display key performance metrics
    avg_output_traffic = mean(output_traffic);
    avg_input_traffic = mean(bursty_traffic);
    compliance_ratio_avg = mean(output_traffic ./ bursty_traffic);

    disp("Simulation Summary:");
    disp("  Average Input Traffic: " + string(avg_input_traffic));
    disp("  Average Output Traffic: " + string(avg_output_traffic));
    disp("  Average Compliance Ratio: " + string(compliance_ratio_avg));
    disp("  Total Overflow Count: " + string(overflow_count));
    disp("  Total Underflow Count: " + string(underflow_count));
endfunction

// Main function to run the simulation and generate plots
function run_simulation(bucket_size, initial_token_rate, time_duration, bursty_traffic, variable_token_rate)
    // Run the token bucket simulation
    disp("Running the Extended Token Bucket Simulation...");
    [output_traffic, token_availability, overflow_count, underflow_count] = ...
        token_bucket_simulation(bucket_size, initial_token_rate, time_duration, bursty_traffic, variable_token_rate);

    // Generate plots
    clf();
    plot_traffic_vs_output(time_duration, bursty_traffic, output_traffic);
    plot_token_availability(time_duration, token_availability);
    plot_compliance_ratio(bursty_traffic, output_traffic, time_duration);
    plot_overflow_underflow(overflow_count, underflow_count);

    // Display summary metrics
    display_summary_metrics(overflow_count, underflow_count, output_traffic, bursty_traffic);
    disp("Simulation and Visualization Complete.");
endfunction

// Simulation Parameters
bucket_size = 10;               // Maximum tokens in the bucket
initial_token_rate = 2;         // Token generation rate
time_duration = 50;             // Simulation duration in time units

// Define bursty input traffic
bursty_traffic = [4, 5, 7, 1, 3, 9, 2, 0, 8, 10, 6, 1, 4, 5, 7, 2, 6, 3, 9, 10, ...
                  0, 2, 8, 4, 6, 3, 7, 9, 5, 1, 8, 2, 6, 4, 7, 9, 3, 5, 2, 8, ...
                  1, 7, 6, 9, 4, 2, 3, 8, 5, 6];

// Define dynamic token rate (optional)
variable_token_rate = [2, 2, 3, 3, 2, 1, 4, 2, 3, 2, 1, 3, 2, 3, 4, 2, 3, 1, 3, 2, ...
                       2, 2, 3, 2, 3, 4, 2, 2, 1, 3, 3, 2, 3, 3, 2, 4, 1, 3, 2, 3, ...
                       3, 1, 2, 3, 3, 2, 4, 2, 3, 1];

// Run the simulation
run_simulation(bucket_size, initial_token_rate, time_duration, bursty_traffic, variable_token_rate);
