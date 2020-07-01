require 'rails_helper'

RSpec.describe 'shelter update', type: :feature do
  it 'can be updated with new information' do
    shelter = Shelter.create(name: 'Parrot Paradise',
                             address: '88 Kookaburra Road',
                             city: 'Sunshine City',
                             state: 'FL',
                             zip: '33333')

    shelter_id = shelter[:id]
    visit "/shelters/#{shelter_id}"

    expect(page).to have_content('33333')
    click_link('Update Shelter')

    fill_in('shelter[zip]', with: '33301')
    click_button('update_shelter')

    visit "/shelters/#{shelter_id}"
    expect(page).to have_content('33301')
  end
end
