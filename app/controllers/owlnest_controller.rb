class OwlnestController < ApplicationController
  skip_before_action :authenticate_user!, only: [:diff,:empty]
  def diff
    @owldiff = Owldiff::Client.diff params[:parent_url], params[:child_url]
    @file_index = params[:file_index]
    render :diff , layout: !request.xhr?

    #render nothing: true
  rescue Errno::ECONNREFUSED => e
    @diff_error = "Connection to Owldiff Service could not be established: #{e.message}"
    render :diff_error, layout: false#!request.xhr?
  rescue => e
    @diff_error = e.message
    render :diff_error , layout: false#!request.xhr?
  end

  def empty
    render nothing: true
  end

end
