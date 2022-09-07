class ActivitySerializer < ActiveModel::Serializer
  attributes :id, :name, :difficulty, :number_of_signups

  def number_of_signups
    object.signups.count
  end
end
