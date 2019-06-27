
class SearchesController < ApplicationController
    def new
    end

    def show
        search_query = params['q'].strip.gsub(/\s+/, '+')
        response = RestClient.get "https://www.googleapis.com/books/v1/volumes?q=#{search_query}"

        json = JSON.parse(response)
        
        if !json['totalItems'].zero?
              @books = json["items"]
        else
            render :new
        end
    end
end
