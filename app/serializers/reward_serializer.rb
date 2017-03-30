class RewardSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :image_url, :amount
end
