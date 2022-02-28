Trestle.resource(:requests) do
  menu do
    item :requests, icon: 'fa fa-star'
  end

  search_form do |q|
    select :region_eq, options_for_select(Region.regions, q.region_eq), { include_blank: true }
  end

  # Customize the table columns shown on the index view.
  #
  # table do
  #   column :name
  #   column :created_at, align: :center
  #   actions
  # end

  # Customize the form fields shown on the new/edit views.
  form do |_request|
    select :region, options_for_select(Region.regions), { include_blank: true }
    text_field :city
    text_field :address
    text_field :title
    text_field :description

    text_field :contact_name

    row do
      col { phone_field :phone }
      col { content_tag('div', style: 'margin-top: 32px') { check_box :viber } }
    end

    row do
      col { text_field :skype }
      col { text_field :telegram }
    end

    text_field :reporter_ip

    row do
      col { datetime_field :updated_at }
      col { datetime_field :created_at }
    end
  end

  # By default, all parameters passed to the update and create actions will be
  # permitted. If you do not have full trust in your users, you should explicitly
  # define the list of permitted parameters.
  #
  # For further information, see the Rails documentation on Strong Parameters:
  #   http://guides.rubyonrails.org/action_controller_overview.html#strong-parameters
  #
  # params do |params|
  #   params.require(:request).permit(:name, ...)
  # end
end
