require 'database_connection'

class Diaries

  attr_reader :id, :name, :input

  def initialize(name:, input:)
    @name = name
    @input = input
  end 

  def self.all 
    result = DatabaseConnection.query('SELECT * FROM diary_entries')
    result.map { |entry| 
      Diaries.new(name: entry['name'], input: entry['input']) 
    }
  end 

  def self.create(name:, input:)
   
    result = DatabaseConnection.query("INSERT INTO diary_entries (name, input) VALUES('#{name}', '#{input}') RETURNING id, name, input;")
    Diaries.new(name: result[0]['name'], input: result[0]['input']) 
  end
end 