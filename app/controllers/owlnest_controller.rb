class OwlnestController < ApplicationController
  def diff
    @owldiff = Owldiff::Client.diff params[:parent_url], params[:child_url]
    @file_index = params[:file_index]
    render :diff , layout: !request.xhr?
  rescue Errno::ECONNREFUSED => e
    @error = "Connection to Owldiff Service could not be established: #{e.message}"
    render :error, layout: !request.xhr?
  rescue => e
    @error = e.message
    render :error, layout: !request.xhr?
  end
end
