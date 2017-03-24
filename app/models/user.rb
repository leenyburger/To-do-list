class User < ActiveRecord::Base
	has_one :profile, dependent: :destroy
	has_many :todo_lists, dependent: :destroy 
	has_many :todo_items, through: :todo_lists, source: :todo_items
	has_secure_password #must have password_digest in database 

	validates :username, presence: true 

	def get_completed_count 
		todo_items.where(completed:['t']).count
	end


end
 