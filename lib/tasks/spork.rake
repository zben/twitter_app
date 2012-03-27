# lib/tasks/spork.rake
desc "Run spork for rspec and cucumber; press Ctrl+C to stop"
task :spork do
  puts "Running Spork for RSpec and Cucumber"
  puts "Press Ctrl+C to stop"

  spork_pids = [Process.spawn("spork rspec"), Process.spawn("spork cucumber")]

  trap("INT") do
    spork_pids.each { |pid| Process.kill(9, pid) rescue Errno::ESRCH }
    puts "Shutting down..."
    exit 0
  end

  spork_pids.each { |pid| Process.wait(pid) }
end