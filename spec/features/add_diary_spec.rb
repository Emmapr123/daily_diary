feature 'add_diary' do
  scenario 'you can add diary entries' do 
    visit '/'
    click_on 'add entry'
    fill_in('title', :with => 'Friday')
    fill_in('input', :with => 'Today, I finally got a haircut!')
    click_on 'save'
    expect(page).to have_content 'Friday'
    expect(page).to have_content 'Today, I finally got a haircut!'
  end 
end