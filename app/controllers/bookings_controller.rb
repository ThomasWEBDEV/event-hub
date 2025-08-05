class BookingsController < ApplicationController
  def index
    @bookings = current_user.bookings.includes(:event)
  end

  def destroy
    @booking = current_user.bookings.find(params[:id])
    @booking.destroy
    redirect_to bookings_path, notice: 'Inscription annulée!'
  end

  def create
    @event = Event.find(params[:event_id])
    @booking = @event.bookings.new(user: current_user)

    if @booking.save
      redirect_to @event, notice: 'Inscription réussie!'
    else
      redirect_to @event, alert: 'Erreur lors de l\'inscription'
    end
  end
end
