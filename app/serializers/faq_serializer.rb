class FaqSerializer < ActiveModel::Serializer
  attributes :id, :question, :answer
end
