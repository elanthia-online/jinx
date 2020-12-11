module Header
  HEADER_PATTERN = /^=begin\r?\n?(.+?)^=end/m

  def self.compile(file, out_dir)
    basename = File.basename(file)
    contents = File.read(file)
    return :noop unless contents =~ HEADER_PATTERN
    header = $1.strip
    header_file = "%s.header" % basename.split(".").first
    out_file = File.join(out_dir, header_file)
    File.write(out_file, header)
    header_file
  end
end