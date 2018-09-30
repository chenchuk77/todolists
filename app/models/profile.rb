class Profile < ActiveRecord::Base
  belongs_to :user

  # custom validator
  def any_name
  	if first_name.nil? && last_name.nil?
      errors.add(:first_name, "must provide either first or last name.")
 	end
  end

  def no_sue_male
  	if gender == 'male' && 
  	   ! first_name.nil? && 
  	   first_name == 'Sue'
      errors.add(:first_name, "sue-male is not supported.")
 	end
  end

  # built-in validators (list)
  validates :gender, inclusion: ['male', 'female']

  # custom (singular)
  validate :any_name, :no_sue_male
end
