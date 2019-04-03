class SearchService
  def student_info(house)
    get_json("/api/v1/house/#{house}#{auth}")[:data][0][:attributes][:students]
  end

  private

  def auth
    "?api_key=#{ENV['HOGWARTS_API_KEY']}"
  end

  def get_json(url)
    JSON.parse(response(url).body, symbolize_names: true)
  end

  def response(url)
    conn.get(url)
  end

  def conn
    Faraday.new(url: 'http://hogwarts-as-a-service.herokuapp.com') do |faraday|
      faraday.adapter  Faraday.default_adapter
    end
  end
end
