class SheetsController < ApplicationController
  def new
    @sheet = Sheet.new

  end

  def create
    @sheet = Sheet.new(sheet_params)

    if @sheet.save
      import_contacts
      redirect_to root_path
    end

  end

  private

  def sheet_params
    params.require(:sheet).permit(:file_name)

  end

  def import_contacts; end

end

