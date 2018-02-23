Puppet::Type.type(:mastertype).provide(:masterprovider) do
  desc "Provides my mastertype"

  puts "*** Global area mastertype"

  # this is outside of resource - this does not work
  # puts "mastertype: #{@resource[:name]}"
  # global hashes of hashes - indexed by mastertype name
  # master attributes
  $masterattr = {}
  # master real property values
  $masterstatus = {}

  def create
      puts "*** Creating mastertype: #{@resource[:name]}"
  end

  def destroy
      puts "*** Destroying mastertype: #{@resource[:name]}"
  end

  def exists?
      puts "*** exists? mastertype: #{@resource[:name]}"
      # Yes, @resource and resource are the same thing
      # puts "#{resource[:name]}"
      # cache resource attributes
      $masterattr[@resource[:name]] = {}
      $masterattr[@resource[:name]]['name'] = @resource[:name]
      $masterattr[@resource[:name]]['boolpropnotset'] = @resource[:boolpropnotset]
      $masterattr[@resource[:name]]['boolproptrue'] = @resource[:boolproptrue]
      $masterattr[@resource[:name]]['boolpropfalse'] = @resource[:boolpropfalse]
      $masterattr[@resource[:name]]['stringpropnotset'] = @resource[:stringpropnotset]
      $masterattr[@resource[:name]]['stringpropset'] = @resource[:stringpropset]
      $masterattr[@resource[:name]]['boolproptruemunge'] = @resource[:boolproptruemunge]
      $masterattr[@resource[:name]]['boolpropfalsemunge'] = @resource[:boolpropfalsemunge]
      # cache real property state
      $masterstatus[@resource[:name]] = {}
      $masterstatus[@resource[:name]]['boolpropnotset'] = boolpropnotset
      $masterstatus[@resource[:name]]['boolproptrue'] = boolproptrue
      $masterstatus[@resource[:name]]['boolpropfalse'] = boolpropfalse
      $masterstatus[@resource[:name]]['stringpropnotset'] = stringpropnotset
      $masterstatus[@resource[:name]]['stringpropset'] = stringpropset
      $masterstatus[@resource[:name]]['boolproptruemunge'] = boolproptruemunge
      $masterstatus[@resource[:name]]['boolpropfalsemunge'] = boolpropfalsemunge
      puts "*** resource: #{@resource}"
      puts "*** masterattr: #{$masterattr[@resource[:name]]}"
      puts "*** masterstatus: #{$masterstatus[@resource[:name]]}"
      # nothing - no self.prefetch - puts "*** property_cache: #{@property_cache}"
      true
  end

  def boolpropnotset
    puts "* in master boolpropnotset"
    nil
  end
  def boolpropnotset=(value)
    puts "* in master boolpropnotset=#{value}"
  end

  def boolproptrue
    puts '* in master boolproptrue'
    true
  end

  def boolpropfalse
    puts '* in master boolpropfalse'
    false
  end
  def boolpropfalse=(value)
    puts "* in master boolpropfalse=#{value}"
  end

  def stringpropset
    puts '* in master stringpropset'
    'my stringpropset'
  end
  def stringpropset=(value)
    puts "* in master stringpropset=#{value}"
  end

  def stringpropnotset
    puts '* in master stringpropnotset'
    'my stringpropnotset'
  end
  def stringpropnotset=(value)
    puts "* in master stringpropnotset=#{value}"
  end

  def boolproptruemunge
    puts '* in master boolproptruemunge'
    true
  end

  def boolpropfalsemunge
    puts '* in master boolpropfalsemunge'
    false
  end
  def boolpropfalsemunge=(value)
    puts "* in master boolpropfalsemunge=#{value}"
  end

end
