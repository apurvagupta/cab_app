require 'open-uri'
class Requester
  attr_accessor :requester_name , :requester_contact_no

  def gab_link(user_id)
    api =  "https://my.thoughtworks.com/api/core/v2/users/username/" + user_id                      rescue nil
    @source_code = open(api, :http_basic_authentication => ["ppathak", "Maa_papa143"]).read         rescue nil
  end


  def extract (field)
    start_index =  @source_code.index(field) + field.length + 5                                     rescue nil
    extracted_source_code = @source_code[start_index , start_index+50]                              rescue nil
    end_index = extracted_source_code.index('"')                                                    rescue nil
    extracted_source_code = extracted_source_code[0 , end_index]                                    rescue nil
    return extracted_source_code
  end


  def fetch_requester_info(user_id)
    gab_link(user_id)
    @req = Requester.new
    @req.requester_name = extract("name") || user_id
    @req.requester_contact_no = extract("mobile")
    return @req
  end


end

