class ContextData < TransformStep

  def transform(original_event, processing_units, load_commands, pipeline_ctx)
    processing_units.each do |processing_unit|
      next if processing_unit[:in_context].nil? || processing_unit[:in_context][:user_agent].nil?

      user_agent = processing_unit[:in_context][:user_agent]

      browser = Browser.new(user_agent)

      processing_unit[:in_context][:platform]                    = browser.platform.name
      processing_unit[:in_context][:platform_version]            = browser.platform.version
      processing_unit[:in_context][:runtime]                     = browser.name
      processing_unit[:in_context][:runtime_version]             = browser.version
      processing_unit[:in_context][:device]                      = browser.device.name
    end
  end

end