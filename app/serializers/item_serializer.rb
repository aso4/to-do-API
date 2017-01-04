class ItemSerializer < ActiveModel::Serializer

  attributes :id, :list_id, :desc, :completed

end
