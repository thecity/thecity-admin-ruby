require File.join(Dir.pwd, 'spec', 'spec_helper')

describe 'TerminologyList' do

  before do
    #simulate_connection_to_server
  end

  after do

  end


  it 'should pass if terminology list attribute is not specifed' do
    request_data = FactoryGirl.attributes_for(:terminology_list).to_json
    TheCity.stub(:admin_request).and_return( TheCityResponse.new(200, request_data) )
    terminology_list = TheCity::TerminologyList.new

    terminology_list.labels.should == []    
  end


  it 'should pass if terminology list is empty' do
    request_data = FactoryGirl.attributes_for(:terminology_list, :terminologies => []).to_json
    TheCity.stub(:admin_request).and_return( TheCityResponse.new(200, request_data) )
    terminology_list = TheCity::TerminologyList.new

    terminology_list.labels.should == []
  end


  it 'should return a valid list of terminologies' do
    request_data = FactoryGirl.attributes_for(:terminology_list, {
      :total_entries => 1,
      :total_pages => 1,
      :labels => [FactoryGirl.attributes_for(:terminology)]
    }).to_json
    TheCity.stub(:admin_request).and_return( TheCityResponse.new(200, request_data) )
    terminology_list = TheCity::TerminologyList.new({:page => 2})
    terminology_list.labels.should == ['CG']
  end


  it 'should iterate using *each* method' do
    request_data = FactoryGirl.attributes_for(:terminology_list, {
      :total_entries => 1,
      :total_pages => 1,
      :labels => [FactoryGirl.attributes_for(:terminology)]
    }).to_json
    TheCity.stub(:admin_request).and_return( TheCityResponse.new(200, request_data) )
    terminology_list = TheCity::TerminologyList.new

    terminologies = []
    terminology_list.each { |terminology| terminologies << terminology.label }
    terminology_list.labels.should == ['CG']
  end  


  it 'should iterate using *collect* method' do
    request_data = FactoryGirl.attributes_for(:terminology_list, {
      :total_entries => 1,
      :total_pages => 1,
      :labels => [FactoryGirl.attributes_for(:terminology)]
    }).to_json
    TheCity.stub(:admin_request).and_return( TheCityResponse.new(200, request_data) )
    terminology_list = TheCity::TerminologyList.new

    terminologies = terminology_list.collect { |terminology| terminology.label }
    terminology_list.labels.should == ['CG']
  end    


end


