class UserSerializer < ActiveModel::Serializer

  attributes :id, :email, :name

end

# .to_json not .as_json validates in rails console.
