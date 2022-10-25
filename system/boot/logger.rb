Application.boot(:logger) do
  init do
    require 'logger'
  end

  start do
    logger = Logger.new($stdout)

    logger.level = Logger::WARN if Application.env == 'test'

    register(:logger, logger)
  end
end
