class Recipe < ApplicationRecord
  has_many :comments

  validates :title, presence: true, length: { maximum: 70, minimum: 5}
  validates :description, presence: true, length: { maximum: 600 }

  before_save :set_slug

  scope :published, -> { where(published: true) }
  scope :featured, -> { where(featured: true) }
  scope :recent, -> { order(created_at: :desc) }
  scope :by_category, ->(category) { where(category: category) }

  def cook_time_unit
    # `time_unit` que armazena a unidade de tempo selecionada pelo usuário
    time_unit
  end

  def cook_time_value
    # `time_value` que armazena o valor numérico do tempo de cozimento fornecido pelo usuário
    time_value
  end


  def cook_time
    if cook_time_unit == 'hours'
      cook_time_value * 60
    else
      cook_time_value
    end
  end


  def cook_time_in_minutes(unit = :minutes)
    case unit
    when :minutes
      cook_time
    when :hours
      cook_time / 60
    end
  end

  private

  def set_slug
    self.slug = title.parameterize
  end
end
