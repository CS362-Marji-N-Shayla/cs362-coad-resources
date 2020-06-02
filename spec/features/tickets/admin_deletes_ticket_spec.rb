require 'rails_helper'

RSpec.describe 'Deleting a Ticket', type: :feature do
  before :each do
    @ticket = FactoryBot.create(:ticket)
    @user = FactoryBot.create(:user, :admin)
    log_in_as(@user)
  end

  it "displays a success message" do
    visit ticket_path(@ticket)
    click_link 'Delete'
    expect(page).to have_content('Ticket')
    expect(page).to have_content('was deleted')
  end
end
