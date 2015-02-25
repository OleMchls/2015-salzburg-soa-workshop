require 'uuid'
require 'json'

class TodoItem
  TODO_FILE_PATH = File.expand_path('../todos.json', __FILE__)

  attr_accessor :id, :label

  def initialize(label:, id: nil)
    @label = label
    @id ||= UUID.new.generate
  end

  def save!
    todos = self.class.all.reject { |todo| todo.id == id }
    todos << self
    File.write(TODO_FILE_PATH, JSON.dump(todos.map(&:to_h)))
    self
  end

  def to_h
    {
      'id' => id,
      'label' => label
    }
  end

  def to_json(arg = nil)
    JSON.dump(to_h)
  end

  def self.all
    if File.exist?(TODO_FILE_PATH)
      JSON.parse(File.read(TODO_FILE_PATH)).map { |data| new(label: data['label'], id: data['id']) }
    else
      []
    end
  end
end
