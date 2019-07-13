require 'rails_helper'

RSpec.describe type: :feature do
    feature 'user searches for books' do
        scenario "gets a JSON response with a valid query" do
            visit 'search'
            within("form") do
                fill_in 'q', with: 'house'
            end
            click_button 'Search'
            expect page.status_code == 200
        end

        scenario "if I submit a blank query" do
            it "I get an error on the same page" do
                visit 'search'
                within("form") do
                    fill_in 'q', with: ''
                end
                click_button 'Search'
                # The test below fails because I'm unable to get the selenium
                # driver to work, which means I can't read the message value of
                # the native browser popup
                message = page.find("#q").native.attribute("validationMessage")
                expect(message).to eq "Please fill out this field."
                expect(current_path).to eq edit_link_path(user.links.first)
            end
        end
        scenario "user submits valid search query" do
            visit 'search'
            within("form") do
                fill_in 'q', with: 'harry'
            end
            click_button 'Search'
            expect(current_path).to eq '/search/1'
        end
        scenario "user selects a different page of results" do
            visit 'search'
            within("form") do
                fill_in 'q', with: 'harry'
            end
            click_button 'Search'
            within '.pagy-bootstrap-nav .pagination' do
                click_on '2'
            end
            expect(current_path).to eq '/search/2'
        end

        scenario "click on link to book info" do
            visit 'search'
            within("form") do
                fill_in 'q', with: 'harry'
            end
            click_button 'Search'
            first('.table > tbody > tr').click
            expect page.status_code == 200
        end

    end

end