Puppet::Type.type(:testtype).provide(:testprovider) do
  desc "Provides my type"

  # puts "Global area testtype"

  def self.instances
    testtypes = Dir['*.tpp']
    testtypes.each.collect do |instance|
      new( :name   => instance.sub('.tpp',''),
           :ensure => :present,
           :initialized => true
         )
    end
  end

  testtypes = ['Package 1', 'Package 2']
  testtypes.each.collect do |instance|
    new( :name    => instance,
         :ensure  => :present,
         :version => '1.2.3',
         :provider => 'te_agent_bin'
       )
  end

  def create
      puts "Creating testtype: #{@resource[:name]}"
      File.open("#{@resource[:name]}.tpp", "w") { |f| f.puts "" } # Create an empty file
      @resource[:initialized] = true
      puts ":initialized: #{@resource[:initialized] ? "true" : "false"}"
  end

  def destroy
      puts "Destroying testtype: #{@resource[:name]}"
      File.delete("#{@resource[:name]}.tpp")
      @resource[:initialized] = false
      puts ":initialized: #{@resource[:initialized] ? "true" : "false"}"
  end

  def exists?
      # puts "exists? testtype: #{@resource[:name]}"
      @resource[:initialized] = File.exists?("#{@resource[:name]}.tpp")
      # puts ":initialized: #{@resource[:initialized] ? "true" : "false"}"
      @resource[:initialized]
  end
end
