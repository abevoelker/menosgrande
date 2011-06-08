# encoding: utf-8

require 'idn'

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
  def show
    if params[:key]
      @shortener = Shortener.find_by_key(params[:key]) || not_found
    else
      @shortener = Shortener.find(params[:id])
    end

    redirect_to @shortener.url, :status => 301 if is_redirect_domain?(request.host)
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


  private
    def not_found
      raise ActiveRecord::RecordNotFound, "Shortener not found"
    end

    def is_redirect_domain?(domain)
      REDIS.SISMEMBER('domains', domain) == 1 ||
        REDIS.SISMEMBER('domains', IDN::Idna.toUnicode(domain)) == 1
    end

end
