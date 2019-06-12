require "administrate/base_dashboard"

class AssessmentQuestionDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    assessment_options: Field::HasMany,
    assessment_answers: Field::HasMany,
    assessment: Field::BelongsTo,
    id: Field::Number,
    active: Field::Boolean,
    order: Field::Number,
    question: Field::String,
    correct_letter: Field::String,
    correct_answer: Field::String,
    level_id: Field::Number,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :assessment_options,
    :assessment_answers,
    :assessment,
    :id,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :assessment_options,
    :assessment_answers,
    :assessment,
    :id,
    :active,
    :order,
    :question,
    :correct_letter,
    :correct_answer,
    :level_id,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :assessment_options,
    :assessment_answers,
    :assessment,
    :active,
    :order,
    :question,
    :correct_letter,
    :correct_answer,
    :level_id,
  ].freeze

  # Overwrite this method to customize how assessment questions are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(assessment_question)
  #   "AssessmentQuestion ##{assessment_question.id}"
  # end
end
