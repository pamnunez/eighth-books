class Book
    @@no_of_books = 0
    attr_accessor :previewLink
    attr_accessor :title
    attr_accessor :authors
    attr_accessor :publisher
    attr_accessor :thumbnail

    def initialize(previewLink, title, authors, publisher, thumbnail)
        @previewLink = previewLink
        @title = title
        @authors = authors
        @publisher = publisher
        @thumbnail = thumbnail
    end
end