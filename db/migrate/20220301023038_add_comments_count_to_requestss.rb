class AddCommentsCountToRequestss < ActiveRecord::Migration[7.0]
  class Comment < ApplicationRecord
    belongs_to :request, counter_cache: true
  end

  class Request < ApplicationRecord
    has_many :comments
  end

  def change
    add_column :requests, :comments_count, :integer, null: false, default: 0
    reversible do |dir|
      dir.up { Request.find_each { |r| Request.reset_counters(r.id, :comments) } }
    end
  end
end
