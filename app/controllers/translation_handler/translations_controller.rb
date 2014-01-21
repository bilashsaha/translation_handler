module TranslationHandler
  class TranslationsController < ApplicationController
    layout 'application'

    $element = 0

    def make_html(hash, opts = {})
      return if !hash.is_a?(Hash)
      indent_level = opts.fetch(:indent_level) { 0 }
      out = " " * indent_level + "<ul>"
      hash.each do |key, value|
        out += " " * (indent_level + 2) + "<li><strong>#{key}:</strong>"
        if value.is_a?(Hash)
          out += "" + make_html(value, :indent_level => indent_level + 2) + " " * (indent_level + 2) + "</li>"
        else
          $element += 1
          if value.length > 150
            out += "<textarea class='translation_field' name='field_#{$element}'>#{value}</textarea></li>"
          else
            out += "<input class='translation_field' type='text' name='field_#{$element}' value='#{value}'></input></li>"
          end


        end
      end
      out += " " * indent_level + "</ul>"
    end


    def prepare_yml_hash(hash)
      return if !hash.is_a?(Hash)
      hash.each do |key, value|
        if value.is_a?(Hash)
          prepare_yml_hash(value)
        else
          $element += 1
          hash[key] = params["field_#{$element}"]
        end
      end
    end


    def update
      base_locale_file = YAML.load_file(Rails.root + "config/locales/#{params[:id]}.yml").to_hash
      $element = 0
      prepared_yaml = prepare_yml_hash(base_locale_file).to_yaml
      #raise prepared_yaml.inspect
      File.open(Rails.root + "config/locales/#{params[:id]}.yml", "w") do |f|
        f << prepared_yaml
      end
      redirect_to translation_handler_translations_url, :notice => "#{params[:id]} updated Successfully !"
    end

    def index
      @available_locales = []
      Dir.glob("#{Rails.root}/config/locales/*.yml").each do |locale|
        @available_locales << locale.split('/').last.split('.yml').first
      end
    end

    def edit
      base_locale_file = YAML.load_file(Rails.root + "config/locales/#{params[:id]}.yml").to_hash
      $element = 0
      @html = make_html(base_locale_file, {})
    end

    def new
    end

    def create
      filename = params[:language]
      base_locale_file = YAML.load_file(Rails.root + "config/locales/en.yml").to_hash["en"]
      prepared_yaml = {filename => base_locale_file}.to_yaml
      File.open(Rails.root + "config/locales/#{params[:language]}.yml", "w") do |f|
        f << prepared_yaml
      end
      redirect_to translation_handler_translations_url, :notice => "#{params[:language]} created Successfully !"
    end

  end
end
