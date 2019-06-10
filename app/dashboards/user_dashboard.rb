require "administrate/base_dashboard"

class UserDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    results: Field::HasMany,
    level: Field::BelongsTo,
    avatar_attachment: Field::HasOne,
    avatar_blob: Field::HasOne,
    thredded_posts: Field::HasMany.with_options(class_name: "Thredded::Post"),
    thredded_topics: Field::HasMany.with_options(class_name: "Thredded::Topic"),
    thredded_private_posts: Field::HasMany.with_options(class_name: "Thredded::PrivatePost"),
    thredded_started_private_topics: Field::HasMany.with_options(class_name: "Thredded::PrivateTopic"),
    thredded_last_user_topics: Field::HasMany.with_options(class_name: "Thredded::Topic"),
    thredded_last_user_private_topics: Field::HasMany.with_options(class_name: "Thredded::PrivateTopic"),
    thredded_user_messageboard_preferences: Field::HasMany.with_options(class_name: "Thredded::UserMessageboardPreference"),
    thredded_notifications_for_followed_topics: Field::HasMany.with_options(class_name: "Thredded::NotificationsForFollowedTopics"),
    thredded_messageboard_notifications_for_followed_topics: Field::HasMany.with_options(class_name: "Thredded::MessageboardNotificationsForFollowedTopics"),
    thredded_notifications_for_private_topics: Field::HasMany.with_options(class_name: "Thredded::NotificationsForPrivateTopics"),
    thredded_post_notifications: Field::HasMany.with_options(class_name: "Thredded::UserPostNotification"),
    thredded_private_users: Field::HasMany.with_options(class_name: "Thredded::PrivateUser"),
    thredded_topic_read_states: Field::HasMany.with_options(class_name: "Thredded::UserTopicReadState"),
    thredded_private_topic_read_states: Field::HasMany.with_options(class_name: "Thredded::UserPrivateTopicReadState"),
    thredded_topic_follows: Field::HasMany.with_options(class_name: "Thredded::UserTopicFollow"),
    thredded_user_detail: Field::HasOne,
    thredded_user_preference: Field::HasOne,
    thredded_private_topics: Field::HasMany.with_options(class_name: "Thredded::PrivateTopic"),
    thredded_post_moderation_records: Field::HasMany.with_options(class_name: "Thredded::PostModerationRecord"),
    thredded_post_moderated_records: Field::HasMany.with_options(class_name: "Thredded::PostModerationRecord"),
    id: Field::Number,
    email: Field::String,
    encrypted_password: Field::String,
    reset_password_token: Field::String,
    reset_password_sent_at: Field::DateTime,
    remember_created_at: Field::DateTime,
    first_name: Field::String,
    last_name: Field::String,
    date_of_birth: Field::DateTime,
    gender: Field::String,
    avatar: Field::String,
    is_admin?: Field::Boolean,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    admin: Field::Boolean,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :results,
    :level,
    :avatar_attachment,
    :avatar_blob,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :results,
    :level,
    :avatar_attachment,
    :avatar_blob,
    :thredded_posts,
    :thredded_topics,
    :thredded_private_posts,
    :thredded_started_private_topics,
    :thredded_last_user_topics,
    :thredded_last_user_private_topics,
    :thredded_user_messageboard_preferences,
    :thredded_notifications_for_followed_topics,
    :thredded_messageboard_notifications_for_followed_topics,
    :thredded_notifications_for_private_topics,
    :thredded_post_notifications,
    :thredded_private_users,
    :thredded_topic_read_states,
    :thredded_private_topic_read_states,
    :thredded_topic_follows,
    :thredded_user_detail,
    :thredded_user_preference,
    :thredded_private_topics,
    :thredded_post_moderation_records,
    :thredded_post_moderated_records,
    :id,
    :email,
    :encrypted_password,
    :reset_password_token,
    :reset_password_sent_at,
    :remember_created_at,
    :first_name,
    :last_name,
    :date_of_birth,
    :gender,
    :avatar,
    :is_admin?,
    :created_at,
    :updated_at,
    :admin,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :results,
    :level,
    :avatar_attachment,
    :avatar_blob,
    :thredded_posts,
    :thredded_topics,
    :thredded_private_posts,
    :thredded_started_private_topics,
    :thredded_last_user_topics,
    :thredded_last_user_private_topics,
    :thredded_user_messageboard_preferences,
    :thredded_notifications_for_followed_topics,
    :thredded_messageboard_notifications_for_followed_topics,
    :thredded_notifications_for_private_topics,
    :thredded_post_notifications,
    :thredded_private_users,
    :thredded_topic_read_states,
    :thredded_private_topic_read_states,
    :thredded_topic_follows,
    :thredded_user_detail,
    :thredded_user_preference,
    :thredded_private_topics,
    :thredded_post_moderation_records,
    :thredded_post_moderated_records,
    :email,
    :encrypted_password,
    :reset_password_token,
    :reset_password_sent_at,
    :remember_created_at,
    :first_name,
    :last_name,
    :date_of_birth,
    :gender,
    :avatar,
    :is_admin?,
    :admin,
  ].freeze

  # Overwrite this method to customize how users are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(user)
  #   "User ##{user.id}"
  # end
end
