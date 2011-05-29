class ShortenersController < ApplicationController
  # GET /shorteners
  # GET /shorteners.xml
  def index
    @shorteners = Shortener.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @shorteners }
    end
  end

  # GET /shorteners/1
  # GET /shorteners/1.xml
  def show
    @shortener = Shortener.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @shortener }
    end
  end

  # GET /shorteners/new
  # GET /shorteners/new.xml
  def new
    @shortener = Shortener.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @shortener }
    end
  end

  # GET /shorteners/1/edit
  def edit
    @shortener = Shortener.find(params[:id])
  end

  # POST /shorteners
  # POST /shorteners.xml
  def create
    @shortener = Shortener.new(params[:shortener])

    respond_to do |format|
      if @shortener.save
        format.html { redirect_to(@shortener, :notice => 'Shortener was successfully created.') }
        format.xml  { render :xml => @shortener, :status => :created, :location => @shortener }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @shortener.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /shorteners/1
  # PUT /shorteners/1.xml
  def update
    @shortener = Shortener.find(params[:id])

    respond_to do |format|
      if @shortener.update_attributes(params[:shortener])
        format.html { redirect_to(@shortener, :notice => 'Shortener was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @shortener.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /shorteners/1
  # DELETE /shorteners/1.xml
  def destroy
    @shortener = Shortener.find(params[:id])
    @shortener.destroy

    respond_to do |format|
      format.html { redirect_to(shorteners_url) }
      format.xml  { head :ok }
    end
  end
end