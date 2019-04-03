require 'rails_helper'

describe SearchService do
  before :each do
    @house = 'slytherin'
  end

  it 'gets student info' do
    response = SearchService.new.student_info(@house)
    expect(response).to be_a(Array)
    expect(response[0]).to be_a(Hash)
  end
end
