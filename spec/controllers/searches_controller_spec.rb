require 'rails_helper'
require 'capybara/rspec'

describe SearchesController, type: :controller do
    it "renders search landing page" do
        get :searches
        expect(response).to render_template("searches")
    end

    it 'navigates to landing page if resulting JSON is empty' do
        visit '/search'
    end
end
