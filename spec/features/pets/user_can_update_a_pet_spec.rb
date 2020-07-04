require 'rails_helper'

RSpec.describe 'pet update page', type: :feature do
  it 'can update an existing pet' do
    shelter = Shelter.create(name: 'Old Dog Haven',
                               address: '166 Main St',
                               city: 'Denver',
                               state: 'CO',
                               zip: '80208')

    pet = Pet.create(image: '',
                     name: 'Maggie',
                     description: 'A thoughtful sentient being',
                     age: '2 years',
                     sex: 'female',
                     shelter: shelter)

    name = 'Margaret'

    visit "/pets/#{pet.id}"
    click_on 'Update Pet'
    expect(current_path).to eq("/pets/#{pet.id}/edit")
    fill_in 'Name', with: name
    click_on 'Update Pet'
    expect(current_path).to eq("/pets/#{pet.id}")

    expect(page).to have_content('Margaret')
    expect(page).to_not have_content('Maggie')
  end
end

# When I click the button to submit the form "Update Pet"
# Then a `PATCH` request is sent to '/pets/:id',
# the pet's data is updated,
# and I am redirected to the Pet Show page where I see the Pet's updated information