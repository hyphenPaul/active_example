require 'test_helper'
require 'fixtures/dream'
require 'fixtures/insecure'
require 'fixtures/stutterer'

class ActiveExampleTest < ActiveSupport::TestCase
  test 'dream has the right attributes and attribute methods' do
    dream = Dream.new
    dream.length = 120
    dream.type = 'sexy'
    dream.description = "would'nt you like to know"

    assert_equal 120, dream.length
    assert_equal 'sexy', dream.type
    assert_equal 'would\'nt you like to know', dream.description

    dream.clear_description
    dream.turn_type_to_ding_dong

    assert_nil dream.description
    assert_equal 'DING DONG', dream.type
    assert dream.length?
  end

  test 'insecure needs to be awesome' do
    dude = Insecure.new
    dude.description = "I'm an alright guy"
    assert !dude.valid? # needs to be called to populate errors
    assert_equal "This isn't awesome enough!!", dude.errors[:description].first
  end

  test 'make sure that the stutterer stutters' do
    jimmy_two_times = Stutterer.new('get the papers')
    assert_equal 'get the papers get the papers', jimmy_two_times.talk
  end
end
