require 'rails_helper'
#require 'capybara/rspec'

describe SearchesController, type: :controller do
    it "routes /search to search#new" do
        expect(get: '/search').to route_to(
            controller: "searches",
            action: "new"
        )
    end

    it 'routes / to search#new' do
        expect(get: '/').to route_to(
            controller: "searches",
            action: "new"
        )
    end

    ## These tests need to be implemented and confirmed. This is the next step in the
    ## process, both checking things I've already implemented as well as checking for
    ## safeguards against edge cases.
    it "redirects to home page if 404 error" do
    end
    
    it "presents appropriate message if 404 error" do
    end

    it "redirects to home page if 400 error" do
    end

    it "presents appropriate message if 400 error" do
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

    it "gets a JSON response with a valid query" do
    end

    it "handles multiple word inputs and cleans extra spaces" do
    end
end
