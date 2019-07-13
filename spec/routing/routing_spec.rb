require 'rails_helper'

RSpec.describe "Routing testing", :type => :routing do
    it "redirects to home page if 404/400 errors" do
        visit 'search/12983'
        expect(page).to have_content
    end

    it 'Load the search screen' do
        visit '/'
        expect(page).to have_button("Search")
    end

    it 'routes / to search#new' do
        expect(get: '/').to route_to(
            controller: "searches",
            action: "new"
        )
    end

    it "redirects to home page if 404/400 errors" do
        expect(get: 'search', :id => '0238').to route_to(
            controller: "searches",
            action: "new"
        )
    end
end
