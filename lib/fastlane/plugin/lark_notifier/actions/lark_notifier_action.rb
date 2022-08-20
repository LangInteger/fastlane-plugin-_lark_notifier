require 'fastlane/action'
require 'net/https'
require_relative '../helper/lark_notifier_helper'

module Fastlane
  module Actions
    class LarkNotifierAction < Action
      def self.run(params)
        
        params[:message] = params[:message].to_s || ''

        uri = URI(params[:web_hook_url])
        request = Net::HTTP::Post.new(uri, 'Content-Type' => 'application/json')
        request.body = {msg_type: 'text', content: {title: "lal", text: params[:message]}}.to_json
        Net::HTTP.start(uri.hostname, uri.port) do |http|
          http.request(request)          
        end
      end

      def self.description
        "Send notification via Lark webhook in a ease."
      end

      def self.authors
        ["Presence.LangInteger"]
      end

      def self.return_value
        # If your method provides a return value, you can describe here what it does
      end

      def self.details
        # Optional:
        "Send notification via Lark webhook in a ease."
      end

      def self.available_options
        [
          # FastlaneCore::ConfigItem.new(key: :your_option,
          #                         env_name: "LARK_NOTIFIER_YOUR_OPTION",
          #                      description: "A description of your option",
          #                         optional: false,
          #                             type: String)
        ]
      end

      def self.is_supported?(platform)
        # Adjust this if your plugin only works for a particular platform (iOS vs. Android, for example)
        # See: https://docs.fastlane.tools/advanced/#control-configuration-by-lane-and-by-platform
        #
        # [:ios, :mac, :android].include?(platform)
        true
      end
    end
  end
end
