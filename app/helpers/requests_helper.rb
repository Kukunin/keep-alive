module RequestsHelper
  def status_options(value)
    options_for_select(
      Request.statuses.index_by { |status| Request.human_status(status) },
      value
    )
  end

  def types_options(value)
    options_for_select(
      Request.types.index_by { |type| Request.human_type(type) },
      value
    )
  end
end
