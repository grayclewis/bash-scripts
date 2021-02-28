# As a ruby program...

file = File.open("checked-links.txt", "w")

File.readlines("urls.txt").each do |line|
  report = LinkChecker.new(line.strip).call
  file.puts report.problem_summary
end

file.close


# ...or as a rake task...

task :check_links, [:filename] => :environment do |_t, args|
  file = File.open("checked-links.txt", "w")

  File.readlines(args.fetch(:filename)).each do |line|
    report = LinkChecker.new(line.strip).call
    file.puts report.problem_summary
  end

  file.close
end