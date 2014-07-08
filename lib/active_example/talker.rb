module ActiveExample
  class Talker
    extend ActiveModel::Callbacks

    attr_accessor :message
    define_model_callbacks :talk

    def initialize(message)
      @message = message
    end

    def talk
      run_callbacks(:talk) do
        message
      end
    end
  end
end
