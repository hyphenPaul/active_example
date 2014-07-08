class Stutterer < ActiveExample::Talker
  before_talk do
    @message = 2.times(@message).to_a.join(' ')
  end
end
