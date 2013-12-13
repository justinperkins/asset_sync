module AssetSync
  class MultiMime

    def self.lookup(ext)
      if ext.to_sym == :jgz
        return 'text/javascript'
      elsif ext.to_sym == :cgz
        return 'text/css'
      end

      if defined?(Mime::Type)
        Mime::Type.lookup_by_extension(ext)
      elsif defined?(Rack::Mime)
        ext_with_dot = ".#{ext}"
        Rack::Mime.mime_type(ext_with_dot)
      else
        MIME::Types.type_for(ext).first
      end

    end

  end
end