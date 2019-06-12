require "administrate/base_dashboard"

class AssessmentAnswerDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    assessment_question: Field::BelongsTo,
    user: Field::BelongsTo,
    assessment: Field::BelongsTo,
    id: Field::Number,
    letter: Field::String,
    answer: Field::String,
    attempt_number: Field::Number,
    correct: Field::Boolean,
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
    :user,
    :assessment,
    :id,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :assessment_question,
    :user,
    :assessment,
    :id,
    :letter,
    :answer,
    :attempt_number,
    :correct,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :assessment_question,
    :user,
    :assessment,
    :letter,
    :answer,
    :attempt_number,
    :correct,
  ].freeze

  # Overwrite this method to customize how assessment answers are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(assessment_answer)
  #   "AssessmentAnswer ##{assessment_answer.id}"
  # end
end
