require 'spec_helper'

describe "Deactive user on failed charge" do
  let(:event_data) do
    {
      "id" => "evt_17lDflFbpquSrt2NWKojV2hq",
      "object" => "event",
      "api_version" => "2015-10-16",
      "created" => 1457077709,
      "data" => {
        "object" => {
          "id" => "ch_17lDflFbpquSrt2NphBapfbn",
          "object" => "charge",
          "amount" => 999,
          "amount_refunded" => 0,
          "application_fee" => nil,
          "balance_transaction" => nil,
          "captured" => false,
          "created" => 1457077709,
          "currency" => "usd",
          "customer" => "cus_80wx4aorPgHagd",
          "description" => "payment to fail",
          "destination" => nil,
          "dispute" => nil,
          "failure_code" => "card_declined",
          "failure_message" => "Your card was declined.",
          "fraud_details" => {},
          "invoice" => nil,
          "livemode" => false,
          "metadata" => {},
          "order" => nil,
          "paid" => false,
          "receipt_email" => nil,
          "receipt_number" => nil,
          "refunded" => false,
          "refunds" => {
            "object" => "list",
            "data" => [],
            "has_more" => false,
            "total_count" => 0,
            "url" => "/v1/charges/ch_17lDflFbpquSrt2NphBapfbn/refunds"
          },
          "shipping" => nil,
          "source" => {
            "id" => "card_17lDeJFbpquSrt2NxzdkMtz8",
            "object" => "card",
            "address_city" => nil,
            "address_country" => nil,
            "address_line1" => nil,
            "address_line1_check" => nil,
            "address_line2" => nil,
            "address_state" => nil,
            "address_zip" => nil,
            "address_zip_check" => nil,
            "brand" => "Visa",
            "country" => "US",
            "customer" => "cus_80wx4aorPgHagd",
            "cvc_check" => "pass",
            "dynamic_last4" => nil,
            "exp_month" => 12,
            "exp_year" => 2020,
            "fingerprint" => "ZzW6zll4koytScKS",
            "funding" => "credit",
            "last4" => "0341",
            "metadata" => {},
            "name" => nil,
            "tokenization_method" => nil
          },
          "source_transfer" => nil,
          "statement_descriptor" => nil,
          "status" => "failed"
        }
      },
      "livemode" => false,
      "pending_webhooks" => 1,
      "request" => "req_81GCqLr2wg7exx",
      "type" => "charge.failed"
    }
  end

  it "deativate a user with the web hook data form stripe for charge failed", :vcr do
    alice = Fabricate(:user, customer_token: "cus_80wx4aorPgHagd")
    post "/stripe_events", event_data
    expect(alice.reload).not_to be_active
  end
end
