require 'rails_helper'

describe SheetsController do

  describe 'GET#new' do
    before do
      get :new
    end

    it { expect(assigns(:sheet)).to be_a_new(Sheet) }
    it { should render_template(:new) }

  end

  describe 'POST#create' do
    #Parameters: {"utf8"=>"✓", "authenticity_token"=>"4Ch2ItPdC1uEY4/u3r6nahP+bbgLBjuY4tWsyT7YodbOJpL99CiZFngboHOyCsAOuGcAkv25bcsWmcmYKHDjfw==", "sheet"=>{"file_name"=>#<ActionDispatch::Http::UploadedFile:0xc54ef28 @tempfile=#<Tempfile:/tmp/RackMultipart20150510-15216-d7xrf6.ods>, @original_filename="simple.ods", @content_type="application/vnd.oasis.opendocument.spreadsheet", @headers="Content-Disposition: form-data; name=\"sheet[file_name]\"; filename=\"simple.ods\"\r\nContent-Type: application/vnd.oasis.opendocument.spreadsheet\r\n">}, "commit"=>"Import"}

    before do
      allow(controller).to receive(:import_contacts) { Contact.create name: 'foo' }
      #post :create, 
        #sheet: {file_name: 'simple.ods'}
    end

    describe 'creates new sheet' do
      context 'with valid data' do
        it 'adds sheet record ' do
          expect do           
            post :create, 
              sheet: {file_name: 'simple.ods'}
          end
          .to change(Sheet, :count).by(1)

        end

        it 'save file to storage'

        it 'run import' do
          expect(controller).to receive(:import_contacts)
          post :create, sheet: {file_name: 'simple.ods'}

        end

        it 'imports contacts' do
          expect{ post :create,
            sheet: {file_name: 'simple.ods'}
          }.to change(Contact, :count).by(1)

        end

        xit{ should redirect_to sheet_path(Sheet.last) }

      end

      context 'with invalid data'
    end

    #'import an recipient contacts'
  end

end

