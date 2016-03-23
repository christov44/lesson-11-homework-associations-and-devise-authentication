class AuthorsController < ApplicationController

  before_action :authenticate_user!, only: [:new, :edit, :destroy]

  def index
    @authors = Author.all
  end

  def create
    @author = Author.new(author_params)

    if @author.save
      redirect_to authors_path(@authors), notice: "The author was successfully created, nice work!"
    else
      flash.now[:error] = "An error occured, you f'd up"
      render :new
    end
  end

  def new
    @author = Author.new
  end

  def edit
    @author = Author.find(params[:id])
  end

  def show
    @author = Author.find(params[:id])
  end

  def update
    @author = Author.find(params[:id])

    if @author.update(author_params)
      redirect_to author_path(@author), notice: "Strong work, the author was updated!"
    else
      flash.now[:error] = "An error occured, nothing was updated"
      render :edit
    end
  end

  def destroy
    @author = Author.find(params[:id])

    @author.destroy
    redirect_to authors_path
  end

  private
  def author_params
    params.require(:author).permit(:first_name, :last_name)
  end

end
