class Product < ApplicationRecord
	has_many :order_lines

	default_scope { where(status: true) }
end
