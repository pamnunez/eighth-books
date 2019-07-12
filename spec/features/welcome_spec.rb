
require 'rails_helper'

RSpec.describe 'Welcome page', type: :feature do
  it 'loads the app' do
    visit '/'
    expect(page).to have_button("Search")
  end
end