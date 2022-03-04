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

  def tags_options(value)
    options_for_select(
      Tag.all.map { |tag| [tag.title, tag.id] },
      value
    )
  end

  def with_region(title, region)
    [title, human_region(region)].filter(&:present?)
  end

  def human_region(region)
    region && "#{region} #{I18n.t('common.region')}"
  end
end
