require 'cocoapods-protected-private/config'

module Pod
    class Resolver
        attr_accessor :cached_specifications

        def cached_specifications
            @cached_specifications ||= {}
        end

        alias original_search_for search_for
        ## Filter specifications
        def search_for(dependency)
            specifications = original_search_for(dependency)
            
            if cached_specifications[dependency.name].nil?
                cached_specifications[dependency.name] = CocoapodsProtectedPrivate::Configuration.instance.filter_dependency(dependency.root_name, specifications)
            end
            cached_specifications[dependency.name]
        end
    end
end