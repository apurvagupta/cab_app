# -*- encoding : utf-8 -*-
module NavigationHelpers
  def path_to(page_name)
    case page_name

      when /the home\s?page/
        '/'
      else
        begin
          if page_name.include? 'the edit'
            page_name =~ /the edit (.*) page/
            if $1 == 'admins'
              id = Admin.pluck(:id).first.to_s
            elsif $1 == 'vendors'
              Vendor.create!(name:'homer',contact_no: '1234567890',status:false)
              id = Vendor.pluck(:id).first.to_s
            end
            url = '/' + $1 + '/' + id + '/edit'
            return url
          else
            page_name =~ /the (.*) page/
            path_components = $1.split(/\s+/)
            self.send(path_components.push('path').join('_').to_sym)
          end
        rescue Object => e
        raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
                  "Now, go and add a mapping in #{__FILE__}"
        end
    end
  end
end

World(NavigationHelpers)




