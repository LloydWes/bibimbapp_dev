require "administrate/base_dashboard"

class AssessmentDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    assessment_questions: Field::HasMany,
    lesson: Field::BelongsTo,
    assessment_options: Field::HasMany,
    assessment_answers: Field::HasMany,
    id: Field::Number,
    attempt_limit: Field::Number,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :assessment_questions,
    :lesson,
    :assessment_options,
    :assessment_answers,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :assessment_questions,
    :lesson,
    :assessment_options,
    :assessment_answers,
    :id,
    :attempt_limit,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :assessment_questions,
    :lesson,
    :assessment_options,
    :assessment_answers,
    :attempt_limit,
  ].freeze

  # Overwrite this method to customize how assessments are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(assessment)
  #   "Assessment ##{assessment.id}"
  # end
end
