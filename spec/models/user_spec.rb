require 'rails_helper'

RSpec.describe User, :type => :model do

  before do
    @user = User.create!( :status => "dead", :email => "sky@example.com", :password => "12345678")

    @contact1 = Contact.create!( :name => "X1", :phone => "Y1", :email => "test1@example.org" )
    @contact2 = Contact.create!( :name => "X2", :phone => "Y2", :email => "test2@example.org" )

    @message1 = @user.messages.create!( :content => "GG", :contacts => [@contact1, @contact2], :status => "final" )
    @message2 = @user.messages.create!( :content => "GG", :contacts => [] )
  end

  describe ".send_theword" do

    it "should send final messages to dead user" do
      @user.send_theword

      expect( ActionMailer::Base.deliveries.count ).to eq(2)

      expect( ActionMailer::Base.deliveries.first.to ).to eq( ["test1@example.org"] )
      expect( ActionMailer::Base.deliveries.last.to ).to eq( ["test2@example.org"] )

      @user.reload
      expect( @user.status ).to eq("sent")
    end

  end


end