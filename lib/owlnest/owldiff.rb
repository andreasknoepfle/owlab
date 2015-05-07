module Owlnest
  class Owldiff

    SUPPORTED_TYPES = [".ttl",".owl",".rdf"]

    def self.supported_file? filepath
      type = File.extname(filepath).downcase
      SUPPORTED_TYPES.include? type
    end

  end
end
