Puppet::Type.newtype(:testtype) do
    @doc = "my template type"

    ensurable

    newparam(:name) do
        desc "my type's display name, that is all"
        isnamevar
    end

    newparam(:initialized, options = {:boolean => true}) do
        desc "type has been initialized"
        # theme ... this is live and can be manipulated within the type
    end

end
