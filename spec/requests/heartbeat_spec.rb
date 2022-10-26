# frozen_string_literal: true

require 'spec_helper'

describe 'GET /heartbeat' do
  before { get '/heartbeat' }

  it 'returns 200 HTTP status' do
    expect(response).to have_http_status :ok
  end

  it 'returns OK in the response body' do
    expect(response.body).to eq 'OK'
  end
end
