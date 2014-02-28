require 'spec_helper'

describe "Notes" do
  describe "GET /notes" do
    let!(:notes) { FactoryGirl.create_list(:note, 2) }

    it "should return success" do
      get notes_path, format: :json
      expect(response.status).to be(200)
    end

    it "should return notes json" do
      get notes_path, format: :json
      res = ActiveSupport::JSON.decode(response.body)
      expect(res).to have(2).items
      expect(res.first['title']).to eq(notes.first.title)
      expect(res.first['raw_body']).to eq(notes.first.raw_body)
    end
  end

  describe "GET /notes/:id" do
    let!(:note) { FactoryGirl.create(:note) }

    it "should return success" do
      get note_path(note), format: :json
      expect(response.status).to be(200)
    end

    it "should return note json" do
      get note_path(note), format: :json
      res = ActiveSupport::JSON.decode(response.body)
      expect(res).to be_a(Hash)
      expect(res['title']).to eq(note.title)
      expect(res['raw_body']).to eq(note.raw_body)
    end
  end

  describe "GET /notes/:id/rendering" do
    let!(:note) { FactoryGirl.create(:note) }

    it "should return success" do
      post rendering_notes_path, format: :json, raw_body: note.raw_body
      expect(response.status).to be(200)
    end

    it "should return note json" do
      post rendering_notes_path, format: :json, raw_body: note.raw_body
      res = ActiveSupport::JSON.decode(response.body)
      expect(res).to be_a(Hash)
      expect(res['body']).to eq(note.render_markdown)
    end
  end


  describe "POST /notes" do
    let!(:note_params) { {title: 'Title', raw_body: 'RawBody'} }

    it "should return success" do
      post notes_path, format: :json, note: note_params
      expect(response).to be_success
    end

    it "should return note json" do
      post notes_path, format: :json, note: note_params
      res = ActiveSupport::JSON.decode(response.body)
      expect(res).to be_a(Hash)
      expect(res['title']).to eq('Title')
      expect(res['raw_body']).to eq('RawBody')
    end

    context "parameter is invalid" do
      pending "not validation"
    end
  end

  describe "PUT /notes/:id" do
    let!(:note) { FactoryGirl.create(:note, title: 't', raw_body: 'r') }
    let!(:note_params) { {title: 'Title', raw_body: 'RawBody'} }

    it "should return success" do
      put note_path(note), format: :json, note: note_params
      expect(response).to be_success
    end

    it "should return nothing" do
      put note_path(note), format: :json, note: note_params
      expect(response.body).to be_blank
    end

    context "parameter is invalid" do
      pending "not validation"
    end
  end
end
