class UserCalendarsController < ApplicationController
  before_action :authenticate_user! # ユーザーがログインしていない場合、ログインページにリダイレクト
  before_action :set_user_calendar, only: [:show, :edit, :update, :destroy]

  def index
    @user_calendars = current_user.user_calendars
  end

  def show
    @user_calendar = UserCalendar.find(params[:id])
    @events = @user_calendar.events || [] # 空の配列を代入
  end

  def new
    @user_calendar = current_user.user_calendars.build
  end

  def create
    @user_calendar = current_user.user_calendars.build(user_calendar_params)
    if @user_calendar.save
      redirect_to new_user_calendar_event_path(user_calendar_id: @user_calendar.id), notice: 'カレンダーが作成されました。'

    else
      render :new
    end
  end

  def edit
  end

  def update
    if @user_calendar.update(user_calendar_params)
      redirect_to user_calendars_path, notice: 'カレンダーが更新されました。'
    else
      render :edit
    end
  end

  def destroy
    @user_calendar.destroy
    redirect_to user_calendars_path, notice: 'カレンダーが削除されました。'
  end

  private

  def set_user_calendar
    @user_calendar = current_user.user_calendars.find(params[:id])
  end

  def user_calendar_params
    params.require(:user_calendar).permit(:title, :description)
  end
  def show
    @user_calendar = UserCalendar.find(params[:user_calendar_id])  # カレンダーの取得
    @events = @user_calendar.events  # ユーザーのカレンダーに紐づくイベントを取得
  end
end
