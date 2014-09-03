require 'spec_helper'

describe Sinoma do

  before :each do
    @apikey = "blabla"
    @test_message = "test message\n"
    @number_of_messages = 3
    @test_messages = @test_message * @number_of_messages
    @notification_source = StringIO.new @test_messages
    @sinoma = Sinoma.new @notification_source, @apikey
    @notification = NMA::Notification.new
  end

  after :each do
    Thread.kill( @sinoma_thread )
  end

  def start
    @sinoma_thread = Thread.new do
      @sinoma.start
    end
    sleep 1.0 / 4.0
  end

  it "sends each line as a notification if data is available in the source" do
    expect( NMA ).to receive( :notify ).exactly( @number_of_messages ).times.and_yield( @notification )
    start
    expect( @notification.description ).to eq @test_message
  end

  it "waits for new messages to arrive" do
    @notification_source.string = ""
    expect( NMA ).to receive( :notify ).exactly( @number_of_messages ).times.and_yield( @notification )
    start
    @notification_source.string = @test_messages
    sleep 1
  end

  it "does not send anything if there's no data in the source" do
    @notification_source.string = ""
    expect( NMA ).not_to receive( :notify ).and_yield( @notification )
    start
  end

  it "sets the api key of the notification" do
    expect( NMA ).to receive( :notify ).exactly( @number_of_messages ).times.and_yield( @notification )
    start
    expect( @notification.apikey ).to eq @apikey
  end

end

