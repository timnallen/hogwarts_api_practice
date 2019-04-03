class SearchFacade
  def initialize(house)
    @house = house
  end

  def total_students
    '22 Students'
  end

  def students
    service.student_info
    student_info = get_json("/api/v1/house/#{@house}#{auth}")[:data][0][:attributes][:students]
  end

  private

  def service
  end

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
    Faraday.new(url: 'http://hogwarts-it.herokuapp.com') do |faraday|
      faraday.adapter  Faraday.default_adapter
    end
  end
end
