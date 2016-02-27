# == Schema Information
#
# Table name: comments
#
#  id               :integer          not null, primary key
#  body             :text
#  user_id          :integer          not null
#  post_id          :integer          not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  markdown         :text
#  aasm_state       :string
#  body_preview     :text
#  markdown_preview :text
#

class CommentSerializer < ActiveModel::Serializer
  attributes :id, :state, :body, :body_preview, :markdown, :markdown_preview,
             :edited_at, :created_at

  belongs_to :post
  belongs_to :user
end
