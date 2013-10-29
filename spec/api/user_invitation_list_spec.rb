require File.join(Dir.pwd, 'spec', 'spec_helper')

describe 'UserInvitationList' do

  before do
    simulate_connection_to_server
  end

  after do
    
  end


  it 'should pass if user invitation list attribute is not specifed' do
    user_id = 123
    request_data = FactoryGirl.attributes_for(:user_invitation_list, {
      :total_entries => 1,
      :total_pages => 1,
      :invitations => [FactoryGirl.attributes_for(:user_invitation)]
    }).to_json
    TheCity.stub(:admin_request).and_return( TheCityResponse.new(200, request_data) )
    invitation_list = TheCityAdmin::UserInvitationList.new({:user_id => user_id})

    invitation = invitation_list[0]
    invitation.source.should == "API Invite | Group A (17543) on 2012-02-06 at 16:54"
  end


  it 'should pass if user invitation list is empty' do
    user_id = 123
    request_data = FactoryGirl.attributes_for(:user_invitation_list, {
      :total_entries => 1,
      :total_pages => 1,
      :invitations => []
    }).to_json
    TheCity.stub(:admin_request).and_return( TheCityResponse.new(200, request_data) )
    invitation_list = TheCityAdmin::UserInvitationList.new({:user_id => user_id})

    invitation_list.empty?.should be_true
  end


  it 'should return a valid list of user invitations' do 
    user_id = 123
    page = 2
    request_data = FactoryGirl.attributes_for(:user_invitation_list, {
      :total_entries => 1,
      :total_pages => 1,
      :invitations => [FactoryGirl.attributes_for(:user_invitation)]
    }).to_json
    TheCity.stub(:admin_request).and_return( TheCityResponse.new(200, request_data) )
    invitation_list = TheCityAdmin::UserInvitationList.new({:user_id => user_id, :page => 2})

    invitation = invitation_list[0]
    invitation.source.should == "API Invite | Group A (17543) on 2012-02-06 at 16:54"
  end


  it 'should iterate using *each* method' do
    user_id = 123
    request_data = FactoryGirl.attributes_for(:user_invitation_list, {
      :total_entries => 1,
      :total_pages => 1,
      :invitations => [FactoryGirl.attributes_for(:user_invitation)]
    }).to_json
    TheCity.stub(:admin_request).and_return( TheCityResponse.new(200, request_data) )
    invitation_list = TheCityAdmin::UserInvitationList.new({:user_id => user_id})

    invitations = []
    invitation_list.each { |invitation| invitations << invitation.source }
    invitations.should == ["API Invite | Group A (17543) on 2012-02-06 at 16:54"]
  end  


  it 'should iterate using *collect* method' do
    user_id = 123
    request_data = FactoryGirl.attributes_for(:user_invitation_list, {
      :total_entries => 1,
      :total_pages => 1,
      :invitations => [FactoryGirl.attributes_for(:user_invitation)]
    }).to_json
    TheCity.stub(:admin_request).and_return( TheCityResponse.new(200, request_data) )
    invitation_list = TheCityAdmin::UserInvitationList.new({:user_id => user_id})

    invitations = invitation_list.collect { |invitation| invitation.source }
    invitations.should == ["API Invite | Group A (17543) on 2012-02-06 at 16:54"]
  end   

end


