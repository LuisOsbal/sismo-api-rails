module Filter
  extend ActiveSupport::Concern
  def filter(obj)
    filtering_params.each do |key, value|
      obj = obj.public_send(key, value) if value.present?
    end
    obj
  end
end
