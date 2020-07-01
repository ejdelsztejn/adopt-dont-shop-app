require 'rails_helper'

RSpec.describe "shelter new page", type: :feature do
  it "can create a new shelter" do

    visit '/shelters/new'

    fill_in('shelter[name]', with: 'Blind Kitten Rescue')
    fill_in('shelter[address]', with: '241 Silver St')
    fill_in('shelter[city]', with: 'Colorado Springs')
    fill_in('shelter[state]', with: 'CO')
    fill_in('shelter[zip]', with: '80914')
    click_button('submit_shelter')

    visit '/shelters/'

    expect(page).to have_content("Blind Kitten Rescue")
  end
end
