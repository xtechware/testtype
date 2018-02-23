Puppet::Type.newtype(:slavetype) do
    @doc = "my template type"

    ensurable

    newparam(:name) do
        desc "my type's display name, that is all"
        isnamevar
    end

    newparam(:master) do
      desc "my master type resource name"
    end

    newproperty(:boolpropnotset, options = {:boolean => true}) do
    end

    newproperty(:boolproptrue, options = {:boolean => true}) do
    end

    newproperty(:boolpropfalse, options = {:boolean => true}) do
    end

    newproperty(:stringpropnotset, options = {:boolean => true}) do
    end

    newproperty(:stringpropset, options = {:boolean => true}) do
    end

    newproperty(:boolproptruemunge, options = {:boolean => true}) do
    end

    newproperty(:boolpropfalsemunge, options = {:boolean => true}) do
    end
end
