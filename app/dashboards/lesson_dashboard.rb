require "administrate/base_dashboard"

class LessonDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    level: Field::BelongsTo,
    vocabularies: Field::HasMany,
    results: Field::HasMany,
    id: Field::Number,
    order: Field::Number,
    title: Field::String,
    script: Field::Text,
    grammar: Field::Text,
    media: Field::String,
    media2: Field::String,
    icone: Field::String,
    description: Field::Text,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :level,
    :vocabularies,
    :results,
    :id,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :level,
    :vocabularies,
    #:results,
    :id,
    :order,
    :title,
    :script,
    :grammar,
    :media,
    :icone,
    :media2,
    :description,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :level,
    :vocabularies,
    #:results,
    :order,
    :title,
    :script,
    :grammar,
    :media,
    :icone,
    :media2,
    :description,
  ].freeze

  # Overwrite this method to customize how lessons are displayed
  # across all pages of the admin dashboard.
  #
  def display_resource(lesson)
    "Lesson #{lesson.title}"
  end
end
