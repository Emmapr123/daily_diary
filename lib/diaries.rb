require 'database_connection'

class Diaries

  attr_reader :id, :name, :input

  def initialize(id:, name:, input:)
    @id = id 
    @name = name
    @input = input
  end 

  def self.all 
    result = DatabaseConnection.query('SELECT * FROM diary_entries')
    result.map { |entry| 
      Diaries.new(id: entry['id'], name: entry['name'], input: entry['input']) 
    }
  end 

  def self.create(name:, input:)
    result = DatabaseConnection.query("INSERT INTO diary_entries (name, input) VALUES('#{name}', '#{input}') RETURNING id, name, input;")
    Diaries.new(id: result[0]['id'], name: result[0]['name'], input: result[0]['input']) 
  end
end 