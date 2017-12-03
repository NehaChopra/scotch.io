class Order < ApplicationRecord
	has_many :order_lines
	before_save :update_total_price, :generate_order_no

	def total_price
		self.order_lines.collect { |order_line| order_line.valid? ? (order_line.qty * order_line.unit_price) : 0 }.sum
	end

	private
	def update_total_price
		self[:total] = total_price
	end
	def generate_order_no
		self[:order_no] = 'O0324324';
	end
end
