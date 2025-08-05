class EventsController < ApplicationController
  before_action :authenticate_user!

  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
    @booking = current_user.bookings.find_by(event: @event)
  end

  def new
    @event = current_user.events.new
  end

  def create
    @event = current_user.events.new(event_params)
    if @event.save
      redirect_to @event, notice: 'Événement créé!'
    else
      render :new, status: unprocessable_entity
    end
  end

  def destroy
    @event = Event.find(params[:id])

    if @event.user == current_user
      @event.destroy
      redirect_to events_path, notice: 'Événement supprimé avec succès!'
    else
      redirect_to events_path, alert: 'Vous ne pouvez pas supprimer cet événement.'
    end
  end
  private

  def event_params
    params.require(:event).permit(:title, :description, :event_date, :location, :max_participants)
  end
end
