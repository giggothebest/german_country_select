# encoding: utf-8
require "german_country_select/version"

# module GermanCountrySelect
#   # Your code goes here...
# end

# CountrySelect
module ActionView
  module Helpers
    module FormOptionsHelper
      # Return select and option tags for the given object and method, using country_options_for_select to generate the list of option tags.
      def country_select(object, method, priority_countries = nil, options = {}, html_options = {})
        InstanceTag.new(object, method, self, options.delete(:object)).to_country_select_tag(priority_countries, options, html_options)
      end
      # Returns a string of option tags for pretty much any country in the world. Supply a country name as +selected+ to
      # have it marked as the selected option tag. You can also supply an array of countries as +priority_countries+, so
      # that they will be listed above the rest of the (long) list.
      #
      # NOTE: Only the option tags are returned, you have to wrap this call in a regular HTML select tag.
      def country_options_for_select(selected = nil, priority_countries = nil)
        country_options = ""

        if priority_countries
          country_options += options_for_select(priority_countries, selected)
          country_options += "<option value=\"\" disabled=\"disabled\">-------------</option>\n"
          # prevents selected from being included twice in the HTML which causes
          # some browsers to select the second selected option (not priority)
          # which makes it harder to select an alternative priority country
          selected=nil if priority_countries.include?(selected)
        end

        return country_options + options_for_select(COUNTRIES, selected)
      end
      # All the countries included in the country_options output.
      COUNTRIES = ["Afghanistan", "Ägypten", "Aland", "Albanien", "Algerien", "Amerikanisch-Samoa", "Amerikanische Jungferninseln", "Andorra", "Angola", "Anguilla", "Antarktis", "Antigua und Barbuda", "Äquatorialguinea", "Argentinien", "Armenien", "Aruba", "Ascension", "Aserbaidschan", "Äthiopien", "Australien", "Bahamas", "Bahrain", "Bangladesch", "Barbados", "Belgien", "Belize", "Benin", "Bermuda", "Bhutan", "Bolivien", "Bosnien und Herzegowina", "Botswana", "Bouvetinsel", "Brasilien", "Brunei", "Bulgarien", "Burkina Faso", "Burundi", "Chile", "China", "Cookinseln", "Costa Rica", "Cote d'Ivoire", "Dänemark", "Deutschland", "Diego Garcia", "Dominica", "Dominikanische Republik", "Dschibuti", "Ecuador", "El Salvador", "Eritrea", "Estland", "Europäische Union", "Falklandinseln", "Färöer", "Fidschi", "Finnland", "Frankreich", "Französisch-Guayana", "Französisch-Polynesien", "Gabun", "Gambia", "Georgien", "Ghana", "Gibraltar", "Grenada", "Griechenland", "Grönland", "Großbritannien", "Guadeloupe", "Guam", "Guatemala", "Guernsey", "Guinea", "Guinea-Bissau", "Guyana", "Haiti", "Heard und McDonaldinseln", "Honduras", "Hongkong", "Indien", "Indonesien", "Irak", "Iran", "Irland", "Island", "Israel", "Italien", "Jamaika", "Japan", "Jemen", "Jersey", "Jordanien", "Kaimaninseln", "Kambodscha", "Kamerun", "Kanada", "Kanarische Inseln", "Kap Verde", "Kasachstan", "Katar", "Kenia", "Kirgisistan", "Kiribati", "Kokosinseln", "Kolumbien", "Komoren", "Kongo", "Kroatien", "Kuba", "Kuwait", "Laos", "Lesotho", "Lettland", "Libanon", "Liberia", "Libyen", "Liechtenstein", "Litauen", "Luxemburg", "Macao", "Madagaskar", "Malawi", "Malaysia", "Malediven", "Mali", "Malta", "Marokko", "Marshallinseln", "Martinique", "Mauretanien", "Mauritius", "Mayotte", "Mazedonien", "Mexiko", "Mikronesien", "Moldawien", "Monaco", "Mongolei", "Montserrat", "Mosambik", "Myanmar", "Namibia", "Nauru", "Nepal", "Neukaledonien", "Neuseeland", "Neutrale, Zone", "Nicaragua", "Niederlande", "Niederländische Antillen", "Niger", "Nigeria", "Niue", "Nordkorea", "Nördliche Marianen", "Norfolkinsel", "Norwegen", "Oman", "Österreich", "Pakistan", "Palästina", "Palau", "Panama", "Papua-Neuguinea", "Paraguay", "Peru", "Philippinen", "Pitcairninseln", "Polen", "Portugal", "Puerto Rico", "Réunion", "Ruanda", "Rumänien", "Russische Föderation", "Salomonen", "Sambia", "Samoa", "San Marino", "São Tomé und Príncipe", "Saudi-Arabien", "Schweden", "Schweiz", "Senegal", "Serbien und Montenegro", "Seychellen", "Sierra Leone", "Simbabwe", "Singapur", "Slowakei", "Slowenien", "Somalia", "Spanien", "Sri Lanka", "St. Helena", "St. Kitts und Nevis", "St., Lucia", "St. Pierre und Miquelon", "St. Vincent/Grenadinen (GB)", "Südafrika, Republik", "Sudan", "Südkorea", "Suriname", "Svalbard und Jan Mayen", "Swasiland", "Syrien", "Tadschikistan", "Taiwan", "Tansania", "Thailand", "Timor-Leste", "Togo", "Tokelau", "Tonga", "Trinidad und Tobago", "Tristan da Cunha", "Tschad", "Tschechische Republik", "Tunesien", "Türkei", "Turkmenistan", "Turks- und  Caicosinseln", "Tuvalu", "Uganda", "Ukraine", "Ungarn", "Uruguay", "Usbekistan", "Vanuatu", "Vatikanstadt", "Venezuela", "Vereinigte Arabische Emirate", "Vereinigte Staaten von Amerika", "Vietnam", "Wallis und Futuna", "Weihnachtsinsel", "Weißrussland", "Westsahara", "Zentralafrikanische Republik", "Zypern"] unless const_defined?("COUNTRIES")    
    end
    
    class InstanceTag
      def to_country_select_tag(priority_countries, options, html_options)
        html_options = html_options.stringify_keys
        add_default_name_and_id(html_options)
        value = value(object)
        content_tag("select",
          add_options(
            country_options_for_select(value, priority_countries),
            options, value
          ), html_options
        )
      end
    end
    
    class FormBuilder
      def country_select(method, priority_countries = nil, options = {}, html_options = {})
        @template.country_select(@object_name, method, priority_countries, options.merge(:object => @object), html_options)
      end
    end
  end
end
