require 'pg'

def setup_test_database
  connection = PG.connect(dbname: 'diary_entries_test')
  connection.exec("TRUNCATE diary_entries;")
end

def persisted_data(id:)
  connection = PG.connect(dbname: 'diary_entries_test')
  result = connection.query("SELECT * FROM diary_entries WHERE id = #{id};")
  result.first
end
