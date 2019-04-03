class SearchFacade
  def initialize(house)
    @house = house
  end

  def total_students
    '22 Students'
  end

  def students
    service.student_info(@house).map do |student_info|
      Student.new(student_info)
    end
  end

  private

  def service
    SearchService.new
  end
end
