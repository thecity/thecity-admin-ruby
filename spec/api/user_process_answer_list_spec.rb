require File.dirname(__FILE__) + '/../spec_helper'

describe 'UserProcessAnswerList' do

  before do
    #simulate_connection_to_server
  end

  after do
  end

  it 'should pass if user process answer list attribute is not specified' do
    user_id = process_id = 123
    request_data = FactoryGirl.attributes_for(:user_process_answer_list, {
      :total_entries => 1,
      :total_pages => 1,
      :answers => [FactoryGirl.attributes_for(:user_process_answer)]
    }).to_json
    TheCity.stub(:admin_request).and_return( TheCityResponse.new(200, request_data) )
    answer_list = TheCity::UserProcessAnswerList.new({:user_id => user_id, :process_id => process_id})

    answer = answer_list[0]
    answer.question_id.should == 316
    answer.question.should == "Do you like foo?"
    answer.answer.should == "bar"
    answer.answered_at.should == Time.now.to_date.to_s
  end


  it 'should pass if user process answer list is empty' do
    user_id = process_id = 123
    request_data = FactoryGirl.attributes_for(:user_process_answer_list, {
      :total_entries => 1,
      :total_pages => 1,
      :answers => []
    }).to_json
    TheCity.stub(:admin_request).and_return( TheCityResponse.new(200, request_data) )
    answer_list = TheCity::UserProcessAnswerList.new({:user_id => user_id, :process_id => process_id})

    answer_list.empty?.should be_true
  end


  it 'should return a valid list of user process answers' do
    user_id = process_id = 123
    page = 2
    request_data = FactoryGirl.attributes_for(:user_process_answer_list, {
      :total_entries => 1,
      :total_pages => 1,
      :current_page => 2,
      :answers => [FactoryGirl.attributes_for(:user_process_answer)]
    }).to_json
    TheCity.stub(:admin_request).and_return( TheCityResponse.new(200, request_data) )
    answer_list = TheCity::UserProcessAnswerList.new({:user_id => user_id, :page => page})
    answer_list.current_page.should == 2
    answer_list.empty?.should be_false

    answer = answer_list[0]
    answer.question.should == "Do you like foo?"
  end


  it 'should iterate using *each* method' do
    user_id = process_id = 123
    request_data = FactoryGirl.attributes_for(:user_process_answer_list, {
      :total_entries => 1,
      :total_pages => 1,
      :answers => [FactoryGirl.attributes_for(:user_process_answer)]
    }).to_json
    TheCity.stub(:admin_request).and_return( TheCityResponse.new(200, request_data) )
    answer_list = TheCity::UserProcessAnswerList.new({:user_id => user_id})

    answers = answer_list.map(&:answer)
    answers.should == %w(bar)
  end


  it 'should iterate using *collect* method' do
    # redundant test, we can trust Enumerable to do its thang
  end

end


