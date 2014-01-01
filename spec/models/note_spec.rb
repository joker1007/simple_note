require 'spec_helper'

describe Note do
  describe "#render_markdown" do
    let(:note) { FactoryGirl.create(:note) }

    subject { note.render_markdown }

    it { should match(/<h1>/) }
    it { should match(/<li>/) }
  end
end
