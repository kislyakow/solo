class Comment < ActiveRecord::Base
	validates_presence_of :name
	validates_presence_of :email
	validates_presence_of :body
	belongs_to :post
end
