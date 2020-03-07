class RegistrationsController < ApplicationController
  before_action :find_registration, only: [:show]

  def index
  end

  def new
    @remote_info = host_with_port
  end

  def show; end

  def create
    @registration = Registration.new(registration_params)
    @registration.host_with_port = host_with_port
    @registration.set_initial_expires_at
    if @registration.save
      redirect_to :show
    else
      redirect_to :new
    end
  end

  private

  def registration_params
    params.require(:registration).permit(:alias, :password)
  end

  def host_with_port
    request.host_with_port
  end
end

