require 'rails_helper'

RSpec.describe type: :feature do
    before do
        visit 'search'
        within("form") do
            fill_in 'q', with: 'house'
        end
        click_button 'Search'
    end

    scenario 'go to page 2' do
        within '.pagy-bootstrap-nav .pagination' do
            click_on '2'
        end
        expect(current_path).to eq '/search/2'
    end
    
    scenario 'go to page 3' do
        within '.pagy-bootstrap-nav .pagination' do
            click_on '3'
        end
        expect(current_path).to eq '/search/3'
    end
    
    scenario 'go to page 1' do
        within '.pagy-bootstrap-nav .pagination' do
            click_on '1'
        end
        expect(current_path).to eq '/search/1'
    end

end