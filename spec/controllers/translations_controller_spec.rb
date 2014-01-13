require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe TranslationHandler::TranslationsController, :type => :controller do
  render_views

  it "Should render translation list page" do
    get :index
    response.should be_success
    assigns(:available_locales).should be_kind_of(Array)
  end

  it "Should render edit translation page" do
    get :edit, :id => :en
    response.should be_success
    assigns(:html).should_not be_nil
  end

  it "Should update translation values according to update" do
    hash = {:en => {:hello => "Hello World", :user => {:attributes => {:email => 'abc@gmail.com', :name => 'first last'}}}}
    File.open(File.expand_path(File.dirname(__FILE__) + '/../../test/dummy/config/locales/en.yml'), "w") do |f|
      f << hash.to_yaml
    end

    put :update, :id => 'en', :field_1 => 'hello test', :field_2 => 'def@yahoo.com', :field_3 => 'last first'

    I18n.t('hello').should == 'hello test'
    I18n.t('user.attributes.email').should == 'def@yahoo.com'
    I18n.t('user.attributes.name').should == 'last first'

    response.should redirect_to(translation_handler_translations_path)

  end

end