require 'rails_helper'

describe "Routing testing", :type => :routing do
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

    it "redirects to home page if 404/400 errors" do
        expect(get: 'search', :id => '0238').to route_to(
            controller: "searches",
            action: "new"
        )
    end
end
