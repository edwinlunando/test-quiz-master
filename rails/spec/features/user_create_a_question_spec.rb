feature 'User creates a question' do
  scenario 'they add the questions on the page with correct parameter' do
    visit root_path
    visit new_question_path

    fill_in 'Question', with: 'What food?'
    fill_in 'Answer', with: 'rice'
    click_button 'Create Question'

    expect(page).to have_text 'Question created successfully.'
  end

  scenario 'they add the questions on the page with wrong parameter' do
    visit root_path
    visit new_question_path

    fill_in 'Question', with: ''
    fill_in 'Answer', with: ''
    click_button 'Create Question'

    expect(page).to have_text 'Question can\'t be blank'
    expect(page).to have_text 'Answer can\'t be blank'
  end
end
