class School < ActiveRecord::Base
  # Dependent Destroy will delete
  # all records in the has_many association
  # ** This is BEST practice **
  has_many :classrooms, dependent: :destroy
  has_one :address, dependent: :destroy

  # validations go here
  # http://guides.rubyonrailse.org/active_record_validations.html
  # second line of defense for bad database
  validates_presence_of :name #MOST USED
  # inclusion
  # validates :size, inclusion: {in: [1900...2016]}
  # validates :name, inclusion: {in: ['DPL', 'CodeSchool', 'DevMountin']}
  # length
  # validates :name, length: {minimum:2, maximum: 50}
  # numericality
  # validates :year_built, numericality: {only_integer: true}
  # uniqueness
  validates_uniqueness_of :name
  # callbacks go here
  # you probably won't use these much in basic rails application
  before_save :default_year_built

private
  def default_year_built
    self.year_built = '2016' unless self.year_built.empty?
  end


end
