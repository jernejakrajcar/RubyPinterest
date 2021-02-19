class BoardsController < ApplicationController
  before_action :set_board, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :correct_user, only: [:edit, :update, :destroy]

  def index
    #maybe i won't need this
    @boards = Board.all
  end

  def new
    @board = current_user.boards.build
  end

  def create
    @board = current_user.boards.build(board_params)

    respond_to do |format|
      if @board.save
        format.html { redirect_to user_path(current_user.name), notice: 'Board was successfully created!' }
        format.json { render :show, status: :created, location: @board }
      else
        format.html { render :new }
        format.json { render json: @boards.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
  end

  def edit
  end

  def update
    respond_to do |format|
      if @board.update(board_params)
        format.html { redirect_to user_path(current_user.name), notice: 'Board was successfully updated!' }
        format.json { render :show, status: :ok, location: @board }
      else
        format.html { render :edit }
        format.json { render json: @boards.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @board.destroy
    respond_to do |format|
      format.html { redirect_to user_path(current_user.name), notice: 'Board was successfully deleted!' }
      format.json { head :no_content }
    end
  end

  private
  def set_board
    @board = Board.find(params[:id])
  end

  def board_params
    params.require(:board).permit(:name)
  end

  def correct_user
    @board = current_user.boards.find_by(id: params[:id])
    redirect_to boards_path, notice: "Not authorized to edit this board" if @board.nil?
  end

end
