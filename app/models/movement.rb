class Movement < ApplicationRecord
  enum kind: [ :bodyweight, :weight ]

  scope :by_name, -> { order(:name) }

  validates :kind, inclusion: {in: Movement.kinds}

  def display_name
    name.titleize
  end
end
