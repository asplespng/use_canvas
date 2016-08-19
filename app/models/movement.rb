class Movement < ApplicationRecord
  enum kind: [ :bodyweight, :weight ]

  scope :by_name, -> { order(:name) }

  def display_name
    name.titleize
  end
end
