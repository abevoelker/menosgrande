require 'uri'

class HttpUriFormatValidator < ActiveModel::EachValidator
  def validate_each(object, attribute, value)
    unless valid_http_uri?(value)
      object.errors[attribute] << (options[:message] || "is not a valid HTTP/HTTPS URI")
    end
  end

  private
    def valid_http_uri?(uri)
      begin
        u = URI.parse(uri)
	return false if u.scheme !~ /^http[s]?$/
      rescue URI::InvalidURIError
        return false
      end
      return true
    end    
end
