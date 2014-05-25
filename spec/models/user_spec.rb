require 'spec_helper'

describe User do
  before do 
    @user = User.new(
      name: 'Example User', 
      email: 'user@example.com', 
      password: 'passw0rd',
      password_confirmation: 'passw0rd'
    )
  end

  subject { @user }
    
  it { should respond_to(:name) }
  it { should respond_to(:email) }
  it { should respond_to(:password_digest) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }
  it { should respond_to(:remember_token) }
  it { should respond_to(:authenticate) }
  it { should respond_to(:admin) }

  it { should be_valid }
  it { should_not be_admin }

  describe "with administrative attribute set to 'true'" do
    before do
      @user.save!
      @user.toggle!(:admin)
    end
    it { should be_admin }
  end

  describe "remember token" do
    before { @user.save }
    its(:remember_token) { should_not be_blank }
  end

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
      duplicate_user = @user.dup
      duplicate_user.save
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

  describe "when password is not present" do
    before do
      @user = User.new(
      name: 'Example User', 
      email: 'user@example.com', 
      password: ' ',
      password_confirmation: ' '
    )
    end
    it { should_not be_valid }
  end

  describe "when password doesn't match password_confirmation" do
    before { @user.password_confirmation = 'mismatch'}
    it { should_not be_valid }
  end

  describe "with a password that is too short" do
    before { @user.password = @user.password_confirmation = 'a'*5 }
    it { should be_invalid }
  end

  describe "return value of authenticate method" do
    before { @user.save }
    let(:found_user) { User.find_by(:email => @user.email) }

    describe "with valid password" do
      it { should eq found_user.authenticate(@user.password) }
    end

    describe "with invalid password" do
      let(:user_for_invalid_password) { found_user.authenticate("invalid") }

      it { should_not eq user_for_invalid_password }
      specify { expect(user_for_invalid_password).to be_false }
    end
  end

end
