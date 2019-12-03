require 'spec_helper'
require 'pry'
describe 'Doctor' do
  describe '#name' do
    it 'has a name' do
      doctor_who = Doctor.new('The Doctor')
      expect(doctor_who.name).to eq('The Doctor')
    end
  end

  describe '#new' do
    it 'initializes with a name and adds itself to an array of all doctors' do
      doctor_smith = Doctor.new('John Smith')
      expect { Doctor.new('Martha Jones') }.to_not raise_error
      expect(Doctor.all).to include(doctor_smith)
    end
  end

  describe '#appointments' do
    it 'returns all appointments associated with this Doctor' do
      doctor_who = Doctor.new('The Doctor')
      doctor_smith = Doctor.new('Matt Smith')
      hevydevy = Patient.new('Devin Townsend')
      appointment = Appointment.new(  hevydevy, doctor_who,'Friday, January 32nd')
      appointment_2 = Appointment.new( hevydevy, doctor_smith,  'Saturday, January 33rd')
      
      expect(doctor_who.appointments).to include(appointment)
      expect(doctor_smith.appointments).to include(appointment_2)

    end
  end

  describe '#new_appointment' do
    it 'given a date and a patient, creates a new appointment' do
      doctor_who = Doctor.new('The Doctor')
      hevydevy = Patient.new('Devin Townsend')
      appointment = doctor_who.new_appointment(hevydevy, 'Friday, January 32nd')
      expect(doctor_who.appointments).to include(appointment)
      expect(appointment.doctor).to eq(doctor_who)
    end
  end

  describe '#patients' do
    it 'has many patients, through appointments' do
      doctor_who = Doctor.new('The Doctor')
      hevydevy = Patient.new('Devin Townsend')
      doctor_who.new_appointment(hevydevy, 'Friday, January 32nd')

      expect(doctor_who.patients).to include(hevydevy)
    end
  end
end