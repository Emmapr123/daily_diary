require 'pg'

class Diaries

  attr_reader :id, :name, :input

  def initialize(name:, input:)
    @name = name
    @input = input
  end 

  def self.all 
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'diary_entries_test')
    else
      connection = PG.connect(dbname: 'diary_entries')
    end
    result = connection.exec('SELECT * FROM diary_entries')
    result.map { |entry| 
      Diaries.new(name: entry['name'], input: entry['input']) 
    }
  end 

  def self.create(name:, input:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'diary_entries_test')
    else
      connection = PG.connect(dbname: 'diary_entries')
    end
    result = connection.exec("INSERT INTO diary_entries (name, input) VALUES('#{name}', '#{input}') RETURNING id, name, input;")
    Diaries.new(name: result[0]['name'], input: result[0]['input']) 
  end
end 