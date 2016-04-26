feature 'User creates a question' do

  before :each do
    visit root_path
    visit new_question_path

    fill_in 'Question', with: 'What food?'
    fill_in 'Answer', with: 'rice'
    click_button 'Create Question'
  end

  scenario 'they add the questions on the page with correct parameter' do
    visit root_path
    click_link('What food?')

    fill_in 'answer_answer', with: 'rice'
    click_button 'Submit answer'

    expect(page).to have_text 'Your answer is true!'
  end

  scenario 'they add the questions on the page with wrong parameter' do
    visit root_path
    click_link('What food?')

    fill_in 'answer_answer', with: 'nice'
    click_button 'Submit answer'

    expect(page).to have_text 'Wrong answer!'
  end
end
