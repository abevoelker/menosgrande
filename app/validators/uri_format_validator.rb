require 'addressable/uri'

class UriFormatValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    begin
      uri = Addressable::URI.parse(value)

      if uri.scheme.nil?
	record.errors[attribute] << (options[:message] || " does not have a URI scheme, " +
	  "such as 'http://', which is required.")
      elsif %w[javascript data file].include?(uri.scheme)
	record.errors[attribute] << (options[:message] || " includes a blacklisted " +
	  "URI scheme (javascript:, data:, and file: are not allowed).")
      end
    rescue Addressable::URI::InvalidURIError
      record.errors[attribute] << (options[:message] || " is not a valid URI scheme.")
    end
  end
end
