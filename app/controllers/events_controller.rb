class EventsController < ApplicationController
  before_action :set_user_calendar
  before_action :set_event, only: [:edit, :update, :destroy]

  def new
    @event = @user_calendar.events.new
  end

  def create
    @event = @user_calendar.events.new(event_params)
    if @event.save
      redirect_to @user_calendar, notice: 'イベントが追加されました。'
    else
      render :new
    end
  end

  def edit; end

  def update
    if @event.update(event_params)
      redirect_to @user_calendar, notice: 'イベントが更新されました。'
    else
      render :edit
    end
  end

  def destroy
    @event.destroy
    redirect_to @user_calendar, notice: 'イベントが削除されました。'
  end

  private

  def set_user_calendar
    @user_calendar = UserCalendar.find(params[:user_calendar_id])
  end

  def set_event
    @event = @user_calendar.events.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:title, :start_time, :end_time, :description)
  end
end