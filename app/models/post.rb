class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: ["Fiction", "Non-Fiction"]}
  validate :is_clickbait?
  
   CLICKBAIT_PATTERNS = [
    /Won't Believe/i,
    /Secret/i,
    /Top [0-9]*/i,
    /Guess/i
  ]
  
  

  def clickbait
    key_words = (/Won't Believe|Secret|Top [\d*]|Guess/)

    if self.title && !self.title.match(key_words)
        errors.add(:title, "is not clickbate-y enough.")
    end
end
  
  
end
