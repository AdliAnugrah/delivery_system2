class OrderMailer < ActionMailer::Base
  # misal email pengirim nya di set dari admin@delivery-system.com
  default from: "admin@delivery-system.com"

  # ini kan pseudo code
  # buat method kirim email ketika user selesai checkout 
  # parameter :
  # order - instance object order dari user yang checkout order

  def send_order(order)
    # simpan parameter order ke dalam instance variable
    @order = order 

    # karena instance dari order terelasi dengan user
    # note : order belongs_to user, and user has_many orders
    # maka simpan variabel user melalui order
    @user  = order.user

    # setelah itu kirim email ke user
    mail to: @user.email, subject: 'Delivery System - Your Purchanse Order' do |format|
      format.html
    end
  end
end
