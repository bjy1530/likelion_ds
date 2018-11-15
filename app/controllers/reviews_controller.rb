class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [ :new, :edit, :create, :update, :destroy ]
  # GET /reviews
  # GET /reviews.json
  def index
    if params[:category]
      @reviews = Review.search(params[:category])
    else
      @reviews = Review.all
    end
  end

  # GET /reviews/1
  # GET /reviews/1.json
  def show
    
  end

  # GET /reviews/new
  def new
    @review = Review.new
  end

  # GET /reviews/1/edit
  def edit
  end

  # POST /reviews
  # POST /reviews.json
  def create
    @review = Review.new(review_params)

    uploader = ReviewImageUploader.new
    if params[:review][:image] != nil
      uploader.store!(params[:review][:image])
      @review.image = uploader.url
    end
    
    if params[:review][:image2] != nil
      uploader.store!(params[:review][:image2])
      @review.image2 = uploader.url
    end
    
    if params[:review][:image3] != nil
      uploader.store!(params[:review][:image3])
      @review.image3 = uploader.url
    end
    
    if params[:review][:image4] !=nil
      uploader.store!(params[:review][:image4])
      @review.image4 = uploader.url
    end
    
    
    respond_to do |format|
      if @review.save
        format.html { redirect_to @review, notice: 'Review was successfully created.' }
        format.json { render :show, status: :created, location: @review }
	
      else
        format.html { render :new }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
    
    # Review.create(title: params[:review][:title], content: params[:review][:content], image: params[:review][:image])
    # redirect_to '/reviews'
  end

  # PATCH/PUT /reviews/1
  # PATCH/PUT /reviews/1.json
  def update
    respond_to do |format|
      if @review.update(review_params)
        format.html { redirect_to @review, notice: 'Review was successfully updated.' }
        format.json { render :show, status: :ok, location: @review }
      else
        format.html { render :edit }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reviews/1
  # DELETE /reviews/1.json
  def destroy
    @review.destroy
    respond_to do |format|
      format.html { redirect_to reviews_url, notice: 'Review was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_review
      @review = Review.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def review_params
      params.require(:review).permit(:title, :content, :user_id, :name, :nickname, :image, :image2, :image3, :image4, :category)
    end
end
