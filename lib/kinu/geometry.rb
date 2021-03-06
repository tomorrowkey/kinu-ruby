module Kinu
  class Geometry
    AVAILABLE_TYPES = {
      width:    :w,
      height:   :h,
      quality:  :q,
      crop:     :c,
      original: :o,
      middle:   :m,
    }.freeze

    def initialize(options)
      @options = options
    end

    def empty?
      @options.empty?
    end

    def valid?
      !(@options[:width].nil? && @options[:height].nil?)
    end

    def to_s
      geo = []
      AVAILABLE_TYPES.each do |full_name, short_name|
        next if @options[full_name].nil?
        geo << "#{short_name}=#{@options[full_name]}"
      end
      geo.join(',')
    end
  end
end
