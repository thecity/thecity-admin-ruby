require File.join(Dir.pwd, 'spec', 'spec_helper')

describe 'UserNoteList' do

  before do
    simulate_connection_to_server
  end

  after do
    
  end


  it 'should pass if user note list attribute is not specifed' do
    user_id = 123
    request_data = FactoryGirl.attributes_for(:user_note_list, {
      :total_entries => 1,
      :total_pages => 1,
      :notes => [FactoryGirl.attributes_for(:user_note)]
    }).to_json
    TheCity.stub(:admin_request).and_return(request_data)
    note_list = TheCity::UserNoteList.new({:user_id => user_id})

    note = note_list[0]
    note.body.should == "Deaconship is complete"
  end


  it 'should pass if user note list is empty' do
    user_id = 123
    request_data = FactoryGirl.attributes_for(:user_note_list, {
      :total_entries => 1,
      :total_pages => 1,
      :notes => []
    }).to_json
    TheCity.stub(:admin_request).and_return(request_data)
    note_list = TheCity::UserNoteList.new({:user_id => user_id})

    note_list.empty?.should be_true
  end


  it 'should return a valid list of user notes' do 
    user_id = 123
    page = 2
    request_data = FactoryGirl.attributes_for(:user_note_list, {
      :total_entries => 1,
      :total_pages => 1,
      :notes => [FactoryGirl.attributes_for(:user_note)]
    }).to_json
    TheCity.stub(:admin_request).and_return(request_data)
    note_list = TheCity::UserNoteList.new({:user_id => user_id, :page => page})

    note = note_list[0]
    note.body.should == "Deaconship is complete"
  end


  it 'should iterate using *each* method' do
    user_id = 123
    request_data = FactoryGirl.attributes_for(:user_note_list, {
      :total_entries => 1,
      :total_pages => 1,
      :notes => [FactoryGirl.attributes_for(:user_note)]
    }).to_json
    TheCity.stub(:admin_request).and_return(request_data)
    note_list = TheCity::UserNoteList.new({:user_id => user_id})

    notes = []
    note_list.each { |note| notes << note.body }
    notes.should == ["Deaconship is complete"]
  end  


  it 'should iterate using *collect* method' do
    user_id = 123
    request_data = FactoryGirl.attributes_for(:user_note_list, {
      :total_entries => 1,
      :total_pages => 1,
      :notes => [FactoryGirl.attributes_for(:user_note)]
    }).to_json
    TheCity.stub(:admin_request).and_return(request_data)
    note_list = TheCity::UserNoteList.new({:user_id => user_id})

    notes = note_list.collect { |note| note.body }
    notes.should == ["Deaconship is complete"]
  end   

end


