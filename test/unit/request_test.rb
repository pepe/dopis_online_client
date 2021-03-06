require 'test_helper'

module DopisOnlineClient
  class RequestTest < Test::Unit::TestCase

    context "Request#deliver" do

      setup do
        FakeWeb.register_uri(:post, "https://online3.postservis.cz/cmdedopis/dopisonline.php", :body => File.read(File.join(File.dirname(__FILE__),'../fixtures/success.xml')))

        DopisOnlineClient.base_uri 'https://online3.postservis.cz/cmdedopis'
        DopisOnlineClient.auth('jmeno','heslo')
        @response = DopisOnlineClient::Request.new(:pdf_file_path=>File.join(File.dirname(__FILE__),'../fixtures/letter.pdf')).deliver
      end

      should "return DopisOnlineClient::Response" do
        assert_equal true, @response.kind_of?(DopisOnlineClient::Response)
      end

    end

  end
end
