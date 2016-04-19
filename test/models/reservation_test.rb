require 'test_helper'

class ReservationTest < ActiveSupport::TestCase
    
    def setup
        @patient = Patient.create(name: "Bob", email: "bob@example.com")
        @reservation = @patient.reservations.build(name: "Chicken pop", summary: "Flu symtomps",
        description: "Watery nose, fever and lost appetite, fatigue")
    end
    
    test "reservation should be valid" do
        assert @reservation.valid?
    end
    
    test "patient_id should be present" do
        @reservation.patient_id = nil
        assert_not @reservation.valid?
    end
    
    test "name should be present" do
        @reservation.name = " "
        assert_not @reservation.valid?
    end
    
    test "name length should not be too long" do 
        @reservation.name = "a" * 101
        assert_not @reservation.valid?
    end
    
    test "name length should not be too short" do
        @reservation.name = "aaaa"
        assert_not @reservation.valid?
    end
    
    test "summary should be present" do
        @reservation.summary = " "
        assert_not @reservation.valid?
    end
    
    test "summary length should not be too long" do
        @reservation.summary = "a" * 151
        assert_not @reservation.valid?
    end
    
    test "summary length should not be too short" do
        @reservation.summary = "a" * 9
        assert_not @reservation.valid?
    end
    
    test "description must be present" do
        @reservation.description = " "
        assert_not @reservation.valid?
    end
    
    test "description should not be too long" do
        @reservation.description = "a" * 501
        assert_not @reservation.valid?
    end
    
    test "description should not be too short" do
        @reservation.description = "a" * 19
        assert_not @reservation.valid?
    end
end