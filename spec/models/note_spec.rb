require 'spec_helper'

describe Note do
  describe "#render_markdown" do
    let(:note) { FactoryGirl.create(:note) }

    subject { note.render_markdown.tapp }

    it { should match(/<h1>/) }
  end
end
