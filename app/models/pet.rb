class Pet < ApplicationRecord
  belongs_to :shelter
  validates_presence_of :name, :age, :sex, :image, :description

  def self.valid_input(pet_info)
    sex = pet_info[:sex].strip[0].upcase
    pet_info[:sex] = sex
    pet_info
  end
end