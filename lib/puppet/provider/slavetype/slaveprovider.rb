Puppet::Type.type(:slavetype).provide(:slaveprovider) do
  desc "Provides my slavetype"

  puts "*** Global area slavetype"

  # global hashes of hashes - indexed by slavetype name
  # slave attributes
  $slaveattr = {}
  # slave real property values
  $slavestatus = {}

  def create
      puts "*** Creating slavetype: #{@resource[:name]}"
  end

  def destroy
      puts "*** Destroying slavetype: #{@resource[:name]}"
  end

  def exists?
      puts "*** exists? slavetype: #{@resource[:name]}"
      # Yes, @resource and resource are the same thing
      # puts "#{resource[:name]}"
      # set slave resource attributes according to master values
      # propagate non-nil values only
      @resource[:boolpropnotset] = $masterattr[@resource[:master]]['boolpropnotset'] if !$masterattr[@resource[:master]]['boolpropnotset'].nil?
      @resource[:boolproptrue] = $masterattr[@resource[:master]]['boolproptrue'] if !$masterattr[@resource[:master]]['boolproptrue'].nil?
      @resource[:boolpropfalse] = $masterattr[@resource[:master]]['boolpropfalse'] if !$masterattr[@resource[:master]]['boolpropfalse'].nil?
      @resource[:stringpropnotset] = $masterattr[@resource[:master]]['stringpropnotset'] if !$masterattr[@resource[:master]]['stringpropnotset'].nil?
      @resource[:stringpropset] = $masterattr[@resource[:master]]['stringpropset'] if !$masterattr[@resource[:master]]['stringpropset'].nil?
      @resource[:boolproptruemunge] = $masterattr[@resource[:master]]['boolproptruemunge'] if !$masterattr[@resource[:master]]['boolproptruemunge'].nil?
      @resource[:boolpropfalsemunge] = $masterattr[@resource[:master]]['boolpropfalsemunge'] if !$masterattr[@resource[:master]]['boolpropfalsemunge'].nil?
      # cache resource attributes
      $slaveattr[@resource[:name]] = {}
      $slaveattr[@resource[:name]]['name'] = @resource[:name]
      $slaveattr[@resource[:name]]['master'] = @resource[:master]
      $slaveattr[@resource[:name]]['boolpropnotset'] = @resource[:boolpropnotset]
      $slaveattr[@resource[:name]]['boolproptrue'] = @resource[:boolproptrue]
      $slaveattr[@resource[:name]]['boolpropfalse'] = @resource[:boolpropfalse]
      $slaveattr[@resource[:name]]['stringpropnotset'] = @resource[:stringpropnotset]
      $slaveattr[@resource[:name]]['stringpropset'] = @resource[:stringpropset]
      $slaveattr[@resource[:name]]['boolproptruemunge'] = @resource[:boolproptruemunge]
      $slaveattr[@resource[:name]]['boolpropfalsemunge'] = @resource[:boolpropfalsemunge]
      # cache real property state
      $slavestatus[@resource[:name]] = {}
      $slavestatus[@resource[:name]]['boolpropnotset'] = boolpropnotset
      $slavestatus[@resource[:name]]['boolproptrue'] = boolproptrue
      $slavestatus[@resource[:name]]['boolpropfalse'] = boolpropfalse
      $slavestatus[@resource[:name]]['stringpropnotset'] = stringpropnotset
      $slavestatus[@resource[:name]]['stringpropset'] = stringpropset
      $slavestatus[@resource[:name]]['boolproptruemunge'] = boolproptruemunge
      $slavestatus[@resource[:name]]['boolpropfalsemunge'] = boolpropfalsemunge
      puts "*** resource: #{@resource}"
      puts "*** slaveattr: #{$slaveattr[@resource[:name]]}"
      puts "*** slavestatus: #{$slavestatus[@resource[:name]]}"
      # nothing - no self.prefetch - puts "*** property_cache: #{@property_cache}"
      true
  end

  def boolpropnotset
    puts "* in slave boolpropnotset"
    nil
  end
  def boolpropnotset=(value)
    puts "* in slave boolpropnotset=#{value}"
  end

  def boolproptrue
    puts '* in slave boolproptrue'
    true
  end

  def boolpropfalse
    puts '* in slave boolpropfalse'
    false
  end
  def boolpropfalse=(value)
    puts "* in slave boolpropfalse=#{value}"
  end

  def stringpropset
    puts '* in slave stringpropset'
    'my stringpropset'
  end
  def stringpropset=(value)
    puts "* in slave stringpropset=#{value}"
  end

  def stringpropnotset
    puts '* in slave stringpropnotset'
    'my stringpropnotset'
  end
  def stringpropnotset=(value)
    puts "* in slave stringpropnotset=#{value}"
  end

  def boolproptruemunge
    puts '* in slave boolproptruemunge'
    true
  end

  def boolpropfalsemunge
    puts '* in slave boolpropfalsemunge'
    false
  end
  def boolpropfalsemunge=(value)
    puts "* in slave boolpropfalsemunge=#{value}"
  end

end
