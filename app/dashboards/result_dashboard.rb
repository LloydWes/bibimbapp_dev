require "administrate/base_dashboard"

class ResultDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    user: Field::BelongsTo,
    lesson: Field::BelongsTo,
    id: Field::Number,
    is_past?: Field::Boolean,
    score: Field::Number,
    date_exam: Field::DateTime,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :user,
    :lesson,
    :id,
    :is_past?,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :user,
    :lesson,
    :id,
    :is_past?,
    :score,
    :date_exam,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :user,
    :lesson,
    :is_past?,
    :score,
    :date_exam,
  ].freeze

  # Overwrite this method to customize how results are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(result)
  #   "Result ##{result.id}"
  # end
end
