# As a ruby program...

file = File.open("files/checked-links.txt", "w")

File.readlines("files/urls.txt").each do |line|
  file.puts line
  # report = LinkChecker.new(line.strip).call
  # file.puts report.problem_summary
end

file.close


# ...or as a rake task...

# task :check_links, [:filename] => :environment do |_t, args|
#   file = File.open("files/checked-links.txt", "w")

#   File.readlines(args.fetch(:filename)).each do |line|
#     report = LinkChecker.new(line.strip).call
#     file.puts report.problem_summary
#   end

#   file.close
# end