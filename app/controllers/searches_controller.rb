class SearchesController < ApplicationController
    def new
    end
    
    def show
        if !params['q'].nil? then
            # If there is a new query passed, cache that query string to call again for new pages
            @search_query = params['q'].strip.gsub(/\s+/, '+')
            $redis.set("query", params[:q])
        else
            # If there is not a new query, use cached query
            @search_query = $redis.get("query")
        end
        
        # Google books API call and JSON parsing
        response = RestClient.get "https://www.googleapis.com/books/v1/volumes?q=#{@search_query}&maxResults=30"
        api_results = JSON.parse(response)

        if !api_results['totalItems'].zero?
            @books = []
            for b in api_results["items"] do
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
                results = Book.new(previewLink, title, authors, publisher, thumbnail)
                @books.push(results)
            end
            # Call the pagy function for arrays to paginate results
            @pagy_a, @books = pagy_array(@books, page: (params[:page]), count: 30, items: 10, size: [1, 1, 1, 1])
            
        else
            render :new
        end
    end
end
