require 'rails_helper'

RSpec.describe EmailValidator,:type => :model do
  describe '.validate_each' do
    before(:each) do
      @user = FactoryGirl.create :user
      @user.guardian = FactoryGirl.build(:guardian)
    end
    describe "valid email types" do
      it "valid email" do
        @user.guardian.email = "email@domain.com"
        expect(@user.guardian.valid?).to eq true
      end
      it "email contains dot in address field" do
        @user.guardian.email = 'firstname.lastname@domain.com'
        expect(@user.guardian.valid?).to eq true
      end
      it "plus sign is considered valid character" do
        @user.guardian.email = 'firstname+lastname@domain.com'
        expect(@user.guardian.valid?).to eq true
      end
      it "dash in domain name is valid" do
        @user.guardian.email = 'email@domain-one.com'
        expect(@user.guardian.valid?).to eq true
      end
      it "digits in address are valid" do
        @user.guardian.email ='123456@domain-one.com'
        expect(@user.guardian.valid?).to eq true
      end
      it "underscore in address field is valid" do
        @user.guardian.email = '_____@domain-one.com'
        expect(@user.guardian.valid?).to eq true
      end
      it ".name is valid top level domain name" do
        @user.guardian.email ='email@domain.name'
        expect(@user.guardian.valid?).to eq true
      end
      it "dash in address field is valid" do
        @user.guardian.email ='firstname-lastname@domain.com'
        expect(@user.guardian.valid?).to eq true
      end
      it "dot in top level domain is valid" do
        @user.guardian.email = 'email@domain.co.jp'
        expect(@user.guardian.valid?).to eq true
      end
    end
    describe 'invalid email types' do
      it "missing @ sign and domain" do
        @user.guardian.email = 'plain_name'
        expect(@user.guardian.valid?).to eq false
      end
      it "garbage" do
        @user.guardian.email = '!@@#$O$*@&%*^%#'
        expect(@user.guardian.valid?).to eq false
      end
      it 'missing username' do
        @user.guardian.email = '@domain.com'
        expect(@user.guardian.valid?).to eq false
      end
      it 'encoded html within email is invalid' do
        @user.guardian.email = 'email <email@domain.co.jp'
        expect(@user.guardian.valid?).to eq false
      end
      it 'missing @' do
        @user.guardian.email = 'emaildomain.com'
        expect(@user.guardian.valid?).to eq false
      end
      it 'two @' do
        @user.guardian.email = 'email@domain@subdomain.co.jp'
        expect(@user.guardian.valid?).to eq false
      end
      it 'leading dot in email is not allowed' do
        @user.guardian.email = '.email@domain.com'
        expect(@user.guardian.valid?).to eq false
      end
      it 'leading dash for domain to be false' do
        @user.guardian.email = 'email.@-domain.com'
        expect(@user.guardian.valid?).to eq false
      end
      it 'trailing dot in domain is not allowed' do
        @user.guardian.email = 'email.@domain.com.'
        expect(@user.guardian.valid?).to eq false
      end
      it 'more than two dots not allowed in domain' do
        @user.guardian.email = 'email.@domain..com'
        expect(@user.guardian.valid?).to eq false
      end
    end
  end
end
