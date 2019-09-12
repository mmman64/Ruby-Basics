=begin
    The goal here is to take a hash like this:

    pigeon_data = {
        :color => {
            :purple => ["Theo", "Peter Jr.", "Lucky"],
            :grey => ["Theo", "Peter Jr.", "Ms. K"],
            :white => ["Queenie", "Andrew", "Ms. K", "Alex"],
            :brown => ["Queenie", "Alex"]
        },
        :gender => {
            :male => ["Alex", "Theo", "Peter Jr.", "Andrew", "Lucky"],
            :female => ["Queenie", "Ms. K"]
        },
        :lives => {
            "Subway" => ["Theo", "Queenie"],
            "Central Park" => ["Alex", "Ms. K", "Lucky"],
            "Library" => ["Peter Jr."],
            "City Hall" => ["Andrew"]
        }
    }

    and arrange it so that the hash is structured by pidgeon name, like so:

    pigeon_list = {
        "Theo" => {
            :color => ["purple", "grey"],
            :gender => ["male"],
            :lives => ["Subway"]
        },
        "Peter Jr." => {
            :color => ["purple", "grey"],
            :gender => ["male"],
            :lives => ["Library"]
        },
        "Lucky" => {
            :color => ["purple"],
            :gender => ["male"],
            :lives => ["Central Park"]
        },
        "Ms. K" => {
            :color => ["grey", "white"],
            :gender => ["female"],
            :lives => ["Central Park"]
        },
        "Queenie" => {
            :color => ["white", "brown"],
            :gender => ["female"],
            :lives => ["Subway"]
        },
        "Andrew" => {
            :color => ["white"],
            :gender => ["male"],
            :lives => ["City Hall"]
        },
        "Alex" => {
            :color => ["white", "brown"],
            :gender => ["male"],
            :lives => ["Central Park"]
        }
    }
=end

def nyc_pigeon_organizer(data)
  organised_pigeons = {}
  data.each do |pigeon_property, pigeon_property_option|
    pigeon_property_option.each do |option_name, option_info|
      option_info.each do |name|
        if organised_pigeons.key?(name)
          if organised_pigeons[name].key?(pigeon_property)
            organised_pigeons[name][pigeon_property] << option_name.to_s
          else
            organised_pigeons[name][pigeon_property] = [option_name.to_s]
          end
        else
          organised_pigeons[name] = {pigeon_property => [option_name.to_s]}
        end
      end
    end
  end
  organised_pigeons
end
