require_relative 'lib/log_file_parser'
require_relative 'lib/view_parser'
require 'awesome_print'

parser = ViewParser.new(ARGV[0])
res = parser.parse

unless (res == 'Attach log file to parse data') || (res == 'Given file does not exist')
  %w(most unique).each do |action|
    puts "\n\n\n #{action.capitalize} Views \n\n\n"
    ap parser.send("#{action}_views")
  end
else
  puts res
end
