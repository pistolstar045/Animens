class AnimesController < ApplicationController
  def new
    @anime = Anime.new
  end

  def create
    @anime = Anime.new(anime_params)
  if @anime.save
    tags = Vision.get_image_data(@anime.image)
    tags.each do |tag|
      @anime.tags.create(name: tag)
    end
    redirect_to anime_path(@anime.id)
  else
     @customer = current_customer
     @animes = Anime.page(params[:page])
     render :new
  end

  end

  def index
   @customer = current_customer
   @anime = Anime.new

   @animes = Anime.page(params[:page])
  end

  def show
    @newanime =Anime.new
    @anime =Anime.find(params[:id])
    @customer = @anime.customer
    @anime_comment = AnimeComment.new
  end

  def edit
   @anime = Anime.find(params[:id])
   if @anime.customer == current_customer
    render "edit"
   else
    redirect_to animes_path
   end
  end

  def update
    @anime =Anime.find(params[:id])
    @anime.customer_id = current_customer.id
    if @anime.update(anime_params)
     flash[:notice]="Anime was successfully updated."
     redirect_to anime_path(@anime.id)
    else
     render :edit
    end
  end

  def destroy
    @anime = Anime.find(params[:id])
    if @anime.destroy
      flash[:notice]="Anime was successfully destroyed."
      redirect_to animes_path
    end
  end

  private

  def anime_params
    params.require(:anime).permit(:title, :body, :image)
  end
end


