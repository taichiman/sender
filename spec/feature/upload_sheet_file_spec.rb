require 'rails_helper'

feature 'User can upload a spreadsheet file', %q{
  I as User
  When fill form with a file name
  And submit form
  Then file will be uploaded
} do

  scenario 'user fills form with a sheet file' do
    visit new_sheet_path

    expect(page).to have_content('Import a sheet file')

    attach_file 'File', 'spec/staff/sheets/simple.ods'
    click_on 'Import'
    
    expect(page).to have_content('name1')
  end
end
