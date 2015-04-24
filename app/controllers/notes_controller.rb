class NotesController < ApplicationController
  before_action :require_user
  before_action :fetch_notes, only: :index
  before_action :fetch_note, only: :show

  def new
    @note = Note.new
  end

  def index
    @notes
  end

  def show
    @note
  end

  def create
    @note = Note.new(text: params[:note][:text], user: @current_user)
    if @note.save
      redirect_to notes_path
    else
      render :new
    end
  end

  private

  def fetch_notes
    @notes = Note.where(user: @current_user)
  end

  def fetch_note
    @note = Note.find(params[:id])
  end

end
