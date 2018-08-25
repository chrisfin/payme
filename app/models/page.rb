class Page < ApplicationRecord
	belongs_to :receiver
	validates :name, presence: true, length: { maximum: 50 }
	validates :recurring, presence: true, length: { maximum: 50 }
	BILLING_INTERVALS = ['None', 'Daily', 'Weekly', 'Monthly', 'Quarterly', 'Bi-Annually', 'Yearly']
end
