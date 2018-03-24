# frozen_string_literal: true

class Result
  attr_accessor :success
  attr_accessor :message

  def initialize(status, message)
    @success = status == :successful
    @message = message
  end

  def self.successful
    Result.new(:successful, nil)
  end

  def self.failed(message)
    Result.new(:failed, message)
  end
end
