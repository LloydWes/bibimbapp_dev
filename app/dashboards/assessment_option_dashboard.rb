require "administrate/base_dashboard"

class AssessmentOptionDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    assessment_question: Field::BelongsTo,
    assessment: Field::BelongsTo,
    id: Field::Number,
    letter: Field::String,
    answer: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :assessment_question,
    :assessment,
    :id,
    :letter,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :assessment_question,
    :assessment,
    :id,
    :letter,
    :answer,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :assessment_question,
    :assessment,
    :letter,
    :answer,
  ].freeze

  # Overwrite this method to customize how assessment options are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(assessment_option)
  #   "AssessmentOption ##{assessment_option.id}"
  # end
end
