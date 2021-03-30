require 'pg'

def reset_table
  connection = PG.connect(dbname: 'diary_entries_test')
  connection.exec("TRUNCATE diary_entries;")
  connection.exec("INSERT INTO diary_entries (input, name) VALUES ('Dear Diary', 'Dear Diary');")
end

def persisted_data(id:)
  connection = PG.connect(dbname: 'diary_entries_test')
  result = connection.query("SELECT * FROM diary_entries WHERE id = #{id};")
  result.first
end
