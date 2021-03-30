feature 'diaries' do 
  scenario 'return a list of diary entries' do 
    visit '/' 
    expect(page).to have_content 'Dear Diary'
  end 
end
