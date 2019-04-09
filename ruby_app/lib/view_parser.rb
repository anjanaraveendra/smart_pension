class ViewParser < LogFileParser
	def most_views
    @most_views ||= fetch_view_count
  end

  def unique_views
    @unique_views ||= fetch_view_count(true)
  end

  private

  def fetch_view_count(uniq=false)
    @parsed_data.each_with_object({}) do |(url, value), logs|
      logs[url] = uniq ? value.uniq.size : value.size
    end if @parsed_data
  end
end