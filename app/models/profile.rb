class Profile < ActiveRecord::Base
  belongs_to :user
  validates :gender, inclusion: ['male', 'female']
  validate :name_exists, :male_cant_be_sue

  def name_exists
  	if first_name.blank? and last_name.blank?
  		errors.add(:last_name, "cannot both be empty!")
  	end
  end

  def male_cant_be_sue
  	if gender == 'male' and first_name =='Sue'
  		errors.add(:first_name, "Male can't be named Sue")
  	end
  end

  def  self.get_all_profiles(min, max)
  	profiles = Profile.where("birth_year BETWEEN ? AND ?", min, max).order('birth_year asc')

  end
end
