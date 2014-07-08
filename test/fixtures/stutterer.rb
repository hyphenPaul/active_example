class Stutterer < ActiveExample::Talker
  before_talk do
    @message = "#{message} #{message}"
  end
end
