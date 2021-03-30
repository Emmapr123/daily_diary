feature 'diaries' do 
  scenario 'return a list of diary entries' do 
    connection = PG.connect(dbname: 'diary_entries_test')
    connection.exec("INSERT INTO diary_entries (input, name) VALUES ('Dear Diary', 'Dear Diary');")

    visit '/' 
    expect(page).to have_content 'Dear Diary'
  end 
end
