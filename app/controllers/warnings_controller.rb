class WarningsController < ApplicationController
  def index
    @warnings = visible_warnings
  end

  def update
    cookies.permanent[warning_key(params[:id])] = '1'
    @warnings = visible_warnings
    render 'index'
  end

  private

  def warnings
    %w[disclaimer]
  end

  def visible_warnings
    warnings.filter do |warning|
      cookies[warning_key(warning)].blank?
    end
  end

  def warning_key(warning)
    "_x_warning_#{warning}"
  end
end
