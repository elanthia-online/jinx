  module Log  
    def self.out(msg, label: :debug)
      if msg.is_a?(Exception)
        msg = %{
          #{msg.message}
          #{msg.backtrace.join("\n")}
        }
      end

      msg = _view(msg, label)
      $stdout.write(msg + "\n")
    end

    def self._view(msg, label)
      label = [label].flatten.compact.join(".")
      safe = msg.inspect
      safe = safe.gsub("<", "(").gsub(">", ")") if safe.include?("<") and safe.include?(">")
      "[#{label}] #{safe}"
    end
  end