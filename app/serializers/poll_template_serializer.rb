class PollTemplateSerializer < ActiveModel::Serializer
  embed :ids, include: true
  attributes :id, :name, :option_names
end
