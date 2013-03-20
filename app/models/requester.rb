require 'open-uri'

class Requester
  attr_accessor :requester_name, :requester_contact_no

  def self.gab_link(user_id)
    api = 'https://my.thoughtworks.com/api/core/v2/users/username/' + user_id rescue nil
    @source_code = open(api, http_basic_authentication: ['boogaBooga', 'boogaBooga']).read rescue nil
  end


  def self.extract (field)
    unless @source_code.nil?
      start_index = @source_code.index(field) + field.length + 5
      extracted_source_code = @source_code[start_index, start_index+50]
      end_index = extracted_source_code.index('"')
      extracted_source_code = extracted_source_code[0, end_index]
      extracted_source_code.strip
    end

  end

  def self.fetch_requester_info(user_id)
    self.gab_link(user_id)
    req                      = Requester.new
    req.requester_name       = self.extract('name') || user_id
    req.requester_contact_no = self.extract('mobile')
    req
  end

end

