class MemesController < ApplicationController
  before_action :set_meme, only: [:show, :edit, :update, :destroy]

  # GET /memes
  # GET /memes.json
  def index
    @memes = Meme.all
  end

  # GET /memes/1
  # GET /memes/1.json
  def show
  end

  # GET /memes/new
  def new
    @meme = Meme.new
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_meme
      @meme = Meme.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def meme_params
      params.require(:meme).permit(:name, :author, :title, :text, :url, :permalink)
    end
end
