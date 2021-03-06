class Wiki < ActiveRecord::Base
  has_many :roles
  has_many :users, through: :roles
  has_many :articles

  validates :name, presence: true, length: {maximum: 30}

  def administered_by?(user)
    self.roles.any? do |role|
      role.admin? && role.user_id == user.id
    end
  end

  def self.search(search)
  if search
  	where('title LIKE ?', "%#{search}%")
  else 
  	all
  end
end

end
