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

  def with_region(title, region)
    [title, human_region(region)].filter(&:present?)
  end

  def human_region(region)
    region && "#{region} #{I18n.t('common.region')}"
  end

  def human_district(district)
    return if district.blank?

    district.include?(I18n.t('common.district')) ? district : "#{district} #{I18n.t('common.district')}"
  end

  def request_full_city(request)
    [request.city, human_district(request.district), human_region(request.region)]
      .filter(&:present?)
      .join(', ')
  end

  def request_full_address(request)
    [request_full_city(request), request.address].filter(&:present?).join(', ')
  end

  def request_status_label(request)
    status_css_class = if request.status == "new"
      "bg-blue-500"
    elsif request.status == "active"
      "bg-orange-500"
    elsif request.status == "done"
      "bg-green-500"
    else
      "bg-green-500"
    end

    content_tag :span, request.human_status, class: "#{status_css_class} text-white p-1 rounded"
  end
end
