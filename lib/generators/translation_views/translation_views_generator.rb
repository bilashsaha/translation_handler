class TranslationViewsGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('../templates', __FILE__)

  def generate
    root = File.expand_path(File.join(File.dirname(__FILE__), '..', '..', '..', 'app', 'views', 'translation_handler'))
    FileUtils.cp_r root,'app/views/'
    puts 'Your views are at app/views/translate_manager/translations/ .. You can edit it\'s look and feel :-) '
  end

end
