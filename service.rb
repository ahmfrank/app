require 'sinatra'
require "sinatra/namespace"

class Book
    @@books = [
         { id: "Test-1", name: "Docker for AHM" },
         { id: "Test-2", name: "Docker with Fargate" }
         { id: "Test-3", name: "Docker on ECS" }
    ]

    def self.all
        @@books
    end

    def self.find(book_id)
        @@books.select { |p| p[:id] == book_id }.first
    end
end


get '/' do
    'Healthy!!!'
end

get '/stat' do
    'Healthy!!!'
end
namespace '/api' do

    before do
        content_type 'application/json'
    end

    # /api/books
    get '/books' do
        Book.all.to_json
    end

    # /appi/books/:id
    get '/books/:id' do
        if (book = Book.find(params[:id])) != nil
            book.to_json
        else
            halt(404, { message:'book Not Found'}.to_json)
        end
    end

end
    
