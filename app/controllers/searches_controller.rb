class SearchesController < ApplicationController
    # require will_paginate/array

    def new
    end

    def show
        search_query = params['q'].strip.gsub(/\s+/, '+')
        response = RestClient.get "https://www.googleapis.com/books/v1/volumes?q=#{search_query}"

        json = JSON.parse(response)
        
        if !json['totalItems'].zero?
            #   @books = json["items"]
            #   paginate json: @books, per_page: 10
            @books = []
            json["items"].each do |b|
                # Initialize variables that will initialize a Book object for each search result
                previewLink = ""
                title = ""
                authors = ""
                publisher = ""
                thumbnail = ""
                
                # Make sure attribute is not blank before assigning in order to avoid nil values
                if b['volumeInfo']['previewLink'].present? then previewLink = b['volumeInfo']['previewLink'] end
                if b["volumeInfo"]["title"].present? then title = b["volumeInfo"]["title"] end
                if b["volumeInfo"]["authors"].present? then authors = b["volumeInfo"]["authors"].join(", ") end
                if b["volumeInfo"]["publisher"].present? then publisher = b["volumeInfo"]["publisher"] end
                if b["volumeInfo"]["imageLinks"].present? then thumbnail = b["volumeInfo"]["imageLinks"]["thumbnail"] end
                
                # Create an object from the search result attributes and append it to the books array to use in the view
                result = Book.new(previewLink, title, authors, publisher, thumbnail)
                @books.push(result)
            end

        else
            render :new
        end
    end
end
