require File.join(Dir.pwd, 'spec', 'spec_helper')

describe 'UserSkillList' do

  before do
    simulate_connection_to_server
  end

  after do

  end


  it 'should pass if user skill list attribute is not specifed' do
    user_id = 123
    request_data = FactoryGirl.attributes_for(:user_skill_list, {
      :total_entries => 1,
      :total_pages => 1,
      :skills => [FactoryGirl.attributes_for(:user_skill)]
    }).to_json
    TheCity.stub(:admin_request).and_return(request_data)

    reader = TheCity::UserSkillListReader.new(user_id)
    skill_list = TheCity::UserSkillList.new(reader)

    skill = skill_list[0]
    skill.name.should == "Teaching-Curriculum"
  end


  it 'should pass if user skill list is empty' do
    user_id = 123
    page = 2
    request_data = FactoryGirl.attributes_for(:user_skill_list, {
      :total_entries => 1,
      :total_pages => 1,
      :skills => []
    }).to_json
    TheCity.stub(:admin_request).and_return(request_data)
    reader = TheCity::UserSkillListReader.new(user_id, page)
    skill_list = TheCity::UserSkillList.new(reader)

    skill_list.empty?.should be_true
  end


  it 'should return a valid list of user skills' do 
    user_id = 123
    page = 2
    request_data = FactoryGirl.attributes_for(:user_skill_list, {
      :total_entries => 1,
      :total_pages => 1,
      :skills => [FactoryGirl.attributes_for(:user_skill)]
    }).to_json
    TheCity.stub(:admin_request).and_return(request_data)

    reader = TheCity::UserSkillListReader.new(user_id, page)
    skill_list = TheCity::UserSkillList.new(reader)

    skill = skill_list[0]
    skill.name.should == "Teaching-Curriculum"
  end


  it 'should iterate using *each* method' do
    user_id = 123
    request_data = FactoryGirl.attributes_for(:user_skill_list, {
      :total_entries => 1,
      :total_pages => 1,
      :skills => [FactoryGirl.attributes_for(:user_skill)]
    }).to_json
    TheCity.stub(:admin_request).and_return(request_data)

    reader = TheCity::UserSkillListReader.new(user_id)
    skill_list = TheCity::UserSkillList.new(reader)

    skills = []
    skill_list.each { |skill| skills << skill.name }
    skills.should == ["Teaching-Curriculum"]
  end  


  it 'should iterate using *collect* method' do
    user_id = 123
    request_data = FactoryGirl.attributes_for(:user_skill_list, {
      :total_entries => 1,
      :total_pages => 1,
      :skills => [FactoryGirl.attributes_for(:user_skill)]
    }).to_json
    TheCity.stub(:admin_request).and_return(request_data)

    reader = TheCity::UserSkillListReader.new(user_id)
    skill_list = TheCity::UserSkillList.new(reader)

    skills = skill_list.collect { |skill| skill.name }
    skills.should == ["Teaching-Curriculum"]
  end   

end


