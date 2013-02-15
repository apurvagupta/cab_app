require 'open-uri'
class Requester

  attr_reader :requester_name , :requester_contact_no

  def gab_link
    api =  "https://my.thoughtworks.com/api/core/v2/users/username/" + @userid                      rescue nil
    @source_code = open(api, :http_basic_authentication => ["ppathak", "Maa_papa143"]).read        rescue nil
  end


  def extract (arg)
    start_index =  @source_code.index(arg) + arg.length + 5                                      rescue nil
    extracted_source_code = @source_code[start_index , start_index+50]                           rescue nil
    end_index = extracted_source_code.index('"')                                                 rescue nil
    extracted_source_code = extracted_source_code[0 , end_index]                                 rescue nil
    return extracted_source_code
  end


  def fetch_requester_info(userid)
    @userid = userid
    gab_link
    @requester_name = extract("name")
    if !requester_name
      @requester_name = @userid
    end
    @requester_contact_no = extract("mobile")
  end


end

