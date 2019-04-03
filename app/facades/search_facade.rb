class SearchFacade
  def initialize(house)
    @house_id = service.get_house_id(house)
  end

  def total_students
    "#{students.count} Students"
  end

  def students
    service.student_info(@house_id).map do |student_info|
      Student.new(student_info)
    end
  end

  private

  def service
    SearchService.new
  end
end
