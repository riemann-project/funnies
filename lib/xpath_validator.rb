# encoding: utf-8
# Custom XPath Validator
class XpathValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    begin
      if value.nil? || Nokogiri.HTML('<html><body></body></html>').xpath(value).nil?
        record.errors[attribute] << '必须是有效的 XPath 扩展路径！'
      end
    rescue Nokogiri::XML::XPath::SyntaxError
      record.errors[attribute] << '必须是有效的 XPath 扩展路径！'
    end
  end
end

