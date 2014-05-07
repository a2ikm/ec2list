module Ec2list
  class Command
    attr_reader :options
  
    def initialize(argv = [])
      @options = build_options(argv)
      load_profile
    end

    def run
      instances = fetch_instances
      
      if instances.empty?
        puts "No running instances"
        return
      end

      print_instances(instances)
    end

    private

      def fetch_instances
        AWS::EC2.new.
          instances.
          select { |instance| instance.status == :running }.
          to_a
      end

      def print_instances(instances)
        puts "Name,Private IP,Public IP"

        instances.each do |instance|
          tags = instance.tags.to_h
          puts [
            tags["Name"],
            instance.private_ip_address,
            instance.public_ip_address,
          ].join(",")
        end
      end

      def build_options(argv)
        Slop.parse(argv) do
          banner "Usage: ec2list [options]"

          on :p, :profile, "Profile name", argument: :optional, default: "default"
        end
      end

      def load_profile
        unless profile = AWSConfig[options[:profile]]
          raise RuntimeError, "Can't locate profile '#{options[:profile]}' in ~/.aws/config"
        end

        AWS.config(profile.config_hash)
      end
  end
end
