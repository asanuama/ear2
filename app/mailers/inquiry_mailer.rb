class InquiryMailer < ApplicationMailer
  default from: "moeko.a980@gmail.com"   # 送信元アドレス

  def received_email(inquiry)
    @inquiry = inquiry
    mail(:to => inquiry.email, :subject => 'お問い合わせを承りました')
  end
end
