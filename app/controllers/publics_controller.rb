class PublicsController < ApplicationController
  
  
  respond_to :html
  respond_to :xml, :only => :post

  layout false

  caches_page :host_meta
  
  def host_meta
    render 'host_meta', :content_type => 'application/xrd+xml'
  end
end
