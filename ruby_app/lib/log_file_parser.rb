class LogFileParser

  attr_accessor :logfile_path

  def initialize(logfile_path)
    @logfile_path = logfile_path
  end

  def parse
    return 'Attach log file to parse data' if logfile_path.nil?
    @parsed_data = Hash[
      File.open(@logfile_path).map { |r| r.split(/\s+/) }.group_by(&:first).collect do |key, values|
        [ key, values.collect { |v| v[1] } ]
      end
    ] if valid_file?(logfile_path)
  end

  private

  def valid_file?(path)
    return false unless File.exists? path
    true
  end
end
