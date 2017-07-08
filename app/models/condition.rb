class Condition < ActiveRecord::Base
  has_many :bikedate
  has_many :trips, through: :bikedate
  # belongs_to :bikedate, :class_name => "BikeDate", :foreign_key => :date_id

  validates :date_id, presence: true
  validates :max_temp, presence: true
  validates :mean_temp, presence: true
  validates :min_temp, presence: true
  validates :mean_humidity, presence: true
  validates :mean_visibility, presence: true
  validates :mean_wind_speed, presence: true
  validates :precipitation, presence: true


  def self.temperature_chunking(degree_one, degree_two)
    Condition.where(max_temp: (degree_one)..(degree_two))
  end

  def self.total(argument)
    argument.count
  end

  # def self.date_id_to_date(arg)
  #   arg.each {|var| Date.where(date: var.bikedate.date}
  # end

  #there will have to be a universal counter or something to store the multipl iterations through the temperature chunks
  def self.total_rides(var)
  BikeDate.all.pluck(:id, :date).each {|date| date[1] = date[1].strftime('%Y%m%d')}.select{ |sell| sell[1] == "#{var}"}.inject(0) {|sum, obj| sum += Trip.where(start_date: obj[0]).count}
  end
end



# Trip.joins(:conditions).where(conditions: { start_date: date } )
