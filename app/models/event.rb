class Event < ApplicationRecord
	has_many :attendances
	has_many :users, through: :attendances

	validates :start_date,
	presence: true

	validates :duration,
	presence: true,
	numericality: { :greater_than => 0, only_integer: true}

	validates :title,
	presence: true,
	length: {in: 5..140}

	validates :description,
	presence: true,
	length: {in: 20..1000}

	validates :price,
	presence: true,
	numericality: { greater_than: 0, less_than: 1000, only_integer: true}

	validates :location,
	presence: true

	validate :start_must_be_in_future
	validate :duration_must_be_multiple_of_five

	def end_date
    	self.start_date + self.duration.minutes
  	end
	private
  # VALIDATION METHODS
  def start_must_be_in_future
    errors.add(:start_date, "Start date must be in the future") unless start_date.present? && start_date > Date.today
  end
  def duration_must_be_multiple_of_five
    errors.add(:duration, "Must be a multiple of 5") unless self.duration.to_i % 5 == 0
  end


end
