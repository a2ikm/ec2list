module Ec2list
  class Command
    attr_reader :options
  
    def initialize(argv = [])
      @options = build_options(argv)
      load_profile
    end

    def run
      AWS.memoize do
        fetch_instances.each do |instance|
          print_instance(instance)
        end
      end
    end

    private

      def fetch_instances
        AWS::EC2.new.
          instances.
          select { |instance| instance.status == :running }
      end

      def print_instance(instance)
        tags = instance.tags
        puts [
          tags[:Name],
          instance.private_ip_address,
          instance.public_ip_address,
        ].join("\t")
      end

      def build_options(argv)
        Slop.parse(argv) do
          banner "Usage: ec2list [options]"

          on :p, :profile, "Profile name", argument: :optional, default: "default"
        end
      end

      def load_profile
        unless profile = AWSConfig[options[:profile]]
          abort "Can't locate profile '#{options[:profile]}' in ~/.aws/config"
        end

        AWS.config(profile.config_hash)
      end
  end
end
