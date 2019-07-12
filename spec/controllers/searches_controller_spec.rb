require 'rails_helper'

describe SearchesController, type: :feature do
    ## These tests need to be implemented and confirmed. This is the next step in the
    ## process, both checking things I've already implemented as well as checking for
    ## safeguards against edge cases.
    it "redirects to home page if 404/400 errors" do
    end
    
    it "gets a JSON response with a valid query" do
        visit 'search'
        within('#search') do
            fill_in 'q', with: 'house'
        end
        click_button 'Search'
        expect(page).to have_content 'Title'
    end

    it "rejects a blank query" do
    end

    it "rejects html/javascript/other code injection" do
    end

    it "trims consecutive white spaces" do
    end

    it "trims leading and trailing white spaces" do
    end

    it "trims record separators (e.g. \n or \r) from input" do
    end


    it "handles multiple word inputs and cleans extra spaces" do
    end
end
