require 'spec_helper'

describe Sinoma do

  before :each do
    @notification_source = StringIO.new
    @sinoma = Sinoma.new @notification_source
  end

  it "takes one parameter and returns a sinoma object" do
    expect( @sinoma ).to be_an_instance_of Sinoma
  end

end

