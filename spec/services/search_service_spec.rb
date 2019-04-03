require 'rails_helper'

describe SearchService do
  before :each do
    @house_id = 4
    @house = 'slytherin'
  end

  it 'gets student info' do
    response = SearchService.new.student_info(@house_id)
    expect(response).to be_a(Array)
    expect(response[0]).to be_a(Hash)
  end

  it 'gets house id' do
    response = SearchService.new.get_house_id(@house)
    expect(response).to eq(4)
  end
end
