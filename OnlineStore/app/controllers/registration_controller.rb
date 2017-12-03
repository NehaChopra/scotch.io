class RegistrationController < Devise::RegistrationsController

	def new
		@customer= Customer.new
	end

	def create
		@customer = Customer.new
		@customer.firstname = params[:customer][:firstname]
		@customer.lastname = params[:customer][:lastname]
		@customer.email = params[:customer][:email]
		@customer.password = params[:customer][:password]
		@customer.password_confirmation =params[:customer][:password_confirmation]

		@customer.valid?
		if @customer.errors.blank?
			@customer.save
			redirect_to 'products#index'
		else
			render :action => "new"
		end
	end

end