require 'rails_helper'

RSpec.describe QuestionsController, type: :controller do

  let(:valid_attributes) {
    {
      question: 'What food?',
      answer: 'rice'
    }
  }

  let(:invalid_attributes) {
    {
      question: ''
    }
  }

  describe 'GET #index' do
    it 'assigns all questions as @questions' do
      questions = Question.all
      get :index, {}
      expect(assigns(:questions)).to eq(questions)
    end
  end

  describe 'GET #edit' do
    it 'assigns the requested question as @question' do
      question = Question.create! valid_attributes
      get :edit, id: question.to_param
      expect(assigns(:question)).to eq(question)
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'assigns a newly created question as @question' do
        post :create, question: valid_attributes
        expect(assigns(:question)).to be_a(Question)
        expect(assigns(:question)).to be_persisted
      end

      it 'redirects to the created question' do
        post :create, question: valid_attributes
        expect(response).to redirect_to(root_path)
      end
    end

    context 'with invalid params' do
      it 'assigns a newly created but unsaved question as @question' do
        post :create, question: invalid_attributes
        expect(assigns(:question)).to be_a_new(Question)
      end

      it 're-renders the new template' do
        post :create, question: invalid_attributes
        expect(response).to render_template('new')
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) {
        {
          question: 'Will you?',
          answer: 'yes'
        }
      }

      it 'updates the requested question' do
        question = Question.create! valid_attributes
        put :update, id: question.to_param, question: new_attributes
        question.reload
        expect(assigns(:question)).to eq(question)
      end

      it 'assigns the requested question as @question' do
        question = Question.create! valid_attributes
        put :update, id: question.to_param, question: valid_attributes
        expect(assigns(:question)).to eq(question)
      end

      it 'redirects to the question' do
        question = Question.create! valid_attributes
        put :update, id: question.to_param, question: valid_attributes
        expect(response).to redirect_to(root_path)
      end
    end

    context 'with invalid params' do
      it 'assigns the question as @question' do
        question = Question.create! valid_attributes
        put :update, id: question.to_param, question: invalid_attributes
        expect(assigns(:question)).to eq(question)
      end

      it 're-renders the edit template' do
        question = Question.create! valid_attributes
        put :update, id: question.to_param, question: invalid_attributes
        expect(response).to render_template('edit')
      end
    end
  end

  describe 'POST #answer' do
    it 'assign @result true if the answer is true' do
      question = Question.create! valid_attributes
      post :answer, id: question.to_param, answer: { answer: question.answer }
      expect(assigns(:result)).to be true
    end

    it 'assign @result false if the answer is false' do
      question = Question.create! valid_attributes
      post :answer, id: question.to_param, answer: { answer: 'HOHOHAHA' }
      expect(assigns(:result)).to be false
    end
  end

end
