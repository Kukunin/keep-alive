Trestle.resource(:requests) do
  menu do
    item :requests, icon: 'fa fa-star'
  end

  search_form do |q|
    select(
      :type_eq,
      options_for_select(
        Request.types.index_by { |type| Request.human_type(type) },
        q.type_eq
      ),
      { include_blank: true }
    )
    select(
      :status_eq,
      options_for_select(
        Request.statuses.index_by { |status| Request.human_status(status) },
        q.status_eq
      ),
      { include_blank: true }
    )
    select :region_eq, options_for_select(Region.regions, q.region_eq), { include_blank: true }
  end

  # Customize the table columns shown on the index view.
  table do
    column :status, ->(request) { request.human_status }
    column :type, ->(request) { request.human_type }
    column :region
    column :district
    column :city
    column :title
    column :comments_count
    column :contact_name
    column :created_at
    column :updated_at
    actions
  end

  # Customize the form fields shown on the new/edit views.
  form do |request|
    tab :request do
      select :type,
             options_for_select(
               Request.types.index_by { |type| Request.human_type(type) },
               request.type
             ),
             { include_blank: false }
      select :status,
             options_for_select(
               Request.statuses.index_by { |status| Request.human_status(status) },
               request.status
             ),
             { include_blank: false }

      text_field :title
      text_field :description

      select :region,
             options_for_select(Region.regions, request.region),
             { include_blank: true }

      text_field :district
      text_field :city
      text_field :address

      row do
        col { text_field :longitude }
        col { text_field :latitude }
      end

      text_field :contact_name

      row do
        col { phone_field :phone }
        col { content_tag('div', style: 'margin-top: 32px') { check_box :viber } }
      end

      row do
        col { text_field :telegram }
        col { text_field :instagram }
      end

      row do
        col { text_field :skype }
        col { text_field :reporter_ip }
      end

      row do
        col { datetime_field :updated_at }
        col { datetime_field :created_at }
      end
    end

    tab :comments, badge: request.comments_count do
      table CommentsAdmin.table, collection: request.comments
    end
  end
end
