class AppointmentsController < ApplicationController
  before_action :set_doctor
  before_action :set_appointment, only: [:show, :edit, :delete]

  def index
    @appointments = Appointment.all
  end

  def new
    @appointment = Appointment.new
  end

  def show
  end

  def create
    @appointment = Appointment.new(appointment_params)
    if @appointment.save
      redirect_to @appointment
    else
      render :new
    end
  end

  def edit
  end

  def delete
    @appointment.destroy
  end

  private

    def appointment_params
      params.require(:appointment).permit(:date)
    end
  
    def set_appointment
      @appointment = Appointment.find(params[:id])
    end

    def set_doctor
      @doctor = Doctor.find(params[:doctor_id])
    end
  end
