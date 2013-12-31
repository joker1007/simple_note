require 'spec_helper'

describe "notes/edit" do
  before(:each) do
    @note = assign(:note, stub_model(Note,
      :title => "MyString",
      :raw_body => "MyText",
      :body => "MyText"
    ))
  end

  it "renders the edit note form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", note_path(@note), "post" do
      assert_select "input#note_title[name=?]", "note[title]"
      assert_select "textarea#note_raw_body[name=?]", "note[raw_body]"
      assert_select "textarea#note_body[name=?]", "note[body]"
    end
  end
end
