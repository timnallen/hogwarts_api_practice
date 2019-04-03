require 'rails_helper'

feature 'as a User' do
    it 'shows me my house members' do
    visit '/'

    select 'Slytherin', from: 'house'

    click_on 'Get Students'

    expect(current_path).to eq('/search')
    expect(current_url).to include('house=slytherin')

    expect(page).to have_content('22 Students')

    expect(page).to have_css('.member', count: 22)

    within(first('.member')) do
      expect(page).to have_css('.name')
      expect(page).to have_css('.id')
    end
  end
end
