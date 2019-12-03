require 'pry'
class Patient

  attr_accessor :name, :appointment, :doctor

  @@all=[]
  
  def initialize(name)
    @name = name
    @@all << self
  end
  
  def self.all
    @@all
  end
  
  def new_appointment(date, doctor)
    Appointment.new(date, doctor, self)
  end

  def appointments
    binding.pry
    Appointment.all.select {|appointment| appointment.patient == self}
  end

  def doctors
    Appointment.all.map do |appointment|
      appointment.doctor
    end
  end
  
end