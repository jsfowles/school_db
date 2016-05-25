class School < ActiveRecord::Base
  # Dependent Destroy will delete
  # all records in the has_many association
  # ** This is BEST practice **
  has_many :classrooms, dependent: :destroy
  has_one :address, dependent: :destroy
end
