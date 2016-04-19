require 'test_helper'

class PatientTest < ActiveSupport::TestCase
    def setup
        @patient = Patient.new(name: "Jhon", email: "jhon@example.com")
    end
    
    test "patient should be valid" do
        assert @patient.valid?
    end
    
    test "name should be present" do
        @patient.name = " "
        assert_not @patient.valid?
    end
    
    test "name length should not be too long" do 
        @patient.name = "a" * 101
        assert_not @patient.valid?
    end
    
    test "name length should not be too short" do
        @patient.name = "aa"
        assert_not @patient.valid?
    end
    
    test "email should be present" do
        @patient.email = " "
        assert_not @patient.valid?
    end
    
    test "name length should not be within bounds" do 
        @patient.name = "a" * 101 + "@example.com"
        assert_not @patient.valid?
    end
    
    test "email address should be unique" do
        dup_patient = @patient.dup
        dup_patient.email = @patient.email.upcase
        @patient.save
        assert_not dup_patient.valid?
    end
    
    test "email validation should accept valid addresses" do
        valid_addresses = %w[user@eee.com R_TTD-DS@eee.hello.org user@example.com first.last@eem.au laura+joe@monk.cm]
        valid_addresses.each do |va|
            @patient.email = va
            assert @patient.valid?, '#{va.inspect} should be valid'
        end
    end
    
    test "email validation should reject invalid addresses" do
        invalid_addresses = %w[user@example,com user_at_eee.org user.name@example. eee@i_am_.com foo@ee+aar.com]
        invalid_addresses.each do |ia|
            @patient.email = ia
            assert_not @patient.valid?, '#{ia.inspect} should be invalid'
        end
    end
    
end