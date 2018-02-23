Puppet::Type.newtype(:mastertype) do
    @doc = "my template type"

    ensurable

    newparam(:name) do
        desc "my type's display name, that is all"
        isnamevar
    end

    newproperty(:boolpropnotset, options = {:boolean => true}) do
    end

    newproperty(:boolproptrue, options = {:boolean => true}) do
      defaultto do
        puts '- master boolproptrue default to: true'
        true
      end
    end

    newproperty(:boolpropfalse, options = {:boolean => true}) do
      defaultto do
        puts '- master boolpropfalse default to: false'
        false
      end
    end

    newproperty(:stringpropnotset, options = {:boolean => true}) do
    end

    newproperty(:stringpropset, options = {:boolean => true}) do
      defaultto do
        puts '- master stringpropset default to: my string here'
        'my string here'
      end
    end

    # This is what you must do if you want boolean behavior
    # But this still doesn't work right, the undef values never make it
    # to our munge, and false values make it to our munge but
    # do not trigger property update
    newproperty(:boolproptruemunge, options = {:boolean => true}) do
      defaultto do
        puts '- master boolproptruemunge default to: true'
        true
      end
      munge do |value|
        true_values =  [true, 'true', :true, :yes, 'yes']
        false_values = [false, 'false', :false, :no, 'no']
        nil_values = [:undef, nil, :absent]
        if true_values.include? value
          puts '+ master boolproptruemunge munge to true'
          true
        elsif false_values.include? value
          puts '+ master boolproptruemunge munge to false'
          false
        elsif nil_values.include? value
          puts '+ master boolproptruemunge munge to nil'
          nil
        else
          raise "Error Invalid value for boolproptruemunge boolean attribute: #{value}"
        end
      end
    end

    # Just to prove our munge technique is good in the affirmative
    # only true values trigger property evaluation and updates
    # BOTTOM LINE:
    # Puppet provider boolean properties have two states, true and undef/nil
    newproperty(:boolpropfalsemunge, options = {:boolean => true}) do
      defaultto do
        puts '- master boolpropfalsemunge default to: false'
        false
      end
      munge do |value|
        true_values =  [true, 'true', :true, :yes, 'yes']
        false_values = [false, 'false', :false, :no, 'no']
        nil_values = [:undef, nil, :absent]
        if true_values.include? value
          puts '+ master boolpropfalsemunge munge to true'
          true
        elsif false_values.include? value
          puts '+ master boolpropfalsemunge munge to false'
          false
        elsif nil_values.include? value
          puts '+ master boolpropfalsemunge munge to nil'
          nil
        else
          raise "Error Invalid value for boolpropfalsemunge boolean attribute: #{value}"
        end
      end
    end

end
