require 'diaries'
require_relative 'setup_test_database'

describe Diaries do
  let(:diana) { Diaries.all }

  describe '.all' do
    it 'returns all diaries' do
      connection = PG.connect(dbname: 'diary_entries_test')
      connection.exec("INSERT INTO diary_entries (input, name) VALUES ('Dear Diary', 'Dear Diary');")
      expect(diana.first.input).to include 'Dear Diary'
    end
  end

  describe '.create' do
    it 'creates a new diary' do 
      sophia = Diaries.create(input: 'Today was a lovely day', name: 'Thursday')

      expect(sophia).to be_a Diaries 
      expect(sophia.input).to eq 'Today was a lovely day'
      expect(sophia.name).to eq 'Thursday'
    end
  end

  describe '.find' do 
    it 'finds a diary by id' do 
      Diaries.create(input: 'Today was a lovely day', name: 'Thursday')
      sophia = Diaries.find('2')

      expect(sophia.input).to eq 'Today was a lovely day'
      expect(sophia.name).to eq 'Thursday'
    end 
  end
end
