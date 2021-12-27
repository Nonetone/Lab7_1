# frozen_string_literal: true

require 'faker'
require 'minitest/autorun'
require_relative 'lab7_1_main'

class Test < MiniTest::Test

    def setup
        @input_file_name = 'F.txt'
        @output_file_name = 'G.txt'
    
        generate_input_file
    end
    
    def test_generate_file_creates
        func(Array.new(10) { 1 }, 10)
    
        assert File.exist?(input_file_name)
    end

    def test_first
        func(Array.new(10) { 1 }, 10)
        file_f = File.new('F.txt', 'r')
        arr = file_f.gets.split.map(&:to_i)
        [0,20,40,60].each { |ind| 
            assert_equal(Array.new(10) { 1 }, arr[ind..ind+9])
            assert_equal(Array.new(10) { -1 }, arr[ind + 10..ind + 19])
        }
        file_f.close
    end

    def test_second
        func(Array.new(10) { 1 }, 10)
        scndf
        ord = Array.new(5) { 1 } + Array.new(5) { -1 }
        file_p = File.new('P.txt', 'r')
        arr = file_p.gets.split.map(&:to_i)
        (0..7).each { |ind| 
                    assert_equal(ord, arr[ind * 10..ind * 10 +9])}
                    file_p.close
    end
    
    def teardown
        File.delete(input_file_name) if File.exist?(input_file_name)
        File.delete(output_file_name) if File.exist?(output_file_name)
    end

    private

    attr_reader :input_file_name, :output_file_name
  
    def generate_input_file
      sentence = Faker::Lorem.sentence
      File.open(input_file_name, 'w') { |file| file.write sentence }
      sentence
    end
end

    
    