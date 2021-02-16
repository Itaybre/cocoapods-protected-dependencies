require 'singleton'
require 'yaml'

module CocoapodsProtectedPrivate
    class Configuration
        include Singleton
        attr_accessor :config

        def config
            @config ||= []
        end

        def initialize()
            load_configuration()
        end

        def load_configuration
            unless File.file?('protected-specs.yml')
                Pod::UI.puts "No 'protected-specs.yml' file, make sure you have created one".red
                return
            end

            @config = YAML.load(File.read('protected-specs.yml'))
        end

        def filter_dependency(pod, specifications)
            filtered = specifications.select { |spec| spec_is_valid(pod, spec) }

            Pod::UI.puts "Dependency #{pod} is not allowed".red if filtered.empty?

            return filtered
        end

        def spec_is_valid(pod, spec)
            # Allow external dependencies (using :git or :path), which create a local podspec
            return true if !spec.defined_in_file.nil? && spec.defined_in_file.to_s.include?('/Pods/Local Podspecs')

            config.each { |repo|
                next unless repo['source'] == spec.spec_source.url
                
                return true if !repo['lib'].nil? && repo['lib'].include?(pod)
                return true if !repo['regex'].nil? && pod.match(Regexp.new repo['regex'])
            }
            return false
        end
    end
end