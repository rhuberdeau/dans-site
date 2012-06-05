class GalleriesController < ApplicationController
  before_filter :authenticate_user!, :except => [:index,:show]
  # GET /galleries
  # GET /galleries.xml
  caches_action :index
  caches_action :show
  cache_sweeper :gallery_sweeper
  
  def index
    @galleries = Gallery.all_cached
	@title = "Artwork galleries"
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @galleries }
    end
  end

  # GET /galleries/1
  # GET /galleries/1.xml
  def show
    @gallery = Gallery.find_by_permalink(params[:id])
    @artworks = @gallery.artworks.order('category_id ASC')
	@title = "#{@gallery.name} Gallery"
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @gallery }
    end
  end

  # GET /galleries/new
  # GET /galleries/new.xml
  def new
    @gallery = Gallery.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @gallery }
    end
  end

  # GET /galleries/1/edit
  def edit
    @gallery = Gallery.find_by_permalink(params[:id])
  end

  # POST /galleries
  # POST /galleries.xml
  def create
    @gallery = Gallery.new(params[:gallery])

    respond_to do |format|
      if @gallery.save
      	flash[:notice] = "New gallery has been created"
        format.html { redirect_to(:action => :index, :controller => "/admin") }
        format.xml  { render :xml => @gallery, :status => :created, :location => @gallery }
        format.js {render :layout => false} 
      else
      	flash[:notice] = "Please try again"
        format.html { render :action => "new" }
        format.xml  { render :xml => @gallery.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /galleries/1
  # PUT /galleries/1.xml
  def update
    @gallery = Gallery.find_by_permalink(params[:id])

    respond_to do |format|
      if @gallery.update_attributes(params[:gallery])
      	flash[:notice] = "Gallery #{@gallery.name} was updated"
        format.html { redirect_to(:action => :index, :controller => "/admin") }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @gallery.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /galleries/1
  # DELETE /galleries/1.xml
  def destroy
    @gallery = Gallery.find_by_permalink(params[:id])
    @gallery.destroy

    respond_to do |format|
      format.html { redirect_to(:action => :index, :controller => "/admin") }
      format.xml  { head :ok }
    end
  end
end
