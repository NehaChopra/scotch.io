require 'rails_helper'
require 'spec_helper'

describe Customer do
	#Tests for fields
	it {is_expected.to respond_to :firstname}
	it {is_expected.to respond_to :lastname}
	it {is_expected.to respond_to :email}
	it {is_expected.to respond_to :created_at}
	it {is_expected.to respond_to :updated_at}


	#Tests for validations
	describe 'validate lengths' do
		it {is_expected.to validate_length_of(:email).is_at_most(255)}
		it {is_expected.to validate_length_of(:encrypted_password).is_at_most(255)}
		it {is_expected.to validate_length_of(:reset_password_token).is_at_most(255)}
		it {is_expected.to validate_length_of(:current_sign_in_ip).is_at_most(255)}
		it {is_expected.to validate_length_of(:last_sign_in_ip).is_at_most(255)}
		it {is_expected.to validate_length_of(:firstname).is_at_most(255)}
		it {is_expected.to validate_length_of(:lastname).is_at_most(255)}
		it {is_expected.to validate_length_of(:confirmation_token).is_at_most(255)}
		it {is_expected.to validate_length_of(:unconfirmed_email).is_at_most(255)}
	end

	describe 'validate presence' do
		it {is_expected.to validate_presence_of :firstname }
		it {is_expected.to validate_presence_of :lastname }
	end
end