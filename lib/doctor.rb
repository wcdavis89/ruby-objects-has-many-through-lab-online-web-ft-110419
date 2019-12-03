class Doctor

  attr_accessor :name, :appointment, :patient

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def new_appointment(patient, date)
  # binding.pry
    Appointment.new(patient, self, date)
  end

  def appointments
    # binding.pry
    Appointment.all.select {|appointment| appointment.doctor == self}
  end

  def patients
    appointments.map do |appointment|
      appointment.patient
    end
  end

end