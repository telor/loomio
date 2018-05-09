class DeviceSerializer < ActiveModel::Serializer
  attributes :id, :token, :user_id
end
