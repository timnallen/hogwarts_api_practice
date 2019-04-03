class SearchService
  def student_info(house_id)
    get_json("/api/v1/house/#{house_id}")
  end

  def get_house_id(house)
    houses = get_json('/api/v1/house/')
    house_info = houses.find { |hash| hash[:name] == house.capitalize }
    house_info[:id]
  end

  private

  def auth
    ENV['HOGWARTS_API_KEY']
  end

  def get_json(url)
    JSON.parse(response(url).body, symbolize_names: true)
  end

  def response(url)
    conn.get(url)
  end

  def conn
    Faraday.new(url: 'http://hogwarts-as-a-service.herokuapp.com') do |faraday|
      faraday.headers['x_api_key'] = auth
      faraday.adapter  Faraday.default_adapter
    end
  end
end
