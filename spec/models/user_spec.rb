require 'spec_helper'

describe User do
  before { @user = User.new(name: 'Example User', email: 'user@example.com') }

  subject { @user }
    
  it { should respond_to(:name) }
  it { should respond_to(:email) }
  it { should be_valid }

  describe "when name is not present" do
    before { @user.name = " " }
    it { should_not be_valid }
  end

  describe "when email is not present" do
    before { @user.email = " " }
    it { should_not be_valid }
  end

  describe "when name is more than 50 characters" do
    before { @user.name = 'a'*51 }
    it { should_not be_valid }
  end

  describe "when email is not the correct format" do
    it "should be invalid" do
      addresses = %w(user@foo,com user_at_foo.org example.user@foo. 
        foo@bar_baz.com foo@bar+baz.com)
      addresses.each do |address|
        @user.email = address
        expect(@user).not_to be_valid
      end
    end
  end

  describe "when the email is the correct format" do
    it "should be valid" do
      addresses = %w(user@foo.COM A_US-ER@f.b.org frst.1st@foo.jp a+b@baz.cn)
      addresses.each do |address|
        @user.email = address
        expect(@user).to be_valid
      end
    end
  end

  describe "when the email is not unique" do
    before do
      user = User.new(:name => 'Duplicate User', :email => 'user@example.com')
      user.email = @user.email.upcase
      user.save
    end

    it { should_not be_valid }
  end

  describe "converts email to lower case before saving" do
    before do
      @user.email = @user.email.upcase
      @user.save
      expect(@user.email).to_not eq 'USER@EXAMPLE.COM'
    end
  end
end
