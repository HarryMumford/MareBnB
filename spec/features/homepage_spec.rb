feature 'Homepage' do

  scenario 'Show MareBnB' do
    visit '/'
    expect(page).to have_content("MareBnB")
  end

end
