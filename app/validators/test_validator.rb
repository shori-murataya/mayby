class TestValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    # if ! record.content.embeds.blobs.first.present?
    #   record.errors[:attribute] << "どんな感じ？" 
    # end
  end
end