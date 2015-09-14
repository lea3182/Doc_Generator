require "rails_helper"

RSpec.describe DocMailer, type: :mailer do
  describe "doc_confirmation" do
    let(:mail) { DocMailer.doc_confirmation }

    it "renders the headers" do
      expect(mail.subject).to eq("Doc confirmation")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

end
