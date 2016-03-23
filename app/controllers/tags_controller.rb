class TagsController < ApplicationController

  before_action :authenticate_user!, only: [:new, :edit, :destroy]

  def index
    @tags = Tag.all
  end

  def create
    @tag = Tag.new(tag_params)

    if @tag.save
      redirect_to tags_path(@tags), notice: "The tag was successfully created, nice work!"
    else
      flash.now[:error] = "An error occured, you f'd up"
      render :new
    end
  end

  def new
    @tag = Tag.new
  end

  def edit
    @tag = Tag.find(params[:id])
  end

  def show
    @tag = Tag.find(params[:id])
  end

  def update
    @tag = Tag.find(params[:id])

    if @tag.update(tag_params)
      redirect_to tag_path(@tag), notice: "Strong work, the tag was updated!"
    else
      flash.now[:error] = "An error occured, nothing was updated"
      render :edit
    end
  end

  def destroy
    @tag = Tag.find(params[:id])

    @tag.destroy
    redirect_to tags_path
  end

  private
  def tag_params
    params.require(:tag).permit(:name)
  end

end
