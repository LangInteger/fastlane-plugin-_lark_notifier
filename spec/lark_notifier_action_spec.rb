describe Fastlane::Actions::LarkNotifierAction do
  describe '#run' do
    it 'prints a message' do
      expect(Fastlane::UI).to receive(:message).with("The lark_notifier plugin is working!")

      Fastlane::Actions::LarkNotifierAction.run(nil)
    end
  end
end
