module Middleman
  module RemoveIndent
    class Extension < ::Middleman::Extension
      option :exts, %w(.html .css), 'List of target file extensions'
      option :remove_blank_line, false, 'Remove Brank Line from target files'

      def initialize(app, options_hash = {}, &block)
        super

        exts = (options.exts.is_a?(String)) ? Array(options.exts) : options.exts
        build_dir = File.join(app.root, app.build_dir)
        extension = self

        app.after_build do
          targets = extension.target_files(build_dir, exts)
          extension.update_file!(targets)
        end
      end

      def target_files(dir, exts)
        paths = []
        exts.each do |ext|
          paths.concat(Dir.glob(dir + "/**/*#{ext}"))
        end
        paths
      end

      def update_file!(target_files)
        target_files.each do |file|
          open(file) do |f|
            data = []
            f.each_line do |line|
              line = remove_indent(line)
              data.push(line)
            end
            File.write(file, data.join)
          end
        end
      end

      def remove_indent(line)
        line.gsub!(/^(\s|\t)+/, '')
        (line.empty? && !options.remove_blank_line) ? "\n" : line
      end
    end
  end
end
