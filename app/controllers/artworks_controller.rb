class ArtworksController < ApplicationController
  before_filter :authenticate_user!, :except => [:show,:index]
  # GET /artworks
  # GET /artworks.xml
  caches_action :index
  caches_action :show
  cache_sweeper :artwork_sweeper
  
  def index
  	@artworks = Artwork.all_cached
  	@galleries = Gallery.all
  	@title = "Artwork"
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @artworks }
    end
  end

  # GET /artworks/1
  # GET /artworks/1.xml
  def show
  	@artwork = Artwork.find_by_permalink(params[:id])
    @title = "#{@artwork.name} - Artwork "
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @artwork }
    end
  end

  # GET /artworks/new
  # GET /artworks/new.xml
  def new
  	@artwork = Artwork.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @artwork }
    end
  end

  # GET /artworks/1/edit
  def edit
    @artwork = Artwork.find_by_permalink(params[:id])
  end

  # POST /artworks
  # POST /artworks.xml
  def create
    @artwork = Artwork.new(params[:artwork])

    respond_to do |format|
      if @artwork.save
      	flash[:notice] = "New artwork has been created"
      	format.html { redirect_to(:action => :index, :controller => "/admin", :notice => 'Artwork was successfully created.') }
        format.xml  { render :xml => @artwork, :status => :created, :location => @artwork }
        format.js
     else
     	flash[:notice] = "Please try again"
        format.html { render :action => "new" }
        format.xml  { render :xml => @artwork.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /artworks/1
  # PUT /artworks/1.xml
  def update
    @artwork = Artwork.find_by_permalink(params[:id])

    respond_to do |format|
      if @artwork.update_attributes(params[:artwork])
      	format.html { redirect_to(:action => :index, :controller => "/admin", :notice => 'Artwork was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @artwork.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /artworks/1
  # DELETE /artworks/1.xml
  def destroy
    @artwork = Artwork.find_by_permalink(params[:id])
    @artwork.destroy
    expire_page :action => :index
    
    respond_to do |format|
      format.html { redirect_to(:action => :index, :controller => "/admin") }
      format.xml  { head :ok }
    end
  end
end
