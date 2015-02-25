require 'grape'
require_relative './todo_item'

class TodoApi < Grape::API
  version 'v1', using: :path
  format :json

  resource :todo_items do
    post do
      TodoItem.new(label: params[:label]).save!
    end

    get do
      TodoItem.all
    end
  end
end
