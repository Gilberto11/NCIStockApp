
class Stock < ApplicationRecord
	#stock belongs to user
	belongs_to :user
	#validation to check if ticker field was left empty
	validates :ticker, presence: true
	#validation for entering invalid ticker
	validates :ticker, format: { without: /\s/ }
end