class Order < ActiveRecord::Base
	has_many :line_items, dependent: :destroy
	PAYMENT_TYPES = ["Visa", "Master Card", "BitCoin"]
	validates :name, :address, :email, :stripe_card_token, presence: true
	validates :pay_type, inclusion: PAYMENT_TYPES

	attr_accessor :stripe_card_token

	def add_line_items_from_cart(cart)
		cart.line_items.each do |item|
			item.cart_id = nil
			line_items << item
		end
	end

	def total_price
		line_items.to_a.sum {|item| item.total_price }
	end

	def save_with_card_token
		if valid?
			charge = Stripe::Charge.create(
			  :amount => (total_price * 100).to_i,
			  :currency => "cad",
			  :card => stripe_card_token,
			  :description => "Charge for PragProg"
			)
			self.stripe_charge_id = charge.id
			save!
		end
	end
end
