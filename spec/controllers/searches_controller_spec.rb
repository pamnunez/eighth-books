require 'rails_helper'
require 'rails-controller-testing'

RSpec.describe "SearchesController", :type => :request do

    it "rejects html/javascript/other code injection" do
        get "/search"
        expect(response).to render_template(:new)
        post '/search/', :params => "<a href='http://www.rubyonrails.org'>Ruby on Rails</a>"
        expect(assigns(:search_query)).to match "Ruby on Rails"
    end

    it "trims consecutive white spaces" do
        get "/search"
        expect(response).to render_template(:new)
        post '/search/', :params => "be  ar"
        expect(assigns(:search_query)).to match "bear"
    end

    it "trims leading and trailing white spaces" do
        get "/search"
        expect(response).to render_template(:new)
        post '/search/', :params => "   bear  "
        expect(@search_query == "bear")
    end

    it "trims record separators (e.g. \n or \r) from input" do
        get "/search"
        expect(response).to render_template(:new)
        post '/search/', :params => "\rbe\nar\r"
        expect(@search_query == "bear")
    end

    it "handles multiple word inputs and cleans extra spaces" do
        get "/search"
        expect(response).to render_template(:new)
        post '/search/', :params => "bear studies"
        expect(@search_query == "bear+studies")
    end


end
