# encoding: utf-8

module Filmtipset
  class Api
    class Genre
      class << self
        def valid_id?(id)
          TABLE.has_key?(id.to_s)
        end

        def verify_id(id)
          unless valid_id?(id)
            raise InvalidId, "The genre id '#{id}' is not valid!"
          end
        end
      end

      TABLE = {
        "0"  => "Generella tips",
        "1"  => "Drama",
        "2"  => "Kortfilm",
        "3"  => "Komedi",
        "4"  => "Dokumentär",
        "5"  => "Animerad",
        "6"  => "Vuxenfilm",
        "7"  => "Familjefilm",
        "8"  => "Action",
        "9"  => "Kriminalare",
        "10" => "Romantik",
        "11" => "Thriller",
        "12" => "Musikal",
        "13" => "Äventyr",
        "14" => "Western",
        "15" => "Skräck",
        "16" => "Science Fiction",
        "17" => "Fantasy",
        "18" => "Mysterium",
        "19" => "Krig",
        "20" => "Film-Noir",
        "21" => "Scenshow",
        "22" => "Anime",
        "23" => "Mini-serie",
        "24" => "Stumfilm",
        "25" => "Amatörfilm",
        "38" => "Experimentfilm",
        "39" => "Roadmovie",
        "40" => "Biografi"
      }

      class InvalidId < StandardError; end
    end
  end
end
