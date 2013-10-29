require File.join(Dir.pwd, 'spec', 'spec_helper')

describe 'SkillList' do

  before do
    simulate_connection_to_server
  end

  after do

  end


  it 'should pass if skill list attribute is not specifed' do
    request_data = FactoryGirl.attributes_for(:skill_list).to_json
    TheCityAdmin.stub(:admin_request).and_return( TheCityResponse.new(200, request_data) )
    skill_list = TheCityAdmin::SkillList.new

    skill_list.skills.should == []    
  end


  it 'should pass if skill list is empty' do
    request_data = FactoryGirl.attributes_for(:skill_list, :skills => []).to_json
    TheCityAdmin.stub(:admin_request).and_return( TheCityResponse.new(200, request_data) )
    skill_list = TheCityAdmin::SkillList.new

    skill_list.skills.should == []
  end


  it 'should return a valid list of skills' do
    request_data = FactoryGirl.attributes_for(:skill_list, {
      :total_entries => 1,
      :total_pages => 1,
      :skills => [FactoryGirl.attributes_for(:skill)]
    }).to_json
    TheCityAdmin.stub(:admin_request).and_return( TheCityResponse.new(200, request_data) )
    skill_list = TheCityAdmin::SkillList.new({:page => 2})

    skill_list.skills.should == ["Welding"]
  end


  it 'should iterate using *each* method' do
    request_data = FactoryGirl.attributes_for(:skill_list, {
      :total_entries => 1,
      :total_pages => 1,
      :skills => [FactoryGirl.attributes_for(:skill)]
    }).to_json
    TheCityAdmin.stub(:admin_request).and_return( TheCityResponse.new(200, request_data) )
    skill_list = TheCityAdmin::SkillList.new

    skills = []
    skill_list.each { |skill| skills << skill.name }
    skill_list.skills.should == ["Welding"]
  end  


  it 'should iterate using *collect* method' do
    request_data = FactoryGirl.attributes_for(:skill_list, {
      :total_entries => 1,
      :total_pages => 1,
      :skills => [FactoryGirl.attributes_for(:skill)]
    }).to_json
    TheCityAdmin.stub(:admin_request).and_return( TheCityResponse.new(200, request_data) )
    skill_list = TheCityAdmin::SkillList.new

    skills = skill_list.collect { |skill| skill.name }
    skill_list.skills.should == ["Welding"]
  end    


end


