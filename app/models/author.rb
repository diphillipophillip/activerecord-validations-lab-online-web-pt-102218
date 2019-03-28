class Author < ActiveRecord::Base
  validates :name, presence: true, uniquenss: true
  validates :phone_number, length: {minimum: 10}
  
end
