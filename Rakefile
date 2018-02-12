require "rspec/core/rake_task"

RSpec::Core::RakeTask.new(:spec) do |c|
  c.rspec_opts = '--color --format doc'
end

task :default => :spec

@success = true

desc "Run Tests on Android"
task :test_android_device do
  ENV['platformName'] = 'Android'
  ENV['JUNIT_DIR'] = 'junit_reports/android_device'

  Rake::Task[:run_rspec].execute
end

task :run_rspec do
  FileUtils.mkpath(ENV['JUNIT_DIR'][/^[^\/]+/])
  begin
    @result = system "parallel_split_test spec --format d --out #{ENV['JUNIT_DIR']}.xml"
  ensure
    @success &= @result
  end
end
