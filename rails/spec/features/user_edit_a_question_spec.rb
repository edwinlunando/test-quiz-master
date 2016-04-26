feature 'User edits a question' do

  before :each do
    visit root_path
    visit new_question_path

    fill_in 'Question', with: 'What food?'
    fill_in 'Answer', with: 'rice'
    click_button 'Create Question'
  end

  scenario 'they edit the questions on the page with correct parameter' do

    visit root_path
    visit edit_question_path(1)

    fill_in 'Question', with: 'What up?'
    fill_in 'Answer', with: 'nice'
    click_button 'Update Question'

    expect(page).to have_text 'Question saved successfully.'

  end

  scenario 'they edit the questions on the page with wrong parameter' do

    visit root_path
    visit edit_question_path(1)

    fill_in 'Question', with: ''
    fill_in 'Answer', with: ''
    click_button 'Update Question'

    expect(page).to have_text 'Question can\'t be blank'
    expect(page).to have_text 'Answer can\'t be blank'

  end
end
