require 'rails_helper'

describe Student do
  before :each do
    student_info = {
      id: 1,
      name: 'Name'
    }
    @student = Student.new(student_info)
  end

  it 'exists' do
    expect(@student).to be_a(Student)
  end

  describe 'instance methods' do
    it '#name' do
      expect(@student.name).to eq('Name')
    end

    it '#id' do
      expect(@student.id).to eq(1)
    end
  end
end
